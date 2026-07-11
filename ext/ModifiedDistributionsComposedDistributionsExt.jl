# ModifiedDistributions × ComposedDistributions
#
# Modifiers across a composed tree. A composed `Sequential` chain observes one
# scalar quantity — `observed_distribution`, the convolved total of its steps —
# so a modifier applied to the chain modifies that observed quantity: the
# chain collapses first, then the modifier wraps the resulting univariate
# distribution. The univariate composers (`Resolve`, `Compete`, a `Convolved`)
# need no methods here: the modifier constructors accept any
# `UnivariateDistribution` directly. `Parallel` and `Choose` are multivariate
# with no single observed scalar to modify, so each modifier verb gives a guided
# rejection (mirroring `observed_distribution`) rather than a bare MethodError.
#
# The reverse direction — a modified leaf INSIDE a composed tree (`free_leaf` /
# `rewrap_leaf` / shared tags) — lives upstream in ComposedDistributions'
# `ComposedDistributionsModifiedDistributionsExt`.
#
# Function owner: ModifiedDistributions (`affine` / `weight` / `thin` /
# `cumulative` / `series_transform` / `modify`). Type owner:
# ComposedDistributions (`Sequential`). The extension depends on both, so
# there is no piracy.
module ModifiedDistributionsComposedDistributionsExt

import ModifiedDistributions: affine, weight, thin, cumulative,
                              series_transform, modify
using ComposedDistributions: Sequential, Parallel, Choose,
                             observed_distribution

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

# A hazard modification of the chain's observed total. The `effect` takes the
# full core surface (a scalar, a callable `effect(t)`, or a per-bin vector) and
# `link`/`method` thread through, so a chain modifies exactly as its collapsed
# observed total would. The `nothing` form mirrors the univariate constructor.
function modify(d::Sequential, effect; link = log, method = nothing)
    return modify(observed_distribution(d), effect; link, method)
end
modify(d::Sequential, ::Nothing; link = log, method = nothing) = d

# --- Multivariate composers: guided rejection -------------------------------
#
# `Parallel` and `Choose` are multivariate with no single observed scalar to
# modify, so every modifier verb throws with guidance (naming the branch or
# alternative) rather than the bare MethodError a missing method gives. The
# wording mirrors `observed_distribution`'s own rejection of these nodes.
const _Multivariate = Union{Parallel, Choose}

function _reject_multivariate(verb, ::Parallel)
    throw(ArgumentError(
        "cannot `$verb` a Parallel: it is multivariate with several " *
        "independent observed endpoints and no single observed scalar to " *
        "modify; apply the modifier to a named branch, e.g. " *
        "`$verb(event(d, name))`"))
end

function _reject_multivariate(verb, ::Choose)
    throw(ArgumentError(
        "cannot `$verb` a Choose: it is multivariate and its observed " *
        "quantity depends on the data-selected alternative, so there is no " *
        "single scalar to modify; apply the modifier to the chosen " *
        "alternative, e.g. `$verb(event(d, :index))`"))
end

function affine(d::_Multivariate; scale::Real = 1, shift::Real = 0)
    return _reject_multivariate("affine", d)
end
weight(d::_Multivariate, args...) = _reject_multivariate("weight", d)
thin(d::_Multivariate, args...) = _reject_multivariate("thin", d)
cumulative(d::_Multivariate) = _reject_multivariate("cumulative", d)
series_transform(d::_Multivariate, op) = _reject_multivariate(
    "series_transform", d)
modify(d::_Multivariate, args...; kwargs...) = _reject_multivariate(
    "modify", d)

end # module
