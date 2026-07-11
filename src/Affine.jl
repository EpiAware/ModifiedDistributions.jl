@doc """

The distribution of a deterministic affine transform `Y = scale * X + shift`
of an inner distribution `X`, with `scale > 0` and any real `shift`.

For a continuous inner distribution, computed by the change-of-variables for a
strictly increasing affine map: with `x = (y - shift) / scale`,

```math
f_Y(y) = f_X\\!\\left(\\frac{y - \\text{shift}}{\\text{scale}}\\right)
         \\frac{1}{\\text{scale}}, \\qquad
F_Y(y) = F_X\\!\\left(\\frac{y - \\text{shift}}{\\text{scale}}\\right).
```

For a discrete inner distribution, the probability mass moves to the rescaled
lattice without the Jacobian term: `P(Y = y) = P(X = (y - shift) / scale)`.

`Affine` is a `UnivariateDistribution` with the value support of the inner
distribution, so it works anywhere a distribution is expected.

# See also
- [`affine`](@ref): constructor function
"""
struct Affine{D <: UnivariateDistribution, T <: Real, S <: ValueSupport} <:
       AbstractModifiedDistribution{Univariate, S}
    "The inner distribution being transformed."
    dist::D
    "The positive multiplicative scale."
    scale::T
    "The additive shift."
    shift::T

    function Affine(dist::D, scale::T, shift::T) where {
            D <: UnivariateDistribution, T <: Real}
        scale > zero(scale) ||
            throw(ArgumentError("scale must be positive"))
        new{D, T, Distributions.value_support(D)}(dist, scale, shift)
    end
end

@doc "

Create an affine-transformed distribution `Y = scale * X + shift`.

# Arguments
- `dist`: the inner distribution `X`.

# Keyword Arguments
- `scale`: positive multiplicative factor (default `1`).
- `shift`: additive offset (default `0`).

# Examples
```@example
using ModifiedDistributions, Distributions

d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
logpdf(d, 5.0)
```

# See also
- [`Affine`](@ref): the wrapped type
"
function affine(dist::UnivariateDistribution; scale::Real = 1, shift::Real = 0)
    s, h = promote(float(scale), float(shift))
    return Affine(dist, s, h)
end

# Map an observed `y` back to the inner variate `x = (y - shift) / scale`.
_affine_inv(d::Affine, y::Real) = (y - d.shift) / d.scale

# Parameter extraction: inner params followed by the affine pair.
params(d::Affine) = (params(d.dist)..., d.scale, d.shift)

Base.eltype(::Type{<:Affine{D, T}}) where {D, T} = promote_type(eltype(D), T)

function minimum(d::Affine)
    m = minimum(d.dist)
    return isinf(m) ? oftype(d.scale * m, m) : d.scale * m + d.shift
end

function maximum(d::Affine)
    m = maximum(d.dist)
    return isinf(m) ? oftype(d.scale * m, m) : d.scale * m + d.shift
end

insupport(d::Affine, y::Real) = insupport(d.dist, _affine_inv(d, y))

@doc "

Compute the probability density function.

See also: [`logpdf`](@ref)
"
pdf(d::Affine, y::Real) = exp(logpdf(d, y))

@doc "

Compute the log probability density function via change of variables. For a
continuous inner distribution this includes the log-Jacobian `-log(scale)`; for
a discrete inner distribution the mass transforms without it.

See also: [`pdf`](@ref), [`cdf`](@ref)
"
logpdf(d::Affine, y::Real) = logpdf(d.dist, _affine_inv(d, y)) - log(d.scale)

# Discrete pmf: P(Y = y) = P(X = (y - shift) / scale), no Jacobian. Off-lattice
# points map to non-support inner values, which the inner logpdf sends to -Inf.
function logpdf(d::Affine{<:UnivariateDistribution, <:Real, Discrete}, y::Real)
    return logpdf(d.dist, _affine_inv(d, y))
end

@doc "

Compute the cumulative distribution function.

See also: [`logcdf`](@ref), [`quantile`](@ref)
"
cdf(d::Affine, y::Real) = cdf(d.dist, _affine_inv(d, y))

@doc "

Compute the log cumulative distribution function.

See also: [`cdf`](@ref)
"
logcdf(d::Affine, y::Real) = logcdf(d.dist, _affine_inv(d, y))

@doc "

Compute the complementary cumulative distribution function via change of
variables (avoids the `1 - cdf` fallback, keeping precision in the upper tail).

See also: [`cdf`](@ref), [`logccdf`](@ref)
"
ccdf(d::Affine, y::Real) = ccdf(d.dist, _affine_inv(d, y))

@doc "

Compute the log complementary cumulative distribution function.

See also: [`ccdf`](@ref)
"
logccdf(d::Affine, y::Real) = logccdf(d.dist, _affine_inv(d, y))

# Batched observations. A vector observation on a modifier is per-point (the
# result is a vector), unlike the Product{Weighted} joint-scalar convention.
# The whole batch is transformed and handed to `_batched_eval`, which makes
# one inner call when the inner distribution declares a specialised batched
# method (e.g. a convolved distribution's single-solve quadrature) and a
# per-point scalar map otherwise.

@doc "

Compute the log probability density for a vector of observations, per point.

The whole transformed batch reaches the inner distribution in one call when
it provides a batched `logpdf`, then the log-Jacobian `-log(scale)` applies
elementwise (continuous inner distributions only). A vector observation on
a modifier is per-point (a vector result), unlike the `Product{<:Weighted}`
joint-scalar convention.

See also: [`pdf`](@ref)
"
function logpdf(d::Affine, y::AbstractVector{<:Real})
    return _batched_eval(logpdf, d.dist, _affine_inv.(Ref(d), y)) .-
           log(d.scale)
end

# Discrete pmf batch: mass moves without the Jacobian, mirroring the scalar
# discrete specialisation.
function logpdf(d::Affine{<:UnivariateDistribution, <:Real, Discrete},
        y::AbstractVector{<:Real})
    return _batched_eval(logpdf, d.dist, _affine_inv.(Ref(d), y))
end

@doc "

Compute the probability density for a vector of observations, per point
(one batched inner call through the vector [`logpdf`](@ref)).

See also: [`logpdf`](@ref)
"
pdf(d::Affine, y::AbstractVector{<:Real}) = exp.(logpdf(d, y))

@doc "

Compute the cumulative distribution function for a vector of observations,
per point (a single batched inner call when available).

See also: [`cdf`](@ref)
"
function cdf(d::Affine, y::AbstractVector{<:Real})
    return _batched_eval(cdf, d.dist, _affine_inv.(Ref(d), y))
end

@doc "

Compute the log cumulative distribution function for a vector of
observations, per point (a single batched inner call when available).

See also: [`logcdf`](@ref)
"
function logcdf(d::Affine, y::AbstractVector{<:Real})
    return _batched_eval(logcdf, d.dist, _affine_inv.(Ref(d), y))
end

@doc "

Compute the complementary cumulative distribution function for a vector of
observations, per point (a single batched inner call when available).

See also: [`ccdf`](@ref)
"
function ccdf(d::Affine, y::AbstractVector{<:Real})
    return _batched_eval(ccdf, d.dist, _affine_inv.(Ref(d), y))
end

@doc "

Compute the log complementary cumulative distribution function for a vector
of observations, per point (a single batched inner call when available).

See also: [`logccdf`](@ref)
"
function logccdf(d::Affine, y::AbstractVector{<:Real})
    return _batched_eval(logccdf, d.dist, _affine_inv.(Ref(d), y))
end

@doc "

Compute the quantile function (inverse CDF).

See also: [`cdf`](@ref)
"
quantile(d::Affine, p::Real) = d.scale * quantile(d.dist, p) + d.shift

@doc "

Generate a random sample by transforming an inner draw.

See also: [`quantile`](@ref)
"
function Base.rand(rng::AbstractRNG, d::Affine)
    return d.scale * rand(rng, d.dist) + d.shift
end

@doc "

Compute the mean via the affine transform of the inner mean.

See also: [`var`](@ref)
"
mean(d::Affine) = d.scale * mean(d.dist) + d.shift

@doc "

Compute the variance via the affine transform of the inner variance.

See also: [`mean`](@ref)
"
var(d::Affine) = d.scale^2 * var(d.dist)

# Remaining summary statistics via the affine identities. These functions are
# extended by qualified name (they are not imported at the top of the module).
Distributions.std(d::Affine) = d.scale * Distributions.std(d.dist)
Distributions.median(d::Affine) = d.scale * Distributions.median(d.dist) + d.shift
Distributions.mode(d::Affine) = d.scale * Distributions.mode(d.dist) + d.shift
# Skewness and (excess) kurtosis are invariant under a positive affine map.
Distributions.skewness(d::Affine) = Distributions.skewness(d.dist)
Distributions.kurtosis(d::Affine) = Distributions.kurtosis(d.dist)
# Differential entropy picks up the log-Jacobian of the map; discrete entropy
# is invariant under a bijection.
Distributions.entropy(d::Affine) = Distributions.entropy(d.dist) + log(d.scale)
function Distributions.entropy(d::Affine{
        <:UnivariateDistribution, <:Real, Discrete})
    return Distributions.entropy(d.dist)
end
