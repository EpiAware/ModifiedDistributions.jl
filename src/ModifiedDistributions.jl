"""
    ModifiedDistributions

Unary modifiers that wrap exactly one `UnivariateDistribution` from
Distributions.jl: an affine transform ([`affine`](@ref)), a likelihood weight
([`weight`](@ref)), and forward-series transforms ([`thin`](@ref) /
[`cumulative`](@ref)). Also owns the generic [`get_dist`](@ref) unwrap protocol.

# Examples
```@example
using ModifiedDistributions, Distributions

d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
wd = weight(d, 10.0)
get_dist(wd) === d
```
"""
module ModifiedDistributions

using Random: AbstractRNG

# Functions we extend (for method extension). `std`/`median`/`mode`/`skewness`/
# `kurtosis`/`entropy` are extended by qualified name in Affine.jl, Weighted.jl
# and Transformed.jl, so they are not imported here.
import Distributions: params, insupport, pdf, logpdf, cdf, logcdf,
                      ccdf, logccdf, quantile, mean, var, sampler,
                      loglikelihood
# Base functions we extend that are re-exported by Distributions.
import Base: minimum, maximum
# Types and constructors we use without extension.
using Distributions: Distributions, UnivariateDistribution, Continuous,
                     ValueSupport, Product, product_distribution

# Register the standard EpiAware docstring conventions before any
# docstrings are defined (see src/docstrings.jl).
include("docstrings.jl")

# Exported user-facing constructors. The wrapper types (`Affine`, `Weighted`,
# `Transformed`) are marked public (see public.jl) rather than exported.
# `affine`: a deterministic scale + shift of a distribution.
export affine
# `weight`: a likelihood weight applied to `logpdf`.
export weight
# Forward-series transforms (transparent to `logpdf`): `transform` is the
# generic verb, `thin`/`cumulative` the specialisations.
export transform, thin, cumulative
# The generic unwrap protocol owned by this package.
export get_dist, get_dist_recursive

include("Affine.jl")
include("Weighted.jl")
include("Transformed.jl")
include("get_dist.jl")

# Public API - types that are part of the public interface but not exported.
@static if VERSION >= v"1.11"
    include("public.jl")
else
    # Julia 1.10 compatibility - no public keyword, but structs are accessible.
end

end # module ModifiedDistributions
