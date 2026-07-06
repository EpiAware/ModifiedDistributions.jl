# Forward-transform leaves: a generic transform with thin / cumulative.
#
# A forward transform carries a deterministic operation intended for the count
# series a downstream convolution layer produces. It is the forward dual of
# `Weighted` (which touches `logpdf` only): a forward transform is transparent to
# `logpdf`, delegating every distribution method to the inner distribution, and
# materialises only when a series is passed through its op.
#
# One node type, `Transformed`, carries an op. `thin` and `cumulative` are
# specialised constructors over it with typed ops (so the factor stays
# introspectable and validated); the generic `map_series(d, f)` accepts any
# callable `series -> series` as an escape hatch.
#
# `thin` is mid-migration upstream to a `resolve` + `NoEvent` special case
# (CensoredDistributions.jl#626); the modifier form is kept here.

# The ops.

# Multiply the series by a fixed factor (thinning / rescaling of expected
# counts). `cumulative` accumulates the series. Typed so the factor is readable.
struct ThinOp{T <: Real}
    factor::T
end
struct CumulativeOp end

# Apply one op to a series. A bare callable is its own op (the escape hatch).
_apply_op(op::ThinOp, series) = op.factor .* series
_apply_op(::CumulativeOp, series) = cumsum(series)
_apply_op(op, series) = op(series)

# The op's display parameters (only a numeric factor surfaces; others are pure).
_op_params(op::ThinOp) = (op.factor,)
_op_params(op) = ()

# The generic node.

@doc "

A distribution carrying a forward-transform op, intended for a count series a
downstream convolution layer produces. Transparent to `logpdf` and to every
other distribution method (they delegate to the inner distribution). Construct
with the generic [`map_series`](@ref) or the specialised [`thin`](@ref) /
[`cumulative`](@ref).

# See also
- [`map_series`](@ref), [`thin`](@ref), [`cumulative`](@ref): constructors
"
struct Transformed{D <: UnivariateDistribution, Op} <:
       AbstractModifiedDistribution{Univariate, ValueSupport}
    "The inner distribution."
    dist::D
    "The forward op applied to a convolved series."
    op::Op
end

@doc "

Map a distribution's convolved count series through a forward op.

`map_series(d, op)` carries `op` (a [`thin`](@ref)/[`cumulative`](@ref) op or any
callable `series -> series`) intended for the series a downstream convolution
layer produces. Transparent to `logpdf`. Prefer [`thin`](@ref) /
[`cumulative`](@ref) for the common cases; use `map_series` for an arbitrary
deterministic series map.

Not exported (the name `map` is generic and `map_series` is a rarely-needed
escape hatch); reach it as `ModifiedDistributions.map_series`.

# Arguments
- `d`: the inner distribution.
- `op`: a forward op or a callable `series -> series`.

# Examples
```@example
using ModifiedDistributions, Distributions

d = ModifiedDistributions.map_series(Gamma(2.0, 1.0), s -> 0.5 .* s)
logpdf(d, 2.0) == logpdf(Gamma(2.0, 1.0), 2.0)
```

# See also
- [`thin`](@ref), [`cumulative`](@ref): specialised forward transforms
"
map_series(d::UnivariateDistribution, op) = Transformed(d, op)

@doc "

Thin a distribution's forward count by a probability `p`.

`thin(d, p)` is [`map_series`](@ref) with a fixed factor `p ∈ [0, 1]` intended to
be multiplied into a downstream count series (e.g. ascertainment of cases, the
infection fatality ratio for deaths). Transparent to `logpdf`. `thin(d, nothing)`
returns `d` unchanged.

# Arguments
- `d`: the inner distribution.
- `p`: the thinning probability in ``[0, 1]``.

# Examples
```@example
using ModifiedDistributions, Distributions

d = thin(LogNormal(1.5, 0.5), 0.3)
logpdf(d, 2.0) == logpdf(LogNormal(1.5, 0.5), 2.0)
```

# See also
- [`map_series`](@ref): the generic forward transform
- [`cumulative`](@ref): cumulative-sum a series
"
function thin(dist::UnivariateDistribution, p::Real)
    (zero(p) <= p <= one(p)) ||
        throw(ArgumentError("thin probability must be in [0, 1]"))
    return Transformed(dist, ThinOp(p))
end

thin(dist::UnivariateDistribution, ::Nothing) = dist

@doc "

Accumulate a distribution's forward count series.

`cumulative(d)` is [`transform`](@ref) with a running-sum op intended for a
downstream count series, giving cumulative counts (cumulative incidence,
cumulative deaths). Transparent to `logpdf`.

# Arguments
- `d`: the inner distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = cumulative(Gamma(2.0, 1.0))
logpdf(d, 2.0) == logpdf(Gamma(2.0, 1.0), 2.0)
```

# See also
- [`map_series`](@ref): the generic forward transform
- [`thin`](@ref): a fixed forward factor
"
cumulative(dist::UnivariateDistribution) = Transformed(dist, CumulativeOp())

# Transparency: delegate every distribution method to the inner distribution.

for f in (:minimum, :maximum, :mean, :var, :std, :mode, :median,
    :skewness, :kurtosis, :entropy)
    @eval Distributions.$f(d::Transformed) = Distributions.$f(d.dist)
end

for f in (:pdf, :logpdf, :cdf, :logcdf, :ccdf, :logccdf, :quantile)
    @eval Distributions.$f(d::Transformed, x::Real) = Distributions.$f(d.dist, x)
end

Distributions.insupport(d::Transformed, x::Real) = insupport(d.dist, x)

# The forward op doesn't change the sample type. Without this, batch sampling
# `rand(rng, d, n)` allocates a Vector{Any} (the Sampleable fallback) and
# errors inside Distributions' `_rand!`.
Base.eltype(::Type{<:Transformed{D}}) where {D} = eltype(D)

Base.rand(rng::AbstractRNG, d::Transformed) = rand(rng, d.dist)

# The forward op never touches sampling, so batch sampling can use the inner
# distribution's specialised sampler directly.
sampler(d::Transformed) = sampler(d.dist)

Distributions.params(d::Transformed) = (params(d.dist)..., _op_params(d.op)...)

# The forward op the convolution layer applies.

# Peel forward-transform wrappers to the underlying distribution, returning
# `(dist, ops)` where `ops` is the ordered tuple of ops to apply to a series. A
# non-transform leaf has no ops.
_peel_forward(d) = (d, ())
function _peel_forward(d::Transformed)
    inner, ops = _peel_forward(d.dist)
    return inner, (ops..., d.op)
end

# Apply a tuple of forward ops to a series, in order.
function _apply_forward_ops(series, ops)
    foldl((s, op) -> _apply_op(op, s), ops; init = series)
end
