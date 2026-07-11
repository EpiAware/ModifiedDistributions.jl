# The logit link pair for `LogitLink`. Defined locally so the package stays
# Distributions-only (no LogExpFunctions dependency). `_logit` clamps its
# argument away from the open-interval endpoints so a hazard that has saturated
# to exactly 0 or 1 (e.g. a numerically exhausted survival bin) maps to a large
# finite logit rather than ±Inf, keeping the downstream `+ effect` and gradient
# finite.
function _logit(p::Real)
    T = float(typeof(p))
    e = T(1e-12)
    q = clamp(p, e, one(T) - e)
    return log(q) - log(one(T) - q)
end
_logistic(x::Real) = inv(one(x) + exp(-x))

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

# Strip any AD wrapper (ForwardDiff `Dual`, ReverseDiff `TrackedReal`, ...) from
# a scalar, returning its underlying primal value. The generic method is the
# identity on a plain real; the numeric-path knot scan uses it to keep the clamp
# knots (which carry no gradient) off the AD trace. This package ships no
# per-backend stripping extension, so under a tracing backend the scan simply
# stays traced; the clamp knots only matter for the negative-effect / custom
# non-negative-inverse links, and the continuous numeric path is exercised under
# ForwardDiff, where the integration bounds are plain data.
_primal(x::Real) = x

# Rebuild a distribution with its parameters stripped to primal values via the
# type's positional constructor (`params` round-trips through the constructor
# for the Distributions.jl families used here). The core `_primal` is the
# identity, so this only matters once a per-backend stripping extension is
# added; a modifier wrapper (whose constructor is not `Type(params...)`) is
# returned unchanged.
function _primal_distribution(d::UnivariateDistribution)
    D = Base.typename(typeof(d)).wrapper
    return D(map(_primal, params(d))...)
end
_primal_distribution(d::AbstractModifiedDistribution) = d

@doc """

A link for the hazard modification carried by a [`Modified`](@ref)
distribution.

The modification acts on the hazard through the link `g`,

```math
h^{*}(t) = g^{-1}\\!\\big(g(h(t)) + \\text{effect}\\big),
```

so `log` gives proportional hazards, `identity` gives additive hazards and
`logit` gives a discrete-time reporting hazard. A `HazardLink` pairs the link
`g` with its inverse `invlink` (`g⁻¹`); the three named links
([`LogLink`](@ref), [`IdentityLink`](@ref), [`LogitLink`](@ref)) are built-in,
and any invertible callable can be wrapped with [`hazard_link`](@ref). The log
and identity links have analytic forms; any other link (and a callable or
per-bin effect) routes through numeric cumulative-hazard integration.

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
``S^{*}(t) = S(t)\\,e^{-\\beta (t - m)}``, the additive-hazards form. A
non-negative effect uses the closed form; a negative effect can push the hazard
below zero, so it routes through the numeric clamped-hazard path (see
[`modify`](@ref)).

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

The logit link (discrete-time reporting hazard): `g = logit`, `g⁻¹ = logistic`.

`LogitLink` pairs the logit with its logistic inverse, the link for a
discrete-time reporting hazard on a discrete base. On a continuous base it
routes through numeric cumulative-hazard integration.

# Examples
```@example
using ModifiedDistributions, Distributions

# A reporting-hazard modification carried through LogitLink.
modify(Exponential(1.0), 0.5; link = ModifiedDistributions.LogitLink)
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
`invlink` maps back. Use the built-in [`LogLink`](@ref), [`IdentityLink`](@ref)
or [`LogitLink`](@ref) for the standard choices; this constructor is for a
user-supplied invertible callable, which [`modify`](@ref) routes through the
numeric cumulative-hazard path on a continuous base.

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

`Modified` carries a base distribution `dist`, a hazard `effect`, a
[`HazardLink`](@ref) `link` and a quadrature `method`, and lazily instantiates
the modified hazard

```math
h^{*}(t) = g^{-1}\\!\\big(g(h(t)) + \\text{effect}\\big)
```

in `logpdf`/`cdf`/`ccdf`/`rand`, where `g` is the link and
`h(t) = f(t)/S(t)` the base hazard. The modification is never materialised
eagerly, so a `Modified` composes with everything that consumes a
`UnivariateDistribution`.

The instantiation path is chosen by dispatch on the base and the link:

- continuous base, [`LogLink`](@ref): analytic proportional hazards,
  ``S^{*} = S^{e^{\\beta}}``;
- continuous base, [`IdentityLink`](@ref) with a non-negative effect and a
  finite lower support bound `m`: analytic additive hazards,
  ``S^{*}(t) = S(t)\\,e^{-\\beta (t - m)}``;
- continuous base, any other link (or a negative additive effect, or a callable
  `effect(t)`): numeric, integrating the modified cumulative hazard through the
  `method` quadrature solver;
- discrete base with a per-bin effect vector: exact per-bin PMF reconstruction
  through the discrete-time reporting hazard.

# Fields
- `dist`: the base distribution whose hazard is modified.
- `effect`: the hazard modification (a scalar, a callable `effect(t)`, or a
  per-bin vector for a discrete base).
- `link`: the hazard link `g` and its inverse.
- `method`: the quadrature solver used on the continuous numeric path.

# See also
- [`modify`](@ref): the constructor verb.
"""
struct Modified{D <: UnivariateDistribution, E, L <: HazardLink, M} <:
       AbstractModifiedDistribution{Univariate, Continuous}
    "The base distribution whose hazard is modified."
    dist::D
    "The hazard modification effect (a scalar, a callable `effect(t)`, or a
    per-bin vector for a discrete base)."
    effect::E
    "The hazard link `g` and its inverse."
    link::L
    "The quadrature solver used on the continuous numeric path."
    method::M

    function Modified(dist::D, effect::E, link::L,
            method::M) where {
            D <: UnivariateDistribution, E, L <: HazardLink, M}
        if effect isa AbstractVector
            dist isa DiscreteUnivariateDistribution ||
                throw(ArgumentError(
                    "a per-bin vector effect requires a discrete base " *
                    "distribution; use a scalar or callable effect on a " *
                    "continuous base"))
        elseif dist isa DiscreteUnivariateDistribution
            throw(ArgumentError(
                "a discrete base distribution requires a per-bin vector " *
                "effect"))
        elseif L === typeof(IdentityLink) && effect isa Real &&
               effect >= zero(effect)
            # The non-negative additive closed form accrues from the support
            # minimum, so it needs a finite lower support bound. A negative
            # effect routes through the numeric path (which integrates from
            # `max(minimum, 0)`) and carries no such requirement.
            isfinite(minimum(dist)) ||
                throw(ArgumentError(
                    "additive-hazard modification with a non-negative effect " *
                    "needs a base distribution with a finite lower support " *
                    "bound"))
        end
        new{D, E, L, M}(dist, effect, link, method)
    end
end

@doc """

Modify the hazard of a distribution through a link.

`modify(d, effect; link = log)` returns a [`Modified`](@ref) distribution whose
hazard is ``h^{*}(t) = g^{-1}(g(h(t)) + \\text{effect})``, where `g` is the
`link` (`log` for proportional hazards, `identity` for additive hazards,
`:logit` for a discrete-time reporting hazard, or any invertible callable via
[`hazard_link`](@ref)). The modification is instantiated lazily, so the result
composes everywhere a `UnivariateDistribution` does.

For a continuous base the `log` link (and the `identity` link with a
non-negative effect) use closed forms; any other link, a negative additive
effect, or a callable `effect(t)` integrates the modified cumulative hazard
numerically through the `method` solver. For a discrete base, `effect` is a
per-bin vector and the modified PMF is reconstructed exactly through the
discrete-time reporting hazard, for any link including a user callable.

The non-negative `identity` link also requires a base with a finite lower
support bound `m` (the extra hazard accrues from `m`).

# Arguments
- `d`: the base distribution.
- `effect`: the hazard modification. A scalar or a callable `effect(t)` on a
  continuous base; a per-bin vector on a discrete base.

# Keyword Arguments
- `link`: the hazard link. The functions `log` (default) and `identity`, the
  symbols `:log`/`:identity`/`:logit`, or a [`HazardLink`](@ref) such as
  [`LogitLink`](@ref) or one from [`hazard_link`](@ref).
- `method`: the quadrature solver for the continuous numeric path (default
  `GaussLegendre(; n = 64)`).

# Examples
```@example
using ModifiedDistributions, Distributions

# Proportional hazards: halve the hazard of a LogNormal delay.
d = modify(LogNormal(1.5, 0.5), -log(2.0); link = log)
ccdf(d, 2.0)

# Additive hazards: a constant extra hazard.
da = modify(LogNormal(1.5, 0.5), 0.2; link = identity)
cdf(da, 2.0)

# A reporting hazard on a continuous base via numeric integration.
dl = modify(LogNormal(1.5, 0.5), 0.3; link = :logit)
cdf(dl, 2.0)
```

# See also
- [`Modified`](@ref): the wrapped type.
- [`hazard_link`](@ref): wrap a custom link pair.
"""
function modify(dist::UnivariateDistribution, effect; link = log,
        method = GaussLegendre(; n = 64))
    return Modified(dist, effect, _as_hazard_link(link), method)
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
function modify(dist::UnivariateDistribution, ::Nothing; link = log,
        method = GaussLegendre(; n = 64))
    return dist
end

# Parameter extraction: inner params followed by the hazard effect. A callable
# effect carries no numeric parameters, so only the base params surface in that
# case (mirroring CensoredDistributions).
function params(d::Modified)
    base = params(d.dist)
    return d.effect isa Function ? base : (base..., d.effect)
end

# Hazard modification never changes the support, so element type, support
# bounds and membership all delegate to the base distribution.
Base.eltype(::Type{<:Modified{D}}) where {D} = eltype(D)
minimum(d::Modified) = minimum(d.dist)
maximum(d::Modified) = maximum(d.dist)
insupport(d::Modified, x::Real) = insupport(d.dist, x)

# Show a Modified compactly: its base and its link, never the solver arrays.
function Base.show(io::IO, d::Modified)
    print(io, "Modified(", d.dist, "; link=", d.link, ")")
    return nothing
end

# ============================================================================
# Continuous, log link: analytic proportional hazards
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
# Continuous, identity link: analytic additive hazards (effect >= 0)
# ============================================================================
#
# With β >= 0 the effect, the additive hazard is h*(t) = h(t) + β for t in the
# support. The extra hazard accrues from the support minimum m (finite by
# construction), so for t > m
#   H*(t) = H(t) + β (t - m),  S*(t) = S(t) exp(-β (t - m)),
#   logpdf* = log(f(t) + β S(t)) - β (t - m).
# For β < 0 the hazard can dip below zero near the origin, so the model is the
# clamped additive hazard h*(t) = max(h(t) + β, 0); logpdf/logccdf then route
# through the numeric clamped cumulative-hazard integration so survival, cdf and
# pdf stay mutually consistent and the cdf stays monotone in [0, 1].

const _IdentityModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Real, typeof(IdentityLink)}

@doc "

Compute the log survival function on the additive-hazards path.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_IdentityModified, x::Real)
    β = d.effect
    # Negative effect: the hazard can dip below zero, so integrate the clamped
    # hazard numerically (see the section comment above).
    if β < zero(β)
        x <= minimum(d.dist) && return zero(float(typeof(x)))
        return -_modified_cumhazard(d, x)
    end
    # No hazard accrues below the support, so survival stays at one there; above
    # it the extra hazard accrues from the support minimum.
    m = minimum(d.dist)
    x <= m && return zero(float(typeof(x)))
    return logccdf(d.dist, x) - β * (x - m)
end

@doc "

Compute the log probability density on the additive-hazards path.

See also: [`pdf`](@ref), [`ccdf`](@ref)
"
function logpdf(d::_IdentityModified, x::Real)
    insupport(d, x) || return oftype(float(x), -Inf)
    β = d.effect
    # Negative effect: use the clamped hazard and its numeric cumulative hazard
    # so the density matches the (clamped) survival above.
    β < zero(β) && return _numeric_logpdf(d, x)
    m = minimum(d.dist)
    logS = logccdf(d.dist, x)
    # f*(x) = (f(x) + β S(x)) e^{-β (x - m)}, evaluated in log space so an upper
    # support edge (S -> 0, base hazard -> Inf) stays finite instead of Inf-Inf.
    # β >= 0 is enforced above, so log(β) is well defined (-Inf at β = 0, which
    # drops the additive term).
    return _logaddexp(logpdf(d.dist, x), log(β) + logS) - β * (x - m)
end

# ============================================================================
# Continuous, general link: numeric modified cumulative hazard
# ============================================================================
#
# H*(t) = ∫ₘᵗ g⁻¹(g(h(u)) + effect(u)) du with h(u) = f(u)/S(u) the base hazard
# and m = max(minimum, 0), integrated through the Gauss-Legendre `method`
# solver. S*(t) = exp(-H*(t)). The `effect` may be a scalar or a callable.

# The base hazard h(u) = f(u)/S(u) = exp(logpdf - logccdf), clamped to a tiny
# positive floor so the link's `log`/`logit` stays finite at the support edge
# where the survival has numerically exhausted.
function _base_hazard(dist::UnivariateDistribution, u::Real)
    logS = logccdf(dist, u)
    h = exp(logpdf(dist, u) - logS)
    return max(h, eps(float(typeof(h))))
end

# The effect evaluated at `u`: a callable is applied, a scalar is constant.
_effect_at(effect, u) = effect isa Function ? effect(u) : effect

# The pre-clamp modified rate g⁻¹(g(h(u)) + effect(u)): the modified hazard
# before the non-negativity clamp. Its zero-crossings are the knots where the
# clamp engages.
function _premodified_rate(d::Modified, u::Real)
    h = _base_hazard(d.dist, u)
    return d.link.invlink(d.link.g(h) + _effect_at(d.effect, u))
end

# The modified instantaneous hazard h*(u) = max(g⁻¹(g(h(u)) + effect(u)), 0).
# The clamp keeps the modified hazard a valid (non-negative) hazard for links
# whose inverse can return a negative rate (identity with a negative effect, or
# a custom link). For links with a non-negative inverse (log -> exp, logit ->
# logistic) the clamp is a no-op.
function _modified_hazard(d::Modified, u::Real)
    hstar = _premodified_rate(d, u)
    return max(hstar, zero(hstar))
end

# The pre-clamp modified rate for the knot scan only, computed on AD-stripped
# (primal) parameters so the rate — and the `logpdf`/`logccdf` it calls — never
# runs under an AD trace. The knots only locate where the clamp engages and
# carry no gradient.
function _premodified_rate_primal(d::Modified, u::Real)
    base = _primal_distribution(d.dist)
    effect = d.effect isa Function ? d.effect : _primal(d.effect)
    up = _primal(u)
    h = _base_hazard(base, up)
    return d.link.invlink(d.link.g(h) + _effect_at(effect, up))
end

# Locate the clamp knots in `(lo, t)`: the points where the pre-clamp modified
# rate crosses zero, so the clamped integrand `max(rate, 0)` has a kink there. A
# coarse scan brackets each sign change, then bisection refines it. Integrating
# each smooth panel between knots (rather than one fixed rule over a kinked
# integrand) keeps the cumulative hazard, and so the cdf, monotone.
const _MODIFIED_KNOT_SCAN = 64

function _modified_knots(d::Modified, lo::Real, t::Real)
    rate(u) = _primal(_premodified_rate_primal(d, u))
    knots = Float64[]
    a = _primal(float(lo))
    b = _primal(float(t))
    step = (b - a) / _MODIFIED_KNOT_SCAN
    step > zero(step) || return knots
    prev_u = a
    prev_r = rate(a)
    for i in 1:_MODIFIED_KNOT_SCAN
        cur_u = i == _MODIFIED_KNOT_SCAN ? b : a + i * step
        cur_r = rate(cur_u)
        if (prev_r < 0) != (cur_r < 0)
            lo2, hi2 = prev_u, cur_u
            for _ in 1:60
                mid = (lo2 + hi2) / 2
                (rate(lo2) < 0) == (rate(mid) < 0) ? (lo2 = mid) : (hi2 = mid)
            end
            push!(knots, (lo2 + hi2) / 2)
        end
        prev_u = cur_u
        prev_r = cur_r
    end
    return knots
end

# The modified cumulative hazard H*(t) = ∫ₘᵗ h*(u) du via the solver. The lower
# bound is the base support minimum (clamped at 0 for a delay); a `t` at or
# below it carries no hazard. The clamped integrand is kinked wherever the clamp
# engages, so split the integral at the clamp knots and integrate each smooth
# panel, summing the pieces.
function _modified_cumhazard(d::Modified, t::Real)
    lo = max(minimum(d.dist), zero(t))
    t <= lo && return zero(float(promote_type(typeof(t), eltype(d.dist))))
    integrand = u -> _modified_hazard(d, u)
    knots = _modified_knots(d, lo, t)
    isempty(knots) && return integrate(d.method, integrand, lo, t)
    acc = integrate(d.method, integrand, lo, oftype(t, knots[1]))
    for k in 2:length(knots)
        acc += integrate(d.method, integrand,
            oftype(t, knots[k - 1]), oftype(t, knots[k]))
    end
    acc += integrate(d.method, integrand, oftype(t, knots[end]), t)
    return acc
end

# `logpdf* = log h*(t) - H*(t)` from the clamped modified hazard and its numeric
# cumulative hazard. The density is zero where the hazard is clamped to zero and
# in the deep tail where the survival has numerically exhausted, keeping
# log h* - H* from evaluating to NaN (Inf - Inf) where S* ≈ 0.
function _numeric_logpdf(d::Modified, x::Real)
    H = _modified_cumhazard(d, x)
    hstar = _modified_hazard(d, x)
    (isfinite(H) && isfinite(hstar)) || return oftype(float(x), -Inf)
    hstar <= zero(hstar) && return oftype(float(x), -Inf)
    return log(hstar) - H
end

# A general-link Modified on a continuous base: any continuous base with a
# scalar or callable effect and a link that is not the analytic log/identity
# specialisation. The tighter effect bound (scalar or callable, never a vector)
# keeps this disjoint from the discrete per-bin path.
const _NumericModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Union{Real, Function}, <:HazardLink}

@doc "

Compute the log survival function by numeric cumulative-hazard integration.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_NumericModified, x::Real)
    x <= minimum(d.dist) && return zero(float(typeof(x)))
    return -_modified_cumhazard(d, x)
end

@doc "

Compute the log probability density on the numeric path.

`logpdf* = log h*(t) - H*(t)`, the modified hazard times the modified survival.

See also: [`pdf`](@ref), [`ccdf`](@ref)
"
function logpdf(d::_NumericModified, x::Real)
    insupport(d, x) || return oftype(float(x), -Inf)
    return _numeric_logpdf(d, x)
end

function Base.rand(rng::AbstractRNG, d::_NumericModified)
    return quantile(d, rand(rng))
end

# ============================================================================
# Shared continuous interface: derive the rest from logccdf / logpdf
# ============================================================================

const _ContinuousModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Union{Real, Function}}

@doc "

Compute the probability density function.

See also: [`logpdf`](@ref)
"
pdf(d::_ContinuousModified, x::Real) = exp(logpdf(d, x))

@doc "

Compute the complementary cumulative distribution function.

See also: [`logccdf`](@ref)
"
ccdf(d::_ContinuousModified, x::Real) = exp(logccdf(d, x))

@doc "

Compute the cumulative distribution function.

See also: [`ccdf`](@ref), [`logcdf`](@ref)
"
cdf(d::_ContinuousModified, x::Real) = -expm1(logccdf(d, x))

@doc "

Compute the log cumulative distribution function.

See also: [`cdf`](@ref)
"
logcdf(d::_ContinuousModified, x::Real) = _log1mexp(logccdf(d, x))

@doc "

Compute the quantile by monotone bisection of the modified CDF.

The log link keeps its closed form; the additive and numeric paths invert the
monotone cdf by bracketed bisection, so a hazard increase (a tighter law) and a
hazard decrease (a wider law) are both handled.

See also: [`cdf`](@ref)
"
function quantile(d::_ContinuousModified, p::Real)
    zero(p) <= p <= one(p) ||
        throw(DomainError(p, "quantile requires p in [0, 1]"))
    p == zero(p) && return float(minimum(d))
    p == one(p) && return float(maximum(d))
    lo = float(max(minimum(d), zero(float(p))))
    hi = float(quantile(d.dist, p))
    hi <= lo && (hi = lo + one(lo))
    # Expand the upper bracket until it covers p (a hazard decrease widens the
    # law past the base quantile).
    for _ in 1:60
        cdf(d, hi) >= p && break
        hi = lo + 2 * (hi - lo)
        isfinite(hi) || break
    end
    while true
        mid = (lo + hi) / 2
        (mid == lo || mid == hi) && break
        cdf(d, mid) < p ? (lo = mid) : (hi = mid)
    end
    return (lo + hi) / 2
end

# Identity and numeric paths sample by quantile inversion of a uniform draw; the
# log link overrides `rand` with its closed form above.
function Base.rand(rng::AbstractRNG, d::_IdentityModified)
    return quantile(d, rand(rng))
end

sampler(d::_ContinuousModified) = d

# ============================================================================
# Discrete base: exact per-bin reporting-hazard reconstruction
# ============================================================================
#
# The discrete path lifts the per-bin reporting hazard onto a distribution: the
# base PMF over the integer grid is reshaped per bin through the link, then the
# interval masses come straight from the reconstructed PMF. The `effect` is a
# per-bin vector. Works for any link, including a user callable, since each bin
# is the cheap scalar map g⁻¹(g(h_d) + effect_d).
#
# A per-bin vector effect (not a scalar or callable) selects this path, so the
# discrete and continuous method sets are disjoint by effect type even though a
# discrete base is itself a `UnivariateDistribution`.
#
# Scope note: this covers a plain discrete `UnivariateDistribution` (integer
# grid from its support minimum, unit width). CensoredDistributions' epinowcast
# reference-by-report expected-count MATRIX layer (`reference_report_matrix`)
# and the interval-censoring-specific grid stay upstream, since they need the
# interval-censoring discretisation helpers that live there.

const _DiscreteModified = Modified{<:DiscreteUnivariateDistribution,
    <:AbstractVector}

# The integer grid `m, m+1, ...` from the base support minimum, one grid point
# per effect entry. The number of bins is the effect length.
function _discrete_grid(d::_DiscreteModified)
    m = minimum(d.dist)
    n = length(d.effect)
    grid = [m + (i - 1) for i in 1:n]
    return grid, m
end

# The baseline PMF over the grid, then the link-modified PMF. Built once per
# evaluation.
function _modified_pmf(d::_DiscreteModified)
    grid, _ = _discrete_grid(d)
    base = map(g -> pdf(d.dist, g), grid)
    return _apply_hazard_link(base, d.effect, d.link)
end

# Index of the grid bin containing `x` (1-based), or 0 if outside the grid.
function _discrete_bin(d::_DiscreteModified, x::Real)
    _, m = _discrete_grid(d)
    n = length(d.effect)
    b = floor(Int, x - m) + 1
    return (x < m || b < 1 || b > n) ? 0 : b
end

@doc "

Compute the probability mass for the bin containing `x` on the discrete per-bin
reporting-hazard path.

See also: [`logpdf`](@ref), [`cdf`](@ref)
"
function pdf(d::_DiscreteModified, x::Real)
    b = _discrete_bin(d, x)
    p = _modified_pmf(d)
    return b == 0 ? zero(eltype(p)) : p[b]
end

@doc "

Compute the log probability mass on the discrete per-bin path.

See also: [`pdf`](@ref)
"
logpdf(d::_DiscreteModified, x::Real) = log(pdf(d, x))

@doc "

Compute the cumulative distribution function on the discrete per-bin path.

See also: [`logcdf`](@ref)
"
function cdf(d::_DiscreteModified, x::Real)
    p = _modified_pmf(d)
    _, m = _discrete_grid(d)
    b = _discrete_bin(d, x)
    if x < m
        return zero(eltype(p))
    elseif b == 0
        return one(eltype(p))
    end
    return sum(@view p[1:b])
end

ccdf(d::_DiscreteModified, x::Real) = one(eltype(_modified_pmf(d))) - cdf(d, x)
logcdf(d::_DiscreteModified, x::Real) = log(cdf(d, x))
logccdf(d::_DiscreteModified, x::Real) = log(ccdf(d, x))

function Base.rand(rng::AbstractRNG, d::_DiscreteModified)
    p = _modified_pmf(d)
    _, m = _discrete_grid(d)
    u = rand(rng)
    acc = zero(eltype(p))
    @inbounds for b in eachindex(p)
        acc += p[b]
        u <= acc && return float(m + (b - 1))
    end
    return float(m + (length(p) - 1))
end

sampler(d::_DiscreteModified) = d

# ============================================================================
# Batched observations
# ============================================================================
#
# A vector observation on a modifier is per-point (the result is a vector),
# unlike the Product{Weighted} joint-scalar convention. The hazard paths
# evaluate pointwise, so a vector maps the scalar methods.
for f in (:pdf, :logpdf, :cdf, :logcdf, :ccdf, :logccdf)
    @eval function Distributions.$f(d::Modified, x::AbstractVector{<:Real})
        return map(Base.Fix1(Distributions.$f, d), x)
    end
end
