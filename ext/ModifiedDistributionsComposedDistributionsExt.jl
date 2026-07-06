# ModifiedDistributions × ComposedDistributions
#
# Modifiers across a composed tree. A composed `Sequential` chain observes one
# scalar quantity — `observed_distribution`, the convolved total of its steps —
# so a modifier applied to the chain modifies that observed quantity: the
# chain collapses first, then the modifier wraps the resulting univariate
# distribution. The univariate composers (`Resolve`, `Compete`, `Choose`, a
# `Convolved`) need no methods here: the modifier constructors accept any
# `UnivariateDistribution` directly. A `Parallel` has no single observed scalar,
# so it stays unsupported (no methods are added for it).
#
# The reverse direction — a modified leaf INSIDE a composed tree (`free_leaf` /
# `rewrap_leaf` / shared tags) — lives upstream in ComposedDistributions'
# `ComposedDistributionsModifiedDistributionsExt`.
#
# Function owner: ModifiedDistributions (`affine` / `weight` / `thin` /
# `cumulative` / `map_series`). Type owner: ComposedDistributions
# (`Sequential`). The extension depends on both, so there is no piracy.
module ModifiedDistributionsComposedDistributionsExt

import ModifiedDistributions: affine, weight, thin, cumulative, map_series
using ComposedDistributions: Sequential, observed_distribution

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
map_series(d::Sequential, op) = map_series(observed_distribution(d), op)

end # module
