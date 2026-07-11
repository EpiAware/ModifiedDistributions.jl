# ModifiedDistributions × ConvolvedDistributions
#
# The modifier wrappers meet ConvolvedDistributions' two jobs: the
# distribution-level convolution (`Convolved`) and the series convolution
# (`convolve_series(delay, series)`).
#
# `Convolved` / `Difference` themselves need no modifier methods: both are
# univariate, so the modifier constructors accept them directly and
# `get_dist`'s default identity is correct (they are combined distributions,
# not modifiers — there is nothing to unwrap).
#
# What does need methods here:
#
# 1. The series handshake. A forward-transform wrapper (`thin` /
#    `cumulative` / `series_transform`) carries an op meant for the count
#    series a convolution layer produces. When such a wrapper is handed a
#    numeric series, the ops are peeled off, the inner delay is convolved
#    with the series, and the ops are applied to the resulting counts.
#    ConvolvedDistributions convolves a DISCRETE inner delay directly and
#    refuses a continuous one (a continuous delay carries no integer-lag mass
#    until discretised), so the supported shape wraps a discrete delay:
#    `thin(dist::DiscreteUnivariateDistribution, p)`. For a continuous delay,
#    discretise first with `discretise_pmf` (e.g. into a `DiscreteNonParametric`
#    to wrap, or convolve the resulting `DelayPMF` directly and apply the
#    forward op to the counts); wrapping a continuous delay surfaces
#    ConvolvedDistributions' own discretise-first error rather than a silent
#    guess.
# 2. Quadrature window reconstruction. ConvolvedDistributions picks finite
#    integration windows from a quantile of an AD-stripped (primal) copy of
#    a component. Its generic rebuild goes through the type's positional
#    constructor over `params`, which does not hold for wrapper types, so
#    each wrapper gets its own primal reconstruction.
# 3. The continuous numeric hazard path. A general link (logit or a custom
#    callable), a negative additive effect, or a callable `effect(t)` on a
#    continuous base integrates the modified cumulative hazard through
#    ConvolvedDistributions' Gauss-Legendre quadrature. Core carries no
#    quadrature dependency, so it defers to the `_numeric_logccdf` /
#    `_numeric_logpdf` seams (which throw until loaded); the real methods here
#    dispatch on the narrower continuous-modified type and win by specificity.
# 4. An AD-safe survival family for `Modified`. The convolution kernels
#    evaluate component CDFs through ConvolvedDistributions' `_*_ad_safe`
#    helpers so e.g. a Gamma base differentiates under every AD backend.
#    A `Modified` component routes its closed-form survival through the
#    base's AD-safe log-survival to keep that property.
#
# Function owner: ConvolvedDistributions (`convolve_series`,
# `_primal_distribution`, `integrate`, the `_*_ad_safe` family). Type owner:
# ModifiedDistributions (`Transformed`, `Affine`, `Weighted`, `Modified`, and
# the `_numeric_*` seams). The extension depends on both, so there is no piracy.
module ModifiedDistributionsConvolvedDistributionsExt

import ConvolvedDistributions: convolve_series, _primal_distribution,
                               _cdf_ad_safe, _ccdf_ad_safe, _logcdf_ad_safe,
                               _logccdf_ad_safe
using ConvolvedDistributions: _primal, GaussLegendre, integrate
using ModifiedDistributions: AbstractModifiedDistribution, Affine, Modified,
                             Transformed, Weighted, get_dist,
                             _peel_forward, _apply_forward_ops, _log1mexp,
                             _LogModified, _IdentityModified,
                             _ContinuousModified
import ModifiedDistributions: _has_batched_method, _numeric_logccdf,
                              _numeric_logpdf
using ConvolvedDistributions: Convolved
using Distributions: Distributions, pdf, cdf, logpdf, logccdf,
                     DiscreteUnivariateDistribution,
                     ContinuousUnivariateDistribution

# --- 1. The series handshake -----------------------------------------------

# Convolving a forward-transformed delay with a numeric series: peel the
# forward ops off the wrapper, convolve the inner delay with the series, then
# apply the ops (innermost first) to the resulting counts. The inner convolution
# routes to ConvolvedDistributions' own dispatch, so a discrete inner convolves
# and a continuous inner surfaces its discretise-first error (see the header).
function convolve_series(delay::Transformed, series::AbstractVector{<:Real})
    inner, ops = _peel_forward(delay)
    _check_no_buried_forward_op(inner)
    counts = convolve_series(inner, series)
    return _apply_forward_ops(counts, ops)
end

# A forward op buried under another modifier (e.g. weight(cumulative(d)))
# cannot be peeled without a generic rewrap protocol, and silently convolving
# the wrapper would drop the op. Reject with guidance: forward ops go outermost.
# Otherwise delegate to ConvolvedDistributions' dispatch on the delay's value
# support (a discrete modified delay convolves through its `pdf`; a continuous
# one surfaces the discretise-first error), invoking the concrete-support method
# since there is no generic `UnivariateDistribution` convolve_series.
function convolve_series(
        delay::AbstractModifiedDistribution, series::AbstractVector{<:Real})
    _check_no_buried_forward_op(delay)
    delay isa DiscreteUnivariateDistribution && return invoke(convolve_series,
        Tuple{DiscreteUnivariateDistribution, AbstractVector{<:Real}},
        delay, series)
    return invoke(convolve_series,
        Tuple{ContinuousUnivariateDistribution, AbstractVector{<:Real}},
        delay, series)
end

function _check_no_buried_forward_op(d)
    inner = d
    while inner isa AbstractModifiedDistribution
        inner isa Transformed &&
            throw(ArgumentError(
                "a forward op (thin/cumulative/series_transform) is " *
                "wrapped inside another modifier, where the series " *
                "convolution cannot apply it; apply forward ops " *
                "outermost, e.g. thin(weight(d, w), p) rather than " *
                "weight(thin(d, p), w)"))
        inner = get_dist(inner)
    end
    return nothing
end

# --- 2. Quadrature window reconstruction ------------------------------------

# ConvolvedDistributions clamps infinite quadrature windows at an extreme
# quantile of an AD-stripped copy of the component, rebuilt by
# `_primal_distribution`. Its generic method rebuilds via the positional
# constructor over `params`, which flattens a wrapper's inner parameters
# and so has no matching constructor here. Each wrapper reconstructs
# itself instead.
#
# A forward op / likelihood weight never moves a quantile, so `Transformed`
# and `Weighted` recurse straight to the inner distribution.
_primal_distribution(d::Transformed) = _primal_distribution(d.dist)
_primal_distribution(d::Weighted) = _primal_distribution(d.dist)

# `Affine` and `Modified` do move quantiles, so they rebuild around the
# primal inner distribution with their own parameters stripped to primals.
function _primal_distribution(d::Affine)
    return Affine(_primal_distribution(d.dist), _primal(d.scale),
        _primal(d.shift))
end

function _primal_distribution(d::Modified)
    return Modified(_primal_distribution(d.dist), _primal(d.effect), d.link,
        d.method)
end

# --- 3. The continuous numeric cumulative-hazard path -----------------------
#
# H*(t) = ∫ₘᵗ g⁻¹(g(h(u)) + effect(u)) du with h(u) = f(u)/S(u) the base hazard
# and m = max(minimum, 0). S*(t) = exp(-H*(t)), logpdf* = log h*(t) - H*(t).
# The integral runs through ConvolvedDistributions' `integrate`/`GaussLegendre`
# (the same AD-safe fixed-node solver its convolution kernels use), so core
# stays quadrature-free and this path lives here behind the `_numeric_*` seams.

# The base hazard h(u) = f(u)/S(u) = exp(logpdf - logccdf), clamped to a tiny
# positive floor so the link's `log`/`logit` stays finite at the support edge
# where the survival has numerically exhausted.
function _base_hazard(dist, u)
    logS = logccdf(dist, u)
    h = exp(logpdf(dist, u) - logS)
    return max(h, eps(float(typeof(h))))
end

# The effect evaluated at `u`: a callable is applied, a scalar is constant.
_effect_at(effect, u) = effect isa Function ? effect(u) : effect

# The pre-clamp modified rate g⁻¹(g(h(u)) + effect(u)) for a given base and
# effect: the modified hazard before the non-negativity clamp. Its
# zero-crossings are the knots where the clamp engages. Factored over the base
# and effect so the knot scan can pass a primal-stripped base while the live
# hazard passes the AD-live one.
function _premodified_rate(link, base, effect, u)
    h = _base_hazard(base, u)
    return link.invlink(link.g(h) + _effect_at(effect, u))
end

# The modified instantaneous hazard h*(u) = max(g⁻¹(g(h(u)) + effect(u)), 0).
# The clamp keeps the modified hazard a valid (non-negative) hazard for links
# whose inverse can return a negative rate (identity with a negative effect, or
# a custom link). For links with a non-negative inverse (log -> exp, logit ->
# logistic) the clamp is a no-op.
function _modified_hazard(d::Modified, u)
    hstar = _premodified_rate(d.link, d.dist, d.effect, u)
    return max(hstar, zero(hstar))
end

# The base stripped to primal parameters for the knot scan, via
# ConvolvedDistributions' `_primal_distribution` (which carries per-backend
# stripping extensions). A base with no positional-`params` reconstruction (a
# `Convolved` total from a composed chain flattens to nested `params`) has no
# primal copy, so fall back to the base itself: the knots only locate clamp
# kinks and carry no gradient, so an un-stripped base is still correct — it just
# stays on the AD trace under a tracing backend.
function _primal_base(d)
    return try
        _primal_distribution(d)
    catch err
        err isa MethodError ? d : rethrow()
    end
end

# Locate the clamp knots in `(lo, t)`: the points where the pre-clamp modified
# rate crosses zero, so the clamped integrand `max(rate, 0)` has a kink there. A
# coarse scan brackets each sign change, then bisection refines it. Integrating
# each smooth panel between knots (rather than one fixed rule over a kinked
# integrand) keeps the cumulative hazard, and so the cdf, monotone. The scan
# runs on the AD-stripped base and effect so it never traces (`_primal_base`).
const _MODIFIED_KNOT_SCAN = 64

function _modified_knots(d::Modified, lo, t)
    base = _primal_base(d.dist)
    effect = d.effect isa Function ? d.effect : _primal(d.effect)
    rate(u) = _primal(_premodified_rate(d.link, base, effect, _primal(u)))
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

# The default solver when a `Modified` carries `method = nothing` (core cannot
# name `GaussLegendre`, so it defers the choice to this extension).
_numeric_solver(::Nothing) = GaussLegendre(; n = 64)
_numeric_solver(method) = method

# The modified cumulative hazard H*(t) = ∫ₘᵗ h*(u) du via the solver. The lower
# bound is the base support minimum (clamped at 0 for a delay); a `t` at or
# below it carries no hazard. The clamped integrand is kinked wherever the clamp
# engages, so split the integral at the clamp knots and integrate each smooth
# panel, summing the pieces.
function _modified_cumhazard(d::Modified, t)
    lo = max(minimum(d.dist), zero(t))
    t <= lo && return zero(float(promote_type(typeof(t), eltype(d.dist))))
    solver = _numeric_solver(d.method)
    integrand = u -> _modified_hazard(d, u)
    knots = _modified_knots(d, lo, t)
    isempty(knots) && return integrate(solver, integrand, lo, t)
    acc = integrate(solver, integrand, lo, oftype(t, knots[1]))
    for k in 2:length(knots)
        acc += integrate(solver, integrand,
            oftype(t, knots[k - 1]), oftype(t, knots[k]))
    end
    acc += integrate(solver, integrand, oftype(t, knots[end]), t)
    return acc
end

# The real numeric seams (Function owner: ModifiedDistributions). Defined on the
# narrower `_ContinuousModified`, strictly more specific than the core
# `::Modified` stubs, so these win with no redefinition warning once loaded.
# `logS*(t) = -H*(t)`; the caller has already guarded `t <= minimum`.
_numeric_logccdf(d::_ContinuousModified, x) = -_modified_cumhazard(d, x)

# `logpdf* = log h*(t) - H*(t)` from the clamped modified hazard and its numeric
# cumulative hazard. The density is zero where the hazard is clamped to zero and
# in the deep tail where the survival has numerically exhausted, keeping
# log h* - H* from evaluating to NaN (Inf - Inf) where S* ≈ 0.
function _numeric_logpdf(d::_ContinuousModified, x)
    H = _modified_cumhazard(d, x)
    hstar = _modified_hazard(d, x)
    (isfinite(H) && isfinite(hstar)) || return oftype(float(x), -Inf)
    hstar <= zero(hstar) && return oftype(float(x), -Inf)
    return log(hstar) - H
end

# --- 4. AD-safe survival family for Modified --------------------------------

# The convolution kernels and the series PMF evaluate component CDFs
# through the `_*_ad_safe` helpers. `Modified`'s closed forms are simple
# functions of the BASE's log-survival, so routing through the base's
# `_logccdf_ad_safe` makes a modified Gamma (or any base with AD-safe
# methods) differentiate wherever the base does, mirroring the structure
# of ConvolvedDistributions' SurvivalDistributions extension.

# Log link (proportional hazards): logS* = exp(effect) * logS.
function _logccdf_ad_safe(d::_LogModified, x::Real)
    return exp(d.effect) * _logccdf_ad_safe(d.dist, x)
end

# Identity link (additive hazards): the extra hazard accrues from the
# support minimum `m`, so logS* = logS - effect * (x - m) above `m` and
# survival stays at one at or below it. A negative effect uses the clamped
# numeric survival, which has no base-AD-safe closed form, so it falls back
# to the package's own (correct) `logccdf`.
function _logccdf_ad_safe(d::_IdentityModified, x::Real)
    d.effect < zero(d.effect) && return Distributions.logccdf(d, x)
    m = minimum(d.dist)
    x <= m && return zero(float(typeof(x)))
    return _logccdf_ad_safe(d.dist, x) - d.effect * (x - m)
end

# General-link / discrete / callable-effect Modified has no base-AD-safe
# closed-form survival, so route the AD-safe survival through the package's
# own `logccdf` (numerically correct; it just does not lift the base's
# AD-safe survival helper). Keeps a convolved general-link Modified evaluable.
_logccdf_ad_safe(d::Modified, x::Real) = Distributions.logccdf(d, x)

# The cdf/ccdf/logcdf variants the convolution paths call, all derived
# from the AD-safe log-survival exactly as the public `Modified` methods
# derive them from `logccdf`.
_ccdf_ad_safe(d::Modified, x::Real) = exp(_logccdf_ad_safe(d, x))
_cdf_ad_safe(d::Modified, x::Real) = -expm1(_logccdf_ad_safe(d, x))
_logcdf_ad_safe(d::Modified, x::Real) = _log1mexp(_logccdf_ad_safe(d, x))

# --- 5. Batched-evaluation traits --------------------------------------------

# A `Convolved` provides specialised whole-batch `logpdf`, `pdf` and `cdf`
# (one quadrature solve for the batch), so a modifier wrapping one should
# delegate vector observations in a single call rather than a scalar map.
# The remaining cdf-family functions have no batched `Convolved` methods, so
# they keep the default scalar-map path.
_has_batched_method(::typeof(Distributions.logpdf), ::Convolved) = true
_has_batched_method(::typeof(pdf), ::Convolved) = true
_has_batched_method(::typeof(cdf), ::Convolved) = true

end # module
