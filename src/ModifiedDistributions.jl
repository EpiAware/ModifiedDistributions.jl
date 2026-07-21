"""
    ModifiedDistributions

Unary modifiers that wrap exactly one `UnivariateDistribution` from
Distributions.jl: an affine transform ([`affine`](@ref)), a likelihood weight
([`weight`](@ref)), and forward-series transforms ([`thin`](@ref) /
[`cumulative`](@ref)). Also owns the generic [`get_dist`](@ref) unwrap protocol.

When ComposedDistributions.jl is loaded, a package extension additionally lets
the modifier verbs apply across a composed `Sequential` chain by modifying the
univariate scalar the chain observes (its convolved total).

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
# Docstring-template machinery used by src/docstrings.jl (imports are
# centralised here per the kit's import-centralisation gate).
using DocStringExtensions: @template, DOCSTRING, EXPORTS, IMPORTS, TYPEDEF,
                           TYPEDFIELDS, TYPEDSIGNATURES

# Functions we extend (for method extension). `std`/`median`/`mode`/`skewness`/
# `kurtosis`/`entropy` are extended by qualified name in Affine.jl, Weighted.jl
# and Transformed.jl, so they are not imported here.
import Distributions: params, insupport, pdf, logpdf, cdf, logcdf,
                      ccdf, logccdf, quantile, mean, var, sampler,
                      loglikelihood
# Base functions we extend that are re-exported by Distributions.
import Base: minimum, maximum
# Types and constructors we use without extension.
using Distributions: Distributions, Distribution, UnivariateDistribution,
                     DiscreteUnivariateDistribution,
                     VariateForm, Univariate, Continuous, Discrete,
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
# Forward-series transforms (transparent to `logpdf`): `series_transform` is
# the generic verb, `thin`/`cumulative` the specialisations. Renamed from
# `transform` to avoid the DataFrames.transform clash (#35); the distinctive
# name keeps it safely exportable.
export series_transform, thin, cumulative
# `modify`: a hazard modification through a link (proportional or additive).
export modify
# `piecewise_effect`: a piecewise-constant proportional-hazards multiplier,
# closed-form under the log link; `gate` its finite-window special case,
# producing a deliberately defective law (#105).
export piecewise_effect, gate
# The queryable sub-stochastic-law surface: the mass a `modify`d law holds,
# and whether any is missing (#107).
export total_mass, is_defective
# The generic unwrap protocol owned by this package.
export get_dist, get_dist_recursive

# Abstract type hierarchy for the modifier leaves. Included first so every
# concrete wrapper type can subtype `AbstractModifiedDistribution`.
include("interface.jl")

include("Affine.jl")
include("Weighted.jl")
include("Transformed.jl")
include("Modified.jl")
# Discrete-time reporting-hazard vector helpers reused by the discrete
# Modified path; included after Modified.jl defines the link types.
include("reporting_hazard.jl")
include("get_dist.jl")

# Public field accessors for the modifier payloads (get_scale/get_shift,
# get_weight, get_effect/get_link, get_op/get_factor). Included after the
# wrapper types they read (see accessors.jl).
include("accessors.jl")

# Public interface-conformance harness (a public submodule).
include("TestUtils.jl")

# Public API - types that are part of the public interface but not exported.
@static if VERSION >= v"1.11"
    include("public.jl")
else
    # Julia 1.10 compatibility - no public keyword, but structs are accessible.
end

end # module ModifiedDistributions
