# ModifiedDistributions × ComposedDistributions
#
# Modifiers across a composed tree. A composed `Sequential` chain observes one
# scalar quantity — `observed_distribution`, the convolved total of its steps —
# so a modifier applied to the chain modifies that observed quantity: the
# chain collapses first, then the modifier wraps the resulting univariate
# distribution. The univariate composers (`Resolve`, `Compete`, `Choose`, a
# `Convolved`) need no methods here: the modifier constructors accept any
# `UnivariateDistribution` directly. A `Parallel` has several INDEPENDENT
# observed endpoints and no single observed scalar, so a modifier applied to it
# is mapped over every branch: the same modifier wraps each endpoint and the
# result is a `Parallel` of the modified branches with the branch names
# preserved.
#
# The reverse direction — a modified leaf INSIDE a composed tree (`free_leaf` /
# `rewrap_leaf` / shared tags) — lives upstream in ComposedDistributions'
# `ComposedDistributionsModifiedDistributionsExt`.
#
# Function owner: ModifiedDistributions (`affine` / `weight` / `thin` /
# `cumulative` / `series_transform` / `modify`). Type owner:
# ComposedDistributions (`Sequential` / `Parallel`). The extension depends on
# both, so there is no piracy.
module ModifiedDistributionsComposedDistributionsExt

import ModifiedDistributions: affine, weight, thin, cumulative,
                              series_transform, modify
using ComposedDistributions: Sequential, Parallel, observed_distribution
# Public composer interface for rebuilding a `Parallel` over modified branches:
# `component_names` reads the ordered branch names, `event` fetches a named
# branch, and the `parallel` constructor reassembles a `Parallel` from
# `name => branch` pairs, preserving the branch names and order.
using ComposedDistributions: parallel, component_names, event

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

end # module
