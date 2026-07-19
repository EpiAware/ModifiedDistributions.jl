# The logit link pair for `LogitLink`. Defined locally so the package stays
# Distributions-only (no LogExpFunctions dependency). `_logit` clamps its
# argument away from the open-interval endpoints so a hazard that has saturated
# to exactly 0 or 1 (e.g. a numerically exhausted survival bin on the discrete
# reporting-hazard path) maps to a large finite logit rather than ±Inf, keeping
# the downstream `+ effect` and its gradient finite.
function _logit(p::Real)
    T = float(typeof(p))
    e = T(1e-12)
    q = clamp(p, e, one(T) - e)
    return log(q) - log(one(T) - q)
end
_logistic(x::Real) = inv(one(x) + exp(-x))

# The unclamped logit, used only where `LogitLink` is applied to a continuous
# base's hazard (the numeric cumulative-hazard path). There the hazard is a
# rate in [0, ∞), not a probability, so a value outside (0, 1) is genuinely
# out of domain and must throw rather than silently pin to the same saturated
# constant `_logit` would return. `log` and `log1p` throw `DomainError` for a
# negative argument, which covers both `p < 0` and `p > 1` here.
_logit_strict(p::Real) = log(p) - log1p(-p)

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
[`hazard_link`](@ref). The log and identity links have analytic forms; a
general link takes the numeric cumulative-hazard path, enabled by loading a
quadrature backend (`using QuadGK`).

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
non-negative effect uses that closed form; a negative effect can push the
hazard below zero, so the model is the clamped hazard
``h^{*}(t) = \\max(h(t) + \\beta, 0)`` and the survival is reconstructed
exactly from the base's cumulative hazard between the clamp knots (no
quadrature). A finite lower support bound `m` is required either way (see
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
discrete-time reporting hazard on a discrete base with a per-bin effect vector,
where each bin's hazard is a probability in `(0, 1)`. On a continuous base the
hazard is a rate that can exceed one, where the logit is not meaningful; the
rate links [`LogLink`](@ref) and [`IdentityLink`](@ref) (or a custom
[`hazard_link`](@ref)) are the continuous-base choices.

# Examples
```@example
using ModifiedDistributions, Distributions

# A discrete-time reporting-hazard modification through LogitLink: a per-bin
# effect vector reshapes a discrete delay's hazard.
grid = collect(0:4)
base = DiscreteNonParametric(grid, fill(0.2, 5))
modify(base, fill(0.3, 5); link = ModifiedDistributions.LogitLink)
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
user-supplied invertible callable. A general link takes the numeric
cumulative-hazard path, so [`modify`](@ref) with one needs a quadrature backend
(`using QuadGK`) to evaluate.

On a continuous base the hazard is a rate in `[0, ∞)`, so `g` must accept that
whole range: a rate link (like `log`) works, but a probability link whose
domain is `(0, 1)` (logit, cloglog) errors where the base hazard exceeds one.
The cloglog example below is a valid rate transform only on a base whose hazard
stays below one.

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
h^{*}(t) = g^{-1}\\!\\big(g(h(t)) + \\text{effect}(t)\\big)
```

in `logpdf`/`cdf`/`ccdf`/`rand`, where `g` is the link and
`h(t) = f(t)/S(t)` the base hazard. The modification is never materialised
eagerly, so a `Modified` composes with everything that consumes a
`UnivariateDistribution`.

The `effect` is a scalar, a callable `effect(t)`, or a per-bin
`AbstractVector`, and the evaluation path is chosen by dispatch on the base and
the link:

- continuous base, [`LogLink`](@ref) with a scalar effect: analytic
  proportional hazards, ``S^{*} = S^{e^{\\beta}}``;
- continuous base, [`IdentityLink`](@ref) with a scalar effect and a finite
  lower support bound `m`: analytic additive hazards. A non-negative effect
  uses ``S^{*}(t) = S(t)\\,e^{-\\beta (t - m)}``; a negative effect uses the
  clamped hazard ``h^{*}(t) = \\max(h(t) + \\beta, 0)``, whose cumulative
  hazard is summed exactly from the base's own cumulative hazard between the
  clamp knots (no quadrature);
- discrete base, per-bin vector effect: exact per-bin PMF reconstruction
  through the discrete-time reporting hazard, for any link;
- continuous base, callable `effect(t)` (any link) or a scalar effect under a
  general link: the modified cumulative hazard
  ``H^{*}(t) = \\int_m^t \\max(g^{-1}(g(h(u)) + \\text{effect}(u)), 0)\\,du``
  has no closed form and takes the numeric path, evaluated by quadrature. The
  `Modified` constructs freely, but evaluating it needs a quadrature backend
  loaded (`using QuadGK`, supplied by `ModifiedDistributionsQuadGKExt`);
  without one it throws an `ArgumentError` pointing at the backend.

Every link works on a *discrete* base through the per-bin reconstruction.

# Fields
- `dist`: the base distribution whose hazard is modified.
- `effect`: the hazard modification (a scalar, a callable `effect(t)`, or a
  per-bin vector for a discrete base).
- `link`: the hazard link `g` and its inverse.

# See also
- [`modify`](@ref): the constructor verb.
"""
struct Modified{D <: UnivariateDistribution, E, L <: HazardLink,
    S <: ValueSupport} <: AbstractModifiedDistribution{Univariate, S}
    "The base distribution whose hazard is modified."
    dist::D
    "The hazard modification effect (a scalar, a callable `effect(t)`, or a
    per-bin vector for a discrete base)."
    effect::E
    "The hazard link `g` and its inverse."
    link::L

    function Modified(dist::D, effect::E,
            link::L) where {
            D <: UnivariateDistribution, E, L <: HazardLink}
        discrete = dist isa DiscreteUnivariateDistribution
        if effect isa AbstractVector
            discrete || throw(ArgumentError(
                "a per-bin vector effect requires a discrete base " *
                "distribution; use a scalar or callable effect on a " *
                "continuous base"))
        elseif discrete
            throw(ArgumentError(
                "a discrete base distribution requires a per-bin vector " *
                "effect (the discrete-time reporting-hazard path); a scalar " *
                "or callable effect modifies a continuous base"))
        elseif !(effect isa Real || effect isa Function)
            throw(ArgumentError(
                "a continuous base distribution needs a scalar `Real` effect " *
                "or a callable `effect(t)`; got effect::$(typeof(effect))"))
        elseif L === typeof(IdentityLink) && effect isa Real
            # The additive closed forms (both the non-negative and the clamped
            # negative branch) accrue the extra hazard from the support
            # minimum, so they need a finite lower support bound. A callable or
            # general-link effect takes the numeric path instead, which
            # integrates from the support minimum with no such requirement.
            isfinite(minimum(dist)) ||
                throw(ArgumentError(
                    "additive-hazard modification needs a base " *
                    "distribution with a finite lower support bound"))
        end
        # Anything else on a continuous base — a callable time-varying effect
        # (any link), or a scalar effect under a general link (neither log nor
        # identity) — takes the numeric cumulative-hazard path, which needs a
        # quadrature backend (`using QuadGK`) to evaluate but constructs freely.
        new{D, E, L, Distributions.value_support(D)}(dist, effect, link)
    end
end

@doc """

Modify the hazard of a distribution through a link.

`modify(d, effect; link = log)` returns a [`Modified`](@ref) distribution
whose hazard is ``h^{*}(t) = g^{-1}(g(h(t)) + \\text{effect}(t))``, where `g` is
the `link` (`log` for proportional hazards, `identity` for additive hazards).
The modification is instantiated lazily, so the result composes everywhere a
`UnivariateDistribution` does.

The `effect` widens beyond a scalar: it is a scalar, a callable `effect(t)`, or
a per-bin `AbstractVector` (a time-varying hazard). The evaluation path is
chosen by dispatch:

- a scalar effect on a continuous base with the `log` link (or the `identity`
  link) uses a closed form. The identity link accepts a *negative* effect too,
  modelling the clamped hazard ``\\max(h(t) + \\beta, 0)`` whose survival is
  reconstructed exactly from the base cumulative hazard (no quadrature); it
  needs a base with a finite lower support bound `m`;
- a per-bin vector effect requires a discrete base and reshapes each delay
  bin's reporting hazard on the link scale, reconstructing the PMF exactly, for
  any link (including `:logit` or a user callable);
- a callable `effect(t)` on a continuous base (any link), or a scalar effect
  under a general link, is time-varying and takes the numeric cumulative-hazard
  path. It constructs freely, but evaluating it needs a quadrature backend
  loaded (`using QuadGK`); without one it throws an `ArgumentError` naming the
  backend.

A general link (a custom [`hazard_link`](@ref)) on a continuous base takes the
same numeric path. The `:logit` link is a probability link for a discrete base;
on a continuous base, whose hazard is a rate that can exceed one, use a rate
link (`log`, `identity`, or a custom `hazard_link`).

# Arguments
- `d`: the base distribution (continuous for a scalar/callable effect, discrete
  for a per-bin vector effect).
- `effect`: the hazard modification — a scalar, a callable `effect(t)`, or a
  per-bin vector on a discrete base.

# Keyword Arguments
- `link`: the hazard link. The functions `log` (default) and `identity`, the
  symbols `:log`/`:identity`/`:logit`, or a [`HazardLink`](@ref).

# Examples
```@example
using ModifiedDistributions, Distributions

# Proportional hazards: halve the hazard of a LogNormal delay.
d = modify(LogNormal(1.5, 0.5), -log(2.0); link = log)
ccdf(d, 2.0)

# Additive hazards: a constant extra hazard (a negative effect is allowed too).
da = modify(LogNormal(1.5, 0.5), 0.2; link = identity)
cdf(da, 2.0)

# Discrete-time reporting hazard: a per-bin effect vector on a discrete delay.
grid = collect(0:4)
base = DiscreteNonParametric(grid, fill(0.2, 5))
dr = modify(base, [0.4, 0.2, 0.0, -0.2, 0.0]; link = :logit)
sum(pdf(dr, Float64(b)) for b in grid)
```

# See also
- [`Modified`](@ref): the wrapped type.
- [`hazard_link`](@ref): wrap a custom link pair.
"""
function modify(dist::UnivariateDistribution, effect; link = log)
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
function modify(dist::UnivariateDistribution, ::Nothing; link = log)
    return dist
end

# Parameter extraction: inner params followed by the hazard effect. A callable
# effect carries no numeric parameters, so only the base params surface then.
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

# Show a Modified compactly: base, link, and the scalar effect when there is
# one (a callable or vector effect is left off to keep the line readable).
function Base.show(io::IO, d::Modified)
    if d.effect isa Real
        print(io, "Modified(", d.dist, ", ", d.effect, "; link=", d.link, ")")
    else
        print(io, "Modified(", d.dist, "; link=", d.link, ")")
    end
    return nothing
end

# ============================================================================
# Continuous, log link: analytic proportional hazards (scalar effect)
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
# Continuous, identity link: analytic additive hazards (scalar effect)
# ============================================================================
#
# With β >= 0 the effect, the additive hazard is h*(t) = h(t) + β for t in the
# support. The extra hazard accrues from the support minimum m (finite by
# construction), so for t > m
#   H*(t) = H(t) + β (t - m),  S*(t) = S(t) exp(-β (t - m)),
#   logpdf* = log(f(t) + β S(t)) - β (t - m).
# For β < 0 the raw hazard h(t) + β can dip below zero, so the model is the
# clamped additive hazard h*(t) = max(h(t) + β, 0). Its cumulative hazard
#   H*(t) = ∫ₘᵗ max(h(u) + β, 0) du
# is summed EXACTLY, with no quadrature, from the base's own cumulative hazard:
# on any active panel [a, b] where h(u) + β >= 0, ∫(h(u) + β) du equals
#   (H(b) - H(a)) + β (b - a) = (logccdf(a) - logccdf(b)) + β (b - a),
# since ∫ h du = ΔH = -Δ logccdf. The clamp knots (where h(u) = -β) partition
# [m, t] into clamped (contribution 0) and active panels. Clamping away early
# hazard can leave a base with a non-monotone hazard sub-stochastic (the law is
# defective), which `quantile`/`rand` guard.

const _IdentityModified = Modified{
    <:UnivariateDistribution{Continuous}, <:Real, typeof(IdentityLink)}

# The base hazard h(u) = f(u)/S(u) = exp(logpdf - logccdf). A numerically
# exhausted survival (logccdf = -Inf at/above an upper support edge) saturates
# the hazard to +Inf rather than producing a NaN from -Inf - (-Inf).
function _base_hazard(dist, u)
    logS = logccdf(dist, u)
    isfinite(logS) || return oftype(float(u), Inf)
    return exp(logpdf(dist, u) - logS)
end

# Scan `[lo, hi]` for sign changes of `f`, bisecting each bracket down to a
# knot. Shared by the identity closed form (`f` is the base hazard offset by a
# clamp level `c = -β`) and the QuadGK extension's numeric path (`f` is the
# unclamped modified hazard, clamp level 0): both locate the points where a
# clamped rate switches between active and clamped. `f` may return a `Dual`
# (an effect or base parameter differentiated), but the comparisons act on its
# value component, so the returned knots carry no derivative — correct because
# at a knot the integrand is exactly zero, so the moving boundary contributes
# nothing to the derivative (envelope theorem).
const _HAZARD_SCAN = 256

function _scan_crossings(f, lo::Real, hi::Real; n::Int = _HAZARD_SCAN)
    knots = typeof(float(lo))[]
    step = (hi - lo) / n
    step > zero(step) || return knots
    prev = f(lo)
    for i in 1:n
        cur_u = i == n ? hi : lo + i * step
        cur = f(cur_u)
        if (prev < 0) != (cur < 0)
            a = i == 1 ? lo : lo + (i - 1) * step
            b = cur_u
            for _ in 1:60
                mid = (a + b) / 2
                (f(a) < 0) == (f(mid) < 0) ? (a = mid) : (b = mid)
            end
            push!(knots, (a + b) / 2)
        end
        prev = cur
    end
    return knots
end

function _hazard_crossings(dist, lo::Real, hi::Real, c::Real)
    return _scan_crossings(u -> _base_hazard(dist, u) - c, lo, hi)
end

# An upper limit for a clamp-knot scan, tied to the base's own scale (a deep
# upper quantile) rather than to a query point, so a far-out query cannot
# coarsen the scan grid past the (bounded) active band. Beyond the base's
# bulk the hazard is either exhausted or (for an additive clamp) clamped to
# zero, so there are no knots to find there. Shared by the identity closed
# form (`_identity_cumhazard_clamped`) and the QuadGK extension's numeric
# path. Falls back to +Inf if the base has no finite deep quantile.
function _scan_upper(dist)
    q = float(quantile(dist, 1 - 1e-8))
    return isfinite(q) ? q : oftype(q, Inf)
end

# The clamped additive cumulative hazard H*(x) = ∫ₘˣ max(h(u) + β, 0) du,
# summed exactly over the active panels between the clamp knots.
function _identity_cumhazard_clamped(d::_IdentityModified, x::Real)
    β = d.effect
    m = float(minimum(d.dist))
    xf = float(x)
    # The accumulator promotes the effect (possibly a `Dual`), the query and the
    # base log-survival element types so gradients flow through β and the base.
    T = promote_type(typeof(float(β)), typeof(m), typeof(xf),
        typeof(logccdf(d.dist, m)))
    xf <= m && return zero(T)
    c = -β
    # The scan runs to a deep base quantile capped at xf, independent of how
    # far out xf is, so it always resolves the active band; the summation
    # below still integrates the panels exactly up to xf.
    scan_hi = min(xf, _scan_upper(d.dist))
    knots = _hazard_crossings(d.dist, m, scan_hi, c)
    edges = [m; knots; xf]
    H = zero(T)
    @inbounds for i in 1:(length(edges) - 1)
        a = edges[i]
        b = edges[i + 1]
        b > a || continue
        # A panel is active when its interior hazard clears the clamp level.
        if _base_hazard(d.dist, (a + b) / 2) >= c
            H += (logccdf(d.dist, a) - logccdf(d.dist, b)) + β * (b - a)
        end
    end
    return H
end

@doc "

Compute the log survival function on the additive-hazards path.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_IdentityModified, x::Real)
    β = d.effect
    # Negative effect: the hazard can dip below zero, so the survival is the
    # exponential of the clamped cumulative hazard (which is zero at or below
    # the support minimum).
    β < zero(β) && return -_identity_cumhazard_clamped(d, x)
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
    if β < zero(β)
        # Clamped hazard: the density is zero where h(x) + β <= 0, otherwise
        # log h*(x) - H*(x) with the clamped cumulative hazard.
        hstar = _base_hazard(d.dist, x) + β
        hstar > zero(hstar) || return oftype(float(x), -Inf)
        return log(hstar) - _identity_cumhazard_clamped(d, x)
    end
    m = minimum(d.dist)
    logS = logccdf(d.dist, x)
    # f*(x) = (f(x) + β S(x)) e^{-β (x - m)}, evaluated in log space so an upper
    # support edge (S -> 0, base hazard -> Inf) stays finite instead of Inf-Inf.
    # β >= 0 here, so log(β) is well defined (-Inf at β = 0, dropping the term).
    return _logaddexp(logpdf(d.dist, x), log(β) + logS) - β * (x - m)
end

@doc "

Compute the quantile by monotone bisection of the modified CDF.

A non-negative additive effect only speeds events up, so the modified quantile
sits between the support minimum and the base quantile. A negative additive
effect widens the law and can leave it defective (its cdf converges below one);
when the requested `p` exceeds the total mass the quantile is undefined and this
throws an `ArgumentError` rather than returning a garbage bracket.

See also: [`cdf`](@ref)
"
function quantile(d::_IdentityModified, p::Real)
    zero(p) <= p <= one(p) ||
        throw(DomainError(p, "quantile requires p in [0, 1]"))
    p == zero(p) && return float(minimum(d))
    p == one(p) && return float(maximum(d))
    lo = float(minimum(d))
    hi = float(quantile(d.dist, p))
    hi <= lo && (hi = lo + one(lo))
    # For a negative effect the modified law is wider than the base, so expand
    # the upper bracket until it covers `p`, capped at a deep base quantile. A
    # cdf that has not reached `p` by the cap means `p` exceeds the total mass.
    hicap = float(quantile(d.dist, 1 - 1e-12))
    (isfinite(hicap) && hicap > lo) || (hicap = float(maximum(d)))
    isfinite(hicap) || (hicap = lo + (hi - lo) * 2.0^20)
    while hi < hicap && cdf(d, hi) < p
        hi = min(hicap, lo + 2 * (hi - lo))
    end
    cdf(d, hi) >= p || throw(ArgumentError(
        "the modified law is defective (sub-stochastic) for this negative " *
        "additive effect and base: its total probability mass is below " *
        "$(p), so the $(p)-quantile is undefined. Clamping the early hazard " *
        "can leave a base with a non-monotone hazard integrating to less " *
        "than one."))
    while true
        mid = (lo + hi) / 2
        (mid == lo || mid == hi) && break
        cdf(d, mid) < p ? (lo = mid) : (hi = mid)
    end
    return (lo + hi) / 2
end

# ============================================================================
# Continuous, numeric cumulative-hazard path (callable or general-link effect)
# ============================================================================
#
# When the modified cumulative hazard H*(t) = ∫ₘᵗ g⁻¹(g(h(u)) + effect(u)) du
# has no closed form — a callable time-varying `effect(t)` (any link), or a
# scalar effect under a general link (neither log nor identity) — it needs
# numeric integration. Core routes those cases through the `_numeric_*` seams
# and gives them a fallback that asks for a quadrature backend; the real methods
# are supplied by `ModifiedDistributionsQuadGKExt` when QuadGK is loaded (#77b).
# Constructing such a `Modified` always succeeds so downstream code can build.

const _NUMERIC_PATH_MSG = string(
    "the numeric hazard path — a callable time-varying `effect(t)`, or a ",
    "general hazard link on a continuous base — needs a quadrature backend; ",
    "load QuadGK (`using QuadGK`) to enable it. A scalar `log`/`identity` ",
    "effect on a continuous base, or a per-bin vector effect on a discrete ",
    "base, uses a closed form and needs no backend.")

# The modified log-survival `logS*(t) = -H*(t)` on the numeric path. The
# fallback asks for a backend; `ModifiedDistributionsQuadGKExt` specialises it.
_numeric_logccdf(::Modified, x) = throw(ArgumentError(_NUMERIC_PATH_MSG))

# The modified log-density `log h*(t) - H*(t)` on the numeric path. The
# fallback asks for a backend; `ModifiedDistributionsQuadGKExt` specialises it.
_numeric_logpdf(::Modified, x) = throw(ArgumentError(_NUMERIC_PATH_MSG))

# The numeric path covers a continuous base with either a callable effect (any
# link) or a scalar effect under a general link. The two scalar closed-form
# sets (`_LogModified`, `_IdentityModified`) are strictly more specific, so they
# win for the log and identity links; every other continuous case falls here.
const _NumericModified = Union{
    Modified{<:UnivariateDistribution{Continuous}, <:Function},
    Modified{<:UnivariateDistribution{Continuous}, <:Real, <:HazardLink}}

@doc "

Compute the log survival function on the numeric cumulative-hazard path.

See also: [`ccdf`](@ref), [`logpdf`](@ref)
"
function logccdf(d::_NumericModified, x::Real)
    x <= minimum(d.dist) && return zero(float(typeof(x)))
    return _numeric_logccdf(d, x)
end

@doc "

Compute the log probability density on the numeric cumulative-hazard path.

See also: [`pdf`](@ref), [`ccdf`](@ref)
"
function logpdf(d::_NumericModified, x::Real)
    insupport(d, x) || return oftype(float(x), -Inf)
    return _numeric_logpdf(d, x)
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

# The identity and numeric paths sample by quantile inversion of a uniform
# draw; the log link overrides `rand` with its closed form above. The bracketed
# bisection of the monotone cdf covers the numeric path, whose cdf routes
# through the quadrature backend (or raises the load-QuadGK fallback).
function quantile(d::_NumericModified, p::Real)
    zero(p) <= p <= one(p) ||
        throw(DomainError(p, "quantile requires p in [0, 1]"))
    p == zero(p) && return float(minimum(d))
    p == one(p) && return float(maximum(d))
    lo = float(minimum(d))
    # A time-varying or general-link modification can widen the law past the
    # base quantile, so start at the base quantile (kept strictly above `lo`)
    # and double the bracket until the cdf covers `p`. The doubling is bounded
    # so a defective (sub-stochastic) clamped law does not loop forever.
    hi = max(float(quantile(d.dist, p)), lo + one(lo) / 2)
    for _ in 1:200
        cdf(d, hi) >= p && break
        hi = lo + 2 * (hi - lo)
    end
    # A clamped hazard can leave the law defective; a cdf still below `p` after
    # the expansion means `p` exceeds the total mass, so there is no quantile.
    cdf(d, hi) >= p || throw(ArgumentError(
        "the modified law is defective (sub-stochastic) for this effect " *
        "and base: its total probability mass is below $(p), so the " *
        "$(p)-quantile is undefined. A clamped time-varying hazard can " *
        "integrate to less than one."))
    while true
        mid = (lo + hi) / 2
        (mid == lo || mid == hi) && break
        cdf(d, mid) < p ? (lo = mid) : (hi = mid)
    end
    return (lo + hi) / 2
end

function Base.rand(rng::AbstractRNG, d::_IdentityModified)
    return quantile(d, rand(rng))
end
function Base.rand(rng::AbstractRNG, d::_NumericModified)
    return quantile(d, rand(rng))
end

# ============================================================================
# Discrete base: exact per-bin reporting-hazard reconstruction
# ============================================================================
#
# The discrete path lifts the per-bin reporting hazard onto a distribution: the
# base PMF over the integer grid is reshaped per bin through the link
# (`h*_d = g⁻¹(g(h_d) + effect_d)`), then the interval masses come straight from
# the reconstructed PMF. The `effect` is a per-bin vector, which selects this
# path and keeps it disjoint from the continuous method sets. Works for any
# link, including a user callable, since each bin is the cheap scalar map. See
# `reporting_hazard.jl` for the vector helpers.
#
# Scope note: this covers a plain discrete `UnivariateDistribution` (integer
# grid from its support minimum, unit width). CensoredDistributions' epinowcast
# reference-by-report expected-count MATRIX layer and interval-censoring
# discretisation stay upstream.

const _DiscreteModified = Modified{<:DiscreteUnivariateDistribution,
    <:AbstractVector}

# The integer grid `m, m+1, ...` from the base support minimum, one grid point
# per effect entry.
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

@doc "

Compute the complementary cumulative distribution on the discrete per-bin path.

See also: [`cdf`](@ref)
"
ccdf(d::_DiscreteModified, x::Real) = one(eltype(_modified_pmf(d))) - cdf(d, x)

@doc "

Compute the log cumulative distribution on the discrete per-bin path.

See also: [`cdf`](@ref)
"
logcdf(d::_DiscreteModified, x::Real) = log(cdf(d, x))

@doc "

Compute the log complementary cumulative distribution on the discrete per-bin
path.

See also: [`ccdf`](@ref)
"
logccdf(d::_DiscreteModified, x::Real) = log(ccdf(d, x))

@doc "

Generate a random sample by inversion of the reconstructed PMF.

See also: [`pdf`](@ref)
"
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
