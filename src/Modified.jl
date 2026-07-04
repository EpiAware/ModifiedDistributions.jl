# The logit link pair for `LogitLink`. Defined locally so the package stays
# Distributions-only (no LogExpFunctions dependency).
_logit(p) = log(p / (one(p) - p))
_logistic(x) = inv(one(x) + exp(-x))

# log(1 - exp(x)) for x <= 0, numerically stable (Maechler 2012). Local
# equivalent of LogExpFunctions.log1mexp, kept here so Distributions stays the
# only dependency.
function _log1mexp(x::Real)
    return x > -oftype(float(x), log(2)) ? log(-expm1(x)) : log1p(-exp(x))
end

# log(exp(a) + exp(b)), numerically stable, tolerating -Inf inputs. Local
# equivalent of LogExpFunctions.logaddexp, kept here for the same reason.
function _logaddexp(a::Real, b::Real)
    isinf(a) && a < 0 && return b
    isinf(b) && b < 0 && return a
    m = max(a, b)
    return m + log1p(exp(-abs(a - b)))
end

@doc """

A link for the hazard modification carried by a [`Modified`](@ref)
distribution.

The modification acts on the hazard through the link `g`,

```math
h^{*}(t) = g^{-1}\\!\\big(g(h(t)) + \\text{effect}\\big),
```

so `log` gives proportional hazards and `identity` gives additive hazards. A
`HazardLink` pairs the link `g` with its inverse `invlink` (`g⁻¹`); the three
named links ([`LogLink`](@ref), [`IdentityLink`](@ref), [`LogitLink`](@ref))
are built-in, and any invertible callable can be wrapped with
[`hazard_link`](@ref). Only the log and identity links have analytic forms;
[`modify`](@ref) rejects the others until numeric integration is supported.

# See also
- [`modify`](@ref): the verb that builds a [`Modified`](@ref) distribution.
"""
struct HazardLink{G, GI}
    "The link `g` mapping a hazard onto the modification scale."
    g::G
    "The inverse link `g⁻¹` mapping back to a hazard."
    invlink::GI
end

@doc """
    LogLink

The log link (proportional hazards): `g = log`, `g⁻¹ = exp`.

`LogLink` scales the survival function, ``S^{*} = S^{e^{\\beta}}``, the
proportional-hazards form, and is the default link of [`modify`](@ref).

# Examples
```@example
using ModifiedDistributions, Distributions

# Proportional-hazards modification of an Exponential delay.
modify(Exponential(1.0), 0.5; link = ModifiedDistributions.LogLink)
```

# See also
- [`modify`](@ref): the verb that consumes a link.
- [`HazardLink`](@ref): the underlying link type.
"""
const LogLink = HazardLink(log, exp)

@doc """
    IdentityLink

The identity link (additive hazards): `g = g⁻¹ = identity`.

`IdentityLink` adds to the cumulative hazard from the support minimum `m`,
``S^{*}(t) = S(t)\\,e^{-\\beta (t - m)}``, the additive-hazards form. Only
non-negative effects and bases with a finite lower support bound are
supported (see [`modify`](@ref)).

# Examples
```@example
using ModifiedDistributions, Distributions

# Additive-hazards modification of an Exponential delay.
modify(Exponential(1.0), 0.5; link = ModifiedDistributions.IdentityLink)
```

# See also
- [`modify`](@ref): the verb that consumes a link.
- [`HazardLink`](@ref): the underlying link type.
"""
const IdentityLink = HazardLink(identity, identity)

@doc """
    LogitLink

The logit link: `g = logit`, `g⁻¹ = logistic`.

`LogitLink` pairs the logit with its logistic inverse. On a continuous base it
requires numeric cumulative-hazard integration, which this package does not
yet provide, so [`modify`](@ref) rejects it with an `ArgumentError`.

# Examples
```@example
using ModifiedDistributions

# The logit link pair; modify rejects it until numeric integration lands.
ModifiedDistributions.LogitLink
```

# See also
- [`modify`](@ref): the verb that consumes a link.
- [`HazardLink`](@ref): the underlying link type.
"""
const LogitLink = HazardLink(_logit, _logistic)

# Show the named links compactly rather than dumping the wrapped functions.
function Base.show(io::IO, l::HazardLink)
    name = l === LogLink ? "LogLink" :
           l === IdentityLink ? "IdentityLink" :
           l === LogitLink ? "LogitLink" :
           "HazardLink($(l.g), $(l.invlink))"
    print(io, name)
    return nothing
end

@doc "

Wrap a link and its inverse as a [`HazardLink`](@ref).

The link `g` maps a hazard onto the scale the additive `effect` acts on, and
`invlink` maps back. Use the built-in [`LogLink`](@ref) or
[`IdentityLink`](@ref) for the analytic choices; this constructor is for a
user-supplied invertible callable. Note that [`modify`](@ref) currently
rejects links other than log and identity, since general links need numeric
cumulative-hazard integration.

# Arguments
- `g`: the link function `g`.
- `invlink`: the inverse link `g⁻¹`.

# Examples
```@example
using ModifiedDistributions

# A complementary-log-log link.
cloglog = ModifiedDistributions.hazard_link(
    h -> log(-log1p(-h)), x -> -expm1(-exp(x)))
```

# See also
- [`modify`](@ref): the verb that consumes a link.
"
hazard_link(g, invlink) = HazardLink(g, invlink)

# Normalise a user-facing `link` argument to a `HazardLink`. The bare functions
# `log`/`identity` and the symbols `:log`/`:identity`/`:logit` map onto the
# named links, so the verb accepts either idiom; a `HazardLink` flows through.
_as_hazard_link(l::HazardLink) = l
_as_hazard_link(::typeof(log)) = LogLink
_as_hazard_link(::typeof(identity)) = IdentityLink
function _as_hazard_link(s::Symbol)
    s === :log && return LogLink
    s === :identity && return IdentityLink
    s === :logit && return LogitLink
    throw(ArgumentError("unknown link $(s); use :log, :identity or :logit"))
end

@doc """

A distribution whose hazard is modified through a link.

`Modified` carries a base distribution `dist`, a hazard `effect` and a
[`HazardLink`](@ref) `link`, and lazily instantiates the modified hazard

```math
h^{*}(t) = g^{-1}\\!\\big(g(h(t)) + \\text{effect}\\big)
```

in `logpdf`/`cdf`/`ccdf`/`rand`, where `g` is the link and
`h(t) = f(t)/S(t)` the base hazard. The modification is never materialised
eagerly, so a `Modified` composes with everything that consumes a
`UnivariateDistribution`.

Two analytic paths are provided, chosen by dispatch on the link:

- [`LogLink`](@ref): proportional hazards, ``S^{*} = S^{e^{\\beta}}``;
- [`IdentityLink`](@ref) with a non-negative effect and a finite lower
  support bound `m`: additive hazards,
  ``S^{*}(t) = S(t)\\,e^{-\\beta (t - m)}``.

Other links (and negative additive effects) need numeric cumulative-hazard
integration and are rejected at construction (see [`modify`](@ref)).

# See also
- [`modify`](@ref): the constructor verb.
"""
struct Modified{D <: UnivariateDistribution, E <: Real, L <: HazardLink} <:
       UnivariateDistribution{Continuous}
    "The base distribution whose hazard is modified."
    dist::D
    "The hazard modification effect on the link scale."
    effect::E
    "The hazard link `g` and its inverse."
    link::L

    function Modified(dist::D, effect::E,
            link::L) where {
            D <: UnivariateDistribution, E <: Real, L <: HazardLink}
        dist isa UnivariateDistribution{Continuous} ||
            throw(ArgumentError(
                "modify requires a continuous base distribution"))
        if L === typeof(IdentityLink)
            effect >= zero(effect) ||
                throw(ArgumentError(
                    "identity-link (additive hazard) effects must be " *
                    "non-negative; a negative additive effect needs " *
                    "hazard clamping and numeric cumulative-hazard " *
                    "integration (see CensoredDistributions#670/#680)"))
            isfinite(minimum(dist)) ||
                throw(ArgumentError(
                    "additive-hazard modification needs a base " *
                    "distribution with a finite lower support bound"))
        elseif L !== typeof(LogLink)
            throw(ArgumentError(
                "general hazard links require numeric integration, " *
                "not yet supported — use link = log or link = identity"))
        end
        new{D, E, L}(dist, effect, link)
    end
end

@doc """

Modify the hazard of a distribution through a link.

`modify(d, effect; link = log)` returns a [`Modified`](@ref) distribution
whose hazard is ``h^{*}(t) = g^{-1}(g(h(t)) + \\text{effect})``, where `g` is
the `link` (`log` for proportional hazards, `identity` for additive hazards).
The modification is instantiated lazily, so the result composes everywhere a
`UnivariateDistribution` does.

Both supported links use closed forms. The identity link requires
`effect >= 0`: a negative additive effect can push the hazard below zero,
which needs hazard clamping and numeric cumulative-hazard integration (see
CensoredDistributions#670/#680); that path stays upstream in
CensoredDistributions, as does the discrete (interval-censored) path. Links
other than log and identity are rejected for the same reason. The identity
link also requires a base with a finite lower support bound `m` (the extra
hazard accrues from `m`, so an unbounded-below base has no valid additive
form).

# Arguments
- `d`: the base continuous distribution.
- `effect`: the scalar hazard modification on the link scale.

# Keyword Arguments
- `link`: the hazard link. The functions `log` (default) and `identity`, the
  symbols `:log`/`:identity`, or a [`HazardLink`](@ref).

# Examples
```@example
using ModifiedDistributions, Distributions

# Proportional hazards: halve the hazard of a LogNormal delay.
d = modify(LogNormal(1.5, 0.5), -log(2.0); link = log)
ccdf(d, 2.0)

# Additive hazards: a constant extra hazard.
da = modify(LogNormal(1.5, 0.5), 0.2; link = identity)
cdf(da, 2.0)
```

# See also
- [`Modified`](@ref): the wrapped type.
- [`hazard_link`](@ref): wrap a custom link pair.
"""
function modify(dist::UnivariateDistribution, effect::Real; link = log)
    return Modified(dist, effect, _as_hazard_link(link))
end

@doc "

Return the distribution unmodified when the effect is `nothing`.

This lets callers thread an optional hazard effect through
`modify(dist, effect)` and pass `nothing` to mean \"no modification\": the
distribution is returned unchanged, mirroring `weight(dist, nothing)`.

# Examples
```@example
using ModifiedDistributions, Distributions

d = LogNormal(1.5, 0.5)
modify(d, nothing) === d
```
"
function modify(dist::UnivariateDistribution, ::Nothing)
    return dist
end

# Parameter extraction: inner params followed by the hazard effect.
params(d::Modified) = (params(d.dist)..., d.effect)

# Hazard modification never changes the support, so element type, support
# bounds and membership all delegate to the base distribution.
Base.eltype(::Type{<:Modified{D}}) where {D} = eltype(D)
minimum(d::Modified) = minimum(d.dist)
maximum(d::Modified) = maximum(d.dist)
insupport(d::Modified, x::Real) = insupport(d.dist, x)

# Show a Modified compactly: its base, effect and link.
function Base.show(io::IO, d::Modified)
    print(io, "Modified(", d.dist, ", ", d.effect, "; link=", d.link, ")")
    return nothing
end

# ============================================================================
# Log link: analytic proportional hazards
# ============================================================================
#
# With β the effect and θ = exp(β), the modified survival is S^θ:
# logS* = θ logS, H* = θ H, h* = θ h, so
#   logpdf* = log h* + logS* = log θ + log h + θ logS
#           = β + (logpdf - logccdf) + θ logccdf
#           = β + logpdf + (θ - 1) logccdf.
# quantile inverts F*(t) = p: S(t)^θ = 1 - p, t = quantile(d, 1 - (1-p)^{1/θ});
# rand inverts S*(t) = U the same way.

const _LogModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Real, typeof(LogLink)}

@doc "

Compute the log survival function on the proportional-hazards path.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_LogModified, x::Real)
    θ = exp(d.effect)
    return θ * logccdf(d.dist, x)
end

@doc "

Compute the log probability density on the proportional-hazards path.

See also: [`pdf`](@ref), [`ccdf`](@ref)
"
function logpdf(d::_LogModified, x::Real)
    insupport(d, x) || return oftype(float(x), -Inf)
    β = d.effect
    θ = exp(β)
    return β + logpdf(d.dist, x) + (θ - one(θ)) * logccdf(d.dist, x)
end

@doc "

Compute the quantile by closed-form inversion of the modified survival.

See also: [`cdf`](@ref)
"
function quantile(d::_LogModified, p::Real)
    θ = exp(d.effect)
    return quantile(d.dist, 1 - (1 - p)^(1 / θ))
end

@doc "

Generate a random sample by closed-form inversion of the modified survival.

See also: [`quantile`](@ref)
"
function Base.rand(rng::AbstractRNG, d::_LogModified)
    θ = exp(d.effect)
    u = rand(rng)
    # S*(t) = S(t)^θ = u  =>  S(t) = u^{1/θ}  =>  F(t) = 1 - u^{1/θ}.
    return quantile(d.dist, 1 - u^(1 / θ))
end

# ============================================================================
# Identity link: analytic additive hazards (effect >= 0)
# ============================================================================
#
# With β >= 0 the effect, the additive hazard is h*(t) = h(t) + β for t in
# the support. The extra hazard accrues from the support minimum m (finite by
# construction), so for t > m
#   H*(t) = H(t) + β (t - m),  S*(t) = S(t) exp(-β (t - m)),
#   logS* = logS - β (t - m),
#   logpdf* = log h*(t) + logS*(t) = log(f(t) + β S(t)) - β (t - m),
# the density form f* = (f + β S) e^{-β (t - m)}, evaluated in log space. For
# standard positive-support delay bases m = 0 and the accrual reduces to β t.
# Accruing from m keeps survival continuous at the support edge (no spurious
# point mass at m) and the density integrating to one. Non-negativity of the
# effect keeps h* >= 0 everywhere (see the constructor); the negative-effect
# clamped path stays upstream in CensoredDistributions.

const _IdentityModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Real, typeof(IdentityLink)}

@doc "

Compute the log survival function on the additive-hazards path.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_IdentityModified, x::Real)
    # No hazard accrues below the support, so survival stays at one there;
    # above it the extra hazard accrues from the support minimum.
    m = minimum(d.dist)
    x <= m && return zero(float(typeof(x)))
    return logccdf(d.dist, x) - d.effect * (x - m)
end

@doc "

Compute the log probability density on the additive-hazards path.

See also: [`pdf`](@ref), [`ccdf`](@ref)
"
function logpdf(d::_IdentityModified, x::Real)
    insupport(d, x) || return oftype(float(x), -Inf)
    β = d.effect
    m = minimum(d.dist)
    logS = logccdf(d.dist, x)
    # f*(x) = h*(x) S*(x) = (f(x) + β S(x)) e^{-β (x - m)}, evaluated in log
    # space so an upper support edge (S -> 0, base hazard -> Inf) stays
    # finite instead of producing Inf - Inf. β >= 0 is enforced at
    # construction, so log(β) is well defined (-Inf at β = 0, which drops
    # the additive term).
    return _logaddexp(logpdf(d.dist, x), log(β) + logS) - β * (x - m)
end

@doc "

Compute the quantile by monotone bisection of the modified CDF.

See also: [`cdf`](@ref)
"
function quantile(d::_IdentityModified, p::Real)
    zero(p) <= p <= one(p) ||
        throw(DomainError(p, "quantile requires p in [0, 1]"))
    p == zero(p) && return float(minimum(d))
    p == one(p) && return float(maximum(d))
    # The added hazard only speeds events up, so the modified quantile is
    # bounded above by the base quantile; the support minimum (finite by
    # construction) bounds below.
    hi = float(quantile(d.dist, p))
    lo = float(minimum(d))
    while true
        mid = (lo + hi) / 2
        (mid == lo || mid == hi) && break
        cdf(d, mid) < p ? (lo = mid) : (hi = mid)
    end
    return (lo + hi) / 2
end

@doc "

Generate a random sample by quantile inversion of a uniform draw.

See also: [`quantile`](@ref)
"
function Base.rand(rng::AbstractRNG, d::_IdentityModified)
    return quantile(d, rand(rng))
end

# ============================================================================
# Shared interface: derive the rest from logccdf / logpdf
# ============================================================================

@doc "

Compute the probability density function.

See also: [`logpdf`](@ref)
"
pdf(d::Modified, x::Real) = exp(logpdf(d, x))

@doc "

Compute the complementary cumulative distribution function.

See also: [`logccdf`](@ref)
"
ccdf(d::Modified, x::Real) = exp(logccdf(d, x))

@doc "

Compute the cumulative distribution function.

See also: [`ccdf`](@ref), [`logcdf`](@ref)
"
cdf(d::Modified, x::Real) = -expm1(logccdf(d, x))

@doc "

Compute the log cumulative distribution function.

See also: [`cdf`](@ref)
"
logcdf(d::Modified, x::Real) = _log1mexp(logccdf(d, x))
