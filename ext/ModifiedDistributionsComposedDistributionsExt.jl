# ModifiedDistributions × ComposedDistributions
#
# This extension is the ONE seam between the two packages (ComposedDistributions
# no longer carries a reverse extension of its own, #170): it owns both
# directions of interop.
#
# 1. A modifier applied to a composed tree. A composed `Sequential` chain
#    observes one scalar quantity — `observed_distribution`, the convolved
#    total of its steps — so a modifier applied to the chain modifies that
#    observed quantity: the chain collapses first, then the modifier wraps the
#    resulting univariate distribution. The univariate composers (`Resolve`,
#    `Compete`, `Choose`, a `Convolved`) need no methods here: the modifier
#    constructors accept any `UnivariateDistribution` directly. A `Parallel`
#    has several INDEPENDENT observed endpoints and no single observed scalar,
#    so a modifier applied to it is mapped over every branch: the same
#    modifier wraps each endpoint and the result is a `Parallel` of the
#    modified branches with the branch names preserved.
#
# 2. A modified leaf (`Affine` / `Weighted` / `Transformed` / `Modified`)
#    INSIDE a composed tree. Its modification (scale/shift, likelihood weight,
#    forward transform, hazard effect) is fixed structure, not a free
#    parameter, so inside a composed tree it must peel like any other leaf
#    wrapper — `free_leaf` reaches the inner free delay, `rewrap_leaf` rebuilds
#    the modifier around a new inner delay, and `shared_tag` sees a tag
#    through it. `Transformed`'s `ThinOp` is the one exception: `thin`'s
#    reporting probability is a FREE parameter (CensoredDistributions'
#    `forward_transform.jl` precedent), so it also plugs into the core's
#    `extra_leaf_params`/`set_extra_leaf_params` hooks as a `:thin` entry,
#    surfacing as a `:thin` row in `params_table` and round-tripping through
#    `update`. The modifier payloads are read through our own public accessors
#    (`get_dist`/`get_scale`/`get_shift`/`get_weight`/`get_effect`/`get_link`/
#    `get_op`/`get_factor`, #61) rather than struct fields, so a field rename
#    here cannot silently break this seam.
#
# Function owner: for direction 1, ModifiedDistributions (`affine` / `weight` /
# `thin` / `cumulative` / `series_transform` / `modify`); type owner is
# ComposedDistributions (`Sequential` / `Parallel`). For direction 2, function
# owner is ComposedDistributions (`free_leaf`/`rewrap_leaf`/`shared_tag`/
# `uncertain_specs`/`extra_leaf_params`/`set_extra_leaf_params`/`leaf_mean`/
# `leaf_var`/`instantiate`/`has_varying`), and `get_dist` is ours. Either way
# the extension depends on both packages' types, so there is no piracy.
#
# 3. The generated flat-vector codec's type-level companion (#189): the
# instance-level hooks above (`free_leaf`, `extra_leaf_params`, ...) are not
# enough for CD's `@generated` `unflatten`/`flat_dimension`/`flatten` -- those
# work from a leaf's TYPE alone, before any instance exists. This extension's
# `__init__` (bottom of this file) registers the four modifier types with
# `ComposedDistributions.register_leaf_wrapper!` rather than adding a direct
# dispatch method to CD's `_leaf_free_type`/`_extra_names_of`: a `@generated`
# function's generator cannot reliably see such a method if it is added after
# the generator has already compiled (confirmed Julia semantics gap,
# ComposedDistributions#188/#189), so CD's registry takes plain data (a
# type-parameter index, a fixed extra-names tuple) instead, populated at
# `__init__` time -- before any code outside this package could construct one
# of these leaf types.
module ModifiedDistributionsComposedDistributionsExt

import ModifiedDistributions: affine, weight, thin, cumulative,
                              series_transform, modify, get_dist
using ModifiedDistributions: Affine, Weighted, Transformed, Modified, ThinOp,
                             get_scale, get_shift, get_weight, get_effect,
                             get_link, get_op, get_factor
import ComposedDistributions: free_leaf, rewrap_leaf, shared_tag,
                              uncertain_specs, extra_leaf_params,
                              set_extra_leaf_params, leaf_mean, leaf_var,
                              instantiate, has_varying
using ComposedDistributions: Sequential, Parallel, observed_distribution,
                             Shared, AbstractContext, register_leaf_wrapper!
# Public composer interface for rebuilding a `Parallel` over modified branches:
# `component_names` reads the ordered branch names, `event` fetches a named
# branch, and the `parallel` constructor reassembles a `Parallel` from
# `name => branch` pairs, preserving the branch names and order.
using ComposedDistributions: parallel, component_names, event
using Distributions: mean, var

# === Direction 1: a modifier applied to a composed tree =====================

# An affine transform of the chain's observed total.
function affine(d::Sequential; scale::Real = 1, shift::Real = 0)
    return affine(observed_distribution(d); scale, shift)
end

# A likelihood weight on the chain's observed total. The `nothing` and
# missing-weight forms mirror the univariate constructors.
weight(d::Sequential, w::Real) = weight(observed_distribution(d), w)
weight(d::Sequential) = weight(observed_distribution(d))
weight(d::Sequential, ::Nothing) = d
function weight(d::Sequential, weights::AbstractVector{<:Real})
    return weight(observed_distribution(d), weights)
end

# Forward-series transforms on the chain's observed total.
thin(d::Sequential, p::Real) = thin(observed_distribution(d), p)
thin(d::Sequential, ::Nothing) = d
cumulative(d::Sequential) = cumulative(observed_distribution(d))
series_transform(d::Sequential, op) = series_transform(observed_distribution(d), op)

# A hazard modification of the chain's observed total. The `nothing` form
# mirrors the univariate constructor.
function modify(d::Sequential, effect::Real; link = log)
    return modify(observed_distribution(d), effect; link)
end
modify(d::Sequential, ::Nothing) = d

# --- Parallel: map the modifier over every independent endpoint ---
#
# A `Parallel` has no single observed scalar, so a modifier applies to ALL of
# its independent branches: wrap each branch with the same modifier and rebuild
# a `Parallel` of the modified branches. Reassembling through the public
# `parallel(name => branch, ...)` constructor over `component_names` / `event`
# restores the branch names in order, so labels are preserved; each branch may
# itself be a leaf, a nested `Sequential`/`Parallel`, or a univariate one_of
# composer, so the per-branch call reuses the Sequential methods above and the
# univariate constructors.
function _map_branches(f, d::Parallel)
    return parallel((name => f(event(d, name))
    for name in component_names(d))...)
end

# An affine transform of each branch endpoint.
function affine(d::Parallel; scale::Real = 1, shift::Real = 0)
    return _map_branches(b -> affine(b; scale, shift), d)
end

# A likelihood weight on each branch endpoint. The `nothing` and missing-weight
# forms mirror the univariate/Sequential constructors.
weight(d::Parallel, w::Real) = _map_branches(b -> weight(b, w), d)
weight(d::Parallel) = _map_branches(weight, d)
weight(d::Parallel, ::Nothing) = d
# Per-observation weights build a `Product` per branch, which is multivariate
# and so not a valid `Parallel` branch; the form vectorises a single observed
# scalar across observations, which a multi-endpoint `Parallel` does not have.
# Weight the branches individually or collapse to a single endpoint first.
function weight(d::Parallel, ::AbstractVector{<:Real})
    throw(ArgumentError(
        "per-observation weights (a weight vector) are not defined for a " *
        "Parallel: each branch is an independent endpoint and vector " *
        "weighting builds a multivariate Product per branch. Weight the " *
        "branches individually, or collapse to a single observed endpoint " *
        "first."))
end

# Forward-series transforms on each branch endpoint.
thin(d::Parallel, p::Real) = _map_branches(b -> thin(b, p), d)
thin(d::Parallel, ::Nothing) = d
cumulative(d::Parallel) = _map_branches(cumulative, d)
series_transform(d::Parallel, op) = _map_branches(b -> series_transform(b, op), d)

# A hazard modification of each branch endpoint. The `nothing` form mirrors the
# univariate/Sequential constructor.
function modify(d::Parallel, effect::Real; link = log)
    return _map_branches(b -> modify(b, effect; link), d)
end
modify(d::Parallel, ::Nothing) = d

# === Direction 2: a modified leaf inside a composed tree =====================

# --- free_leaf: reach the inner free delay through a modifier ---------------

free_leaf(d::Affine) = free_leaf(get_dist(d))
free_leaf(d::Weighted) = free_leaf(get_dist(d))
free_leaf(d::Transformed) = free_leaf(get_dist(d))
free_leaf(d::Modified) = free_leaf(get_dist(d))

# --- rewrap_leaf: rebuild the modifier around a new inner delay --------------

function rewrap_leaf(d::Affine, inner)
    return affine(rewrap_leaf(get_dist(d), inner);
        scale = get_scale(d), shift = get_shift(d))
end
function rewrap_leaf(d::Weighted, inner)
    return Weighted(rewrap_leaf(get_dist(d), inner), get_weight(d))
end
function rewrap_leaf(d::Transformed, inner)
    return Transformed(rewrap_leaf(get_dist(d), inner), get_op(d))
end
function rewrap_leaf(d::Modified, inner)
    return modify(rewrap_leaf(get_dist(d), inner), get_effect(d);
        link = get_link(d))
end

# --- shared_tag: see a shared tag through a modifier -----------------------

shared_tag(d::Affine) = shared_tag(get_dist(d))
shared_tag(d::Weighted) = shared_tag(get_dist(d))
shared_tag(d::Transformed) = shared_tag(get_dist(d))
shared_tag(d::Modified) = shared_tag(get_dist(d))

# --- uncertain_specs: see uncertain parameters through a modifier ----------
#
# A modifier over an `uncertain(...)` leaf must still expose the attached
# parameter specs, so `params_table`'s prior column and the marginal `rand`
# see through the modifier exactly like the tag protocol does.

uncertain_specs(d::Affine) = uncertain_specs(get_dist(d))
uncertain_specs(d::Weighted) = uncertain_specs(get_dist(d))
uncertain_specs(d::Transformed) = uncertain_specs(get_dist(d))
uncertain_specs(d::Modified) = uncertain_specs(get_dist(d))

# --- overall moments: use the modifier's own moment, not the free leaf's -----
#
# The per-leaf moment defaults to `mean(free_leaf(leaf))`, which is the free
# delay's — right for the parameter surface, but wrong for a moment when the
# modifier itself changes the distribution. `Affine` has correct analytic
# moments (`scale*mean + shift`, `scale^2*var`) and its `rand` honours the
# transform, so its overall moment must too. `Weighted` / `Transformed`
# delegate their moments straight to the inner delay, so their free-leaf
# moment already agrees — no method needed.

leaf_mean(d::Affine) = mean(d)
leaf_var(d::Affine) = var(d)

# `Modified` has no analytic moment yet (blocked on ModifiedDistributions#44's
# numeric cumulative-hazard path), and `free_leaf` peels it to the inner delay —
# so the default `mean(free_leaf(d))` would silently return the UNMODIFIED
# delay's moment, understating the hazard modification. Error informatively
# instead: a chain containing a hazard-modified step has no overall moment
# until #44 lands (draw the marginal with `rand` meanwhile).
function leaf_mean(d::Modified)
    throw(ArgumentError(
        "a hazard-modified (`Modified`) leaf has no analytic mean; the " *
        "modified moment needs numeric cumulative-hazard integration " *
        "(ModifiedDistributions#44). Draw the marginal with `rand` for a " *
        "Monte-Carlo moment, or exclude the modified step."))
end
function leaf_var(d::Modified)
    throw(ArgumentError(
        "a hazard-modified (`Modified`) leaf has no analytic variance; the " *
        "modified moment needs numeric cumulative-hazard integration " *
        "(ModifiedDistributions#44). Draw the marginal with `rand` for a " *
        "Monte-Carlo moment, or exclude the modified step."))
end

# --- extra_leaf_params / set_extra_leaf_params: surface a thin(...)
# reporting probability as a free parameter ----------------------------------
#
# `thin(d, p)` (a `Transformed` carrying a `ThinOp`) is NOT a fixed-structure
# modifier like the others: `p` enters the per-record likelihood, so it must
# be inventoried by `params_table` and round-tripped by `update` like any
# other leaf parameter (see ComposedDistributions' `introspection.jl` hook
# docstring, and CensoredDistributions' `forward_transform.jl` for the
# precedent this mirrors). It plugs into the generic extra-parameter protocol
# as a `:thin` entry on `[0, 1]`. The peel-through modifiers
# (`Affine`/`Weighted`/`Modified`) forward to their inner delay so a thinned
# leaf still reports its factor underneath any of them.

extra_leaf_params(d::Affine) = extra_leaf_params(get_dist(d))
extra_leaf_params(d::Weighted) = extra_leaf_params(get_dist(d))
extra_leaf_params(d::Modified) = extra_leaf_params(get_dist(d))
function extra_leaf_params(d::Transformed)
    op = get_op(d)
    return op isa ThinOp ?
           (thin = (value = get_factor(op), support = (0.0, 1.0)),) :
           extra_leaf_params(get_dist(d))
end

# Empty-`NamedTuple` identity methods disambiguate the modifier forwards below
# from the core's generic `set_extra_leaf_params(leaf, ::NamedTuple{()})` (both
# would match a modifier with no extras); setting no extras is the identity.
set_extra_leaf_params(d::Affine, ::NamedTuple{()}) = d
set_extra_leaf_params(d::Weighted, ::NamedTuple{()}) = d
set_extra_leaf_params(d::Modified, ::NamedTuple{()}) = d
set_extra_leaf_params(d::Transformed, ::NamedTuple{()}) = d

function set_extra_leaf_params(d::Affine, vals::NamedTuple)
    return affine(set_extra_leaf_params(get_dist(d), vals);
        scale = get_scale(d), shift = get_shift(d))
end
function set_extra_leaf_params(d::Weighted, vals::NamedTuple)
    return Weighted(set_extra_leaf_params(get_dist(d), vals), get_weight(d))
end
function set_extra_leaf_params(d::Modified, vals::NamedTuple)
    return modify(set_extra_leaf_params(get_dist(d), vals),
        get_effect(d); link = get_link(d))
end
function set_extra_leaf_params(d::Transformed, vals::NamedTuple)
    op = get_op(d)
    return op isa ThinOp ? Transformed(get_dist(d), ThinOp(vals.thin)) :
           Transformed(set_extra_leaf_params(get_dist(d), vals), op)
end

# --- get_dist: the composed `Shared` tag is transparent to the unwrap protocol

get_dist(d::Shared) = d.dist

# --- instantiate / has_varying: resolve a Varying leaf through a modifier ---
#
# A modifier wrapping a `Varying` leaf must peel through so the inner Varying
# resolves at a `Context`; without these methods `instantiate` falls to the
# identity `instantiate(::UnivariateDistribution, ctx) = d`, silently scoring
# against the reference, and `has_varying` falls to `false`, so the guard
# never fires. Mirrors the `Shared` descent.

function instantiate(d::Affine, ctx::AbstractContext)
    affine(instantiate(get_dist(d), ctx);
        scale = get_scale(d), shift = get_shift(d))
end
function instantiate(d::Weighted, ctx::AbstractContext)
    Weighted(instantiate(get_dist(d), ctx), get_weight(d))
end
function instantiate(d::Transformed, ctx::AbstractContext)
    Transformed(instantiate(get_dist(d), ctx), get_op(d))
end
function instantiate(d::Modified, ctx::AbstractContext)
    modify(instantiate(get_dist(d), ctx), get_effect(d); link = get_link(d))
end

has_varying(d::Affine) = has_varying(get_dist(d))
has_varying(d::Weighted) = has_varying(get_dist(d))
has_varying(d::Transformed) = has_varying(get_dist(d))
has_varying(d::Modified) = has_varying(get_dist(d))

# --- register with CD's generated-codec type-level registry (#189) ---------
#
# `free_index = 1` for all four: each wrapper's inner distribution is its
# FIRST type parameter (`Affine{D,T,S}`, `Weighted{D,T,S}`, `Transformed{D,
# Op,S}`, `Modified{D,E,L,S}}` all name it `D` first).
#
# `Transformed` needs TWO entries, since whether it owns an extra depends on
# its `Op` type parameter, mirroring `extra_leaf_params`'s own instance-level
# short-circuit exactly (a `ThinOp` owns the `:thin` factor and does not
# forward to the inner delay's own extras; every other op -- `CumulativeOp`,
# a bare callable -- owns none and peels through). The general case is
# registered FIRST and the `ThinOp` case LAST, so the more specific pattern is
# checked first (`register_leaf_wrapper!`'s "later registration wins"
# contract).
#
# Called from `__init__`, not at module top level: `__init__` runs once this
# extension is actually activated (both packages loaded), which is exactly
# when CD's registry needs to be populated -- strictly before any code
# outside this package could construct one of these leaf types (see
# `register_leaf_wrapper!`'s docstring in ComposedDistributions for why that
# ordering rules out the world-age hazard #189 describes).
function __init__()
    register_leaf_wrapper!(Affine; free_index = 1)
    register_leaf_wrapper!(Weighted; free_index = 1)
    register_leaf_wrapper!(Modified; free_index = 1)
    register_leaf_wrapper!(Transformed; free_index = 1)
    register_leaf_wrapper!(Transformed{D, <:ThinOp, S} where {D, S};
        free_index = 1, extra_names = (:thin,))
    return nothing
end

end # module
