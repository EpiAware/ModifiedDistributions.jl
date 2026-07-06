# Abstract type hierarchy: the single-base modifier leaves.
#
# The modifier family shares one supertype (concrete types subtype the
# abstract; shared behaviour and the documented interface contract hang off
# it), ported from CensoredDistributions' integration/composed-stack
# `src/interface.jl` so the planned migration of its modifier leaves here
# (CensoredDistributions#343) is a straight swap.
#
# The abstract is parametric on variate form `F` (`Univariate` today) so it
# preserves `Distribution{F, S}` — and so the `UnivariateDistribution{S}`
# alias for the univariate members, leaving existing dispatch unchanged.

@doc """

Supertype of the single-base modifier leaves that wrap one inner distribution
and modify it: [`Affine`](@ref), [`Weighted`](@ref), [`Transformed`](@ref),
[`Modified`](@ref). CensoredDistributions' `TimeChange` and `Shared` leaves
stay upstream until the migration (CensoredDistributions#343) lands.
Parametric on variate form for symmetry with the upstream hierarchy.

Required methods a concrete subtype implements (the leaf interface):

- an inner base reachable as `.dist` (the default `show` accessor; override
  `ModifiedDistributions._modified_inner` if stored elsewhere) and via
  [`get_dist`](@ref);
- the univariate interface (`pdf` / `logpdf` / `cdf` / `quantile` /
  `minimum` / `maximum` / `insupport` / `params`), forwarded or specialised;
- optionally `Base.show`; the default below prints `Name(inner)`.

The `free_leaf` / `rewrap_leaf` round-trip verbs are owned by
ComposedDistributions.jl and live in its package extension, so they are not
part of this package's contract.

Verify a subtype with
`ModifiedDistributions.TestUtils.test_modified_interface`.
"""
abstract type AbstractModifiedDistribution{F <: VariateForm,
    S <: ValueSupport} <: Distribution{F, S} end

# The inner base a modifier wraps, used by the default `show`. Every current
# subtype stores it as `.dist`; a subtype that does not overrides this
# accessor.
_modified_inner(d::AbstractModifiedDistribution) = d.dist

# Default one-line show for a modifier leaf: `Name(inner)`. Concrete subtypes
# with their own `show` (`Modified`) override it; the transform leaves
# (`Affine`, `Transformed`, `Weighted`) use this and so no longer fall back
# to the bare Distributions default. More specific than the concrete
# subtypes' own `show` and than `Distributions`' `show(::IO, ::Distribution)`,
# so no ambiguity.
function Base.show(io::IO, d::AbstractModifiedDistribution)
    print(io, nameof(typeof(d)), "(", _modified_inner(d), ")")
end
