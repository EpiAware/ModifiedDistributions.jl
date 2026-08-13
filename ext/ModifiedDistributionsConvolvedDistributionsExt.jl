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
#    with the series, and the ops are applied to the resulting counts. A
#    `Vector` of such wrappers (ConvolvedDistributions 0.4's time-varying
#    `convolve_series(delays, series)`, one delay per time point) composes
#    through the same two methods with nothing extra — see the comment on
#    `_convolve_delay_series` below.
# 2. Quadrature window reconstruction. ConvolvedDistributions picks finite
#    integration windows from a quantile of an AD-stripped (primal) copy of
#    a component. Its generic rebuild goes through the type's positional
#    constructor over `params`, which does not hold for wrapper types, so
#    each wrapper gets its own primal reconstruction.
# 3. An AD-safe survival family for `Modified`. The convolution kernels
#    evaluate component CDFs through EpiAwareADTools' `*_ad_safe` helpers so
#    e.g. a Gamma base differentiates under every AD backend. A `Modified`
#    component routes its closed-form survival through the base's AD-safe
#    log-survival to keep that property.
#
# Function owner: ConvolvedDistributions (`convolve_series`); the AD-safe hook
# family (`primal_distribution`, the `*_ad_safe` functions) is owned by
# EpiAwareADTools, which ConvolvedDistributions 0.2 moved it to (#137). Type
# owner: ModifiedDistributions (`Transformed`, `Affine`, `Weighted`,
# `Modified`). The extension depends on all three, so there is no piracy.
module ModifiedDistributionsConvolvedDistributionsExt

import ConvolvedDistributions: convolve_series
# The AD-safe hook family moved out of ConvolvedDistributions 0.2 to
# EpiAwareADTools under underscore-free names (#137); import the ones this
# extension extends for `Modified` / peels the primal off for the quadrature
# window.
import EpiAwareADTools: primal_distribution, cdf_ad_safe, ccdf_ad_safe,
                        logcdf_ad_safe, logccdf_ad_safe
using EpiAwareADTools: primal
using ModifiedDistributions: AbstractModifiedDistribution, Affine, Modified,
                             Transformed, Weighted, get_dist, get_scale,
                             get_shift, get_effect, get_link,
                             _peel_forward, _apply_forward_ops, _log1mexp,
                             _LogModified, _IdentityModified
import ModifiedDistributions: _has_batched_method
using ConvolvedDistributions: Convolved
using Distributions: Distributions, pdf, cdf

# --- 1. The series handshake -----------------------------------------------

# Convolving a forward-transformed delay with a numeric series: peel the
# forward ops off the wrapper, convolve the inner delay's discretised PMF
# with the series, then apply the ops (innermost first) to the resulting
# counts. ConvolvedDistributions makes the bare-distribution
# `convolve_series` discrete-only (discretising a continuous delay is an
# explicit modelling choice it will not make silently), so the inner
# continuous delay is discretised here — see `_discretised_masses`.
function convolve_series(
        delay::Transformed, series::AbstractVector{<:Real};
        interval = 1)
    inner, ops = _peel_forward(delay)
    _check_no_buried_forward_op(inner)
    counts = _convolve_delay_series(inner, series, interval)
    return _apply_forward_ops(counts, ops)
end

# A non-forward modifier (`weight` / `affine` / `modify`) only reshapes the
# delay's density / CDF, so convolving its series is convolving the modified
# delay's own discretised PMF. A forward op buried under it cannot be peeled
# without a generic rewrap protocol, and silently convolving the wrapper
# would drop the op, so that is rejected with guidance (forward ops go
# outermost).
function convolve_series(
        delay::AbstractModifiedDistribution, series::AbstractVector{<:Real};
        interval = 1)
    _check_no_buried_forward_op(delay)
    return _convolve_delay_series(delay, series, interval)
end

# Discretise a continuous delay over the series window and convolve. `delay`
# is a plain delay or a non-forward modifier wrapper, whose own CDF drives
# the masses.
#
# ConvolvedDistributions 0.4 added a time-varying vector form,
# `convolve_series(delays::AbstractVector, series)` (one delay per time
# point, #79), plus the (now public) `delay_masses(delay, n)` hook it reads
# per distinct element to get that delay's masses. Its default,
# `delay_masses(d, n) = convolve_series(d, unit_impulse(n))`, bounces back
# through a delay's own single-delay `convolve_series` — exactly the two
# methods above — so a `Vector` of `Transformed`/
# `AbstractModifiedDistribution` elements already composes correctly
# (forward ops included) with no extra method here; verified directly
# (including against ConvolvedDistributions' `===`-keyed masses cache for
# repeated delays) in "Convolved extension: time-varying delay vector
# preserves forward ops".
# No `delay_masses` method is added here: the symbol does not exist before
# CD 0.4 (absent from the 0.2/0.3 source), so importing it unconditionally
# would break loading against this package's still-supported 0.2/0.3
# compat range, for a method that would only replicate the default's
# already-correct result.
function _convolve_delay_series(
        delay, series::AbstractVector{<:Real}, interval)
    masses = _discretised_masses(delay, length(series) - 1, interval)
    return convolve_series(masses, series)
end

# The interval-censored-secondary masses `F((k + 1)h) - F(kh)` over lags
# `0:maxlag`: the chance the delay lands in bin `k`, given an exact primary
# event. Raw CDF differences, clamped at zero against numeric-CDF noise,
# never renormalised, so delay mass beyond the window stays truncated.
#
# ConvolvedDistributions 0.3 removed `discretise_pmf` (CD#68) because the
# censoring scheme is the caller's choice, not that package's. This is the
# removed function's arithmetic, so the modifier counts are unchanged across
# the bump. A caller who wants the primary event censored too builds
# double-interval-censored masses (CensoredDistributions.jl) and convolves
# them directly.
#
# NOT the same thing as ConvolvedDistributions 0.4's public `delay_masses`
# hook (above), so it stays private and unreplaced: `delay_masses`'s
# default has no continuous-discretisation logic of its own (a bare
# continuous delay still `MethodError`s through it, CD#95) and its
# signature (`delay_masses(d, n::Int)`) has no `interval` grid-width
# argument, which this function's callers use (the `interval` kwarg
# tested above). Discretising a continuous delay stays this package's job,
# unchanged across the bump.
function _discretised_masses(delay, maxlag::Integer, interval)
    maxlag >= 0 ||
        throw(ArgumentError("convolve_series needs a non-empty series"))
    interval > 0 ||
        throw(ArgumentError(
            "convolve_series interval must be positive, got $(interval)"))
    # Float the grid step so the CDF arguments are floats even for an
    # integer `interval`: the AD-safe Gamma CDF rules attach a `Float64`
    # tangent to the evaluation point, which Mooncake cannot pair with an
    # `Int` primal.
    step = float(interval)
    return map(0:maxlag) do k
        mass = cdf_ad_safe(delay, (k + 1) * step) -
               cdf_ad_safe(delay, k * step)
        max(mass, zero(mass))
    end
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
# `primal_distribution`. Its generic method rebuilds via the positional
# constructor over `params`, which flattens a wrapper's inner parameters
# and so has no matching constructor here. Each wrapper reconstructs
# itself instead.
#
# ConvolvedDistributions 0.4 added solver dispatch for analytic pairs and
# the exact discrete lattice/divisor fold: a recognised closed-form pair
# (e.g. two `Normal`s) skips quadrature — and this reconstruction —
# entirely. That dispatch keys on concrete Distributions.jl types, not on
# these wrapper types, so a component wrapped in `Affine`/`Modified`/etc.
# still takes the numeric route and still needs the window this
# reconstructs; confirmed directly with `ConvolvedDistributions.
# evaluation_path` on the existing "modifiers as convolution components"
# scenarios (`:numeric` both before and after the 0.4 bump).
#
# A forward op / likelihood weight never moves a quantile, so `Transformed`
# and `Weighted` recurse straight to the inner distribution.
primal_distribution(d::Transformed) = primal_distribution(get_dist(d))
primal_distribution(d::Weighted) = primal_distribution(get_dist(d))

# `Affine` and `Modified` do move quantiles, so they rebuild around the
# primal inner distribution with their own parameters stripped to primals.
function primal_distribution(d::Affine)
    return Affine(primal_distribution(get_dist(d)), primal(get_scale(d)),
        primal(get_shift(d)))
end

function primal_distribution(d::Modified)
    return Modified(primal_distribution(get_dist(d)), primal(get_effect(d)),
        get_link(d))
end

# --- 3. AD-safe survival family for Modified --------------------------------

# The convolution kernels and the series PMF evaluate component CDFs
# through EpiAwareADTools' `*_ad_safe` helpers. `Modified`'s closed forms are
# simple
# functions of the BASE's log-survival, so routing through the base's
# `logccdf_ad_safe` makes a modified Gamma (or any base with AD-safe
# methods) differentiate wherever the base does, mirroring the structure
# of ConvolvedDistributions' SurvivalDistributions extension.

# Log link (proportional hazards): logS* = exp(effect) * logS.
function logccdf_ad_safe(d::_LogModified, x::Real)
    return exp(get_effect(d)) * logccdf_ad_safe(get_dist(d), x)
end

# Identity link (additive hazards): the extra hazard accrues from the
# support minimum `m`, so logS* = logS - effect * (x - m) above `m` and
# survival stays at one at or below it. A negative effect uses the clamped
# survival, which has no base-AD-safe closed form, so it falls back to the
# package's own (correct) `logccdf`.
function logccdf_ad_safe(d::_IdentityModified, x::Real)
    get_effect(d) < zero(get_effect(d)) && return Distributions.logccdf(d, x)
    inner = get_dist(d)
    m = minimum(inner)
    x <= m && return zero(float(typeof(x)))
    return logccdf_ad_safe(inner, x) - get_effect(d) * (x - m)
end

# The cdf/ccdf/logcdf variants the convolution paths call, all derived
# from the AD-safe log-survival exactly as the public `Modified` methods
# derive them from `logccdf`.
ccdf_ad_safe(d::Modified, x::Real) = exp(logccdf_ad_safe(d, x))
cdf_ad_safe(d::Modified, x::Real) = -expm1(logccdf_ad_safe(d, x))
logcdf_ad_safe(d::Modified, x::Real) = _log1mexp(logccdf_ad_safe(d, x))

# --- 4. Batched-evaluation traits --------------------------------------------

# A `Convolved` provides specialised whole-batch `logpdf`, `pdf` and `cdf`
# (one quadrature solve for the batch), so a modifier wrapping one should
# delegate vector observations in a single call rather than a scalar map.
# The remaining cdf-family functions have no batched `Convolved` methods, so
# they keep the default scalar-map path.
#
# ConvolvedDistributions 0.4 added `Ratio` (plus `pgf` and
# `quantile_by_optimization`, neither of which is a distribution type).
# Checked with `which(logpdf/pdf/cdf, Tuple{Ratio, Vector{Float64}})`
# (also `Product`, `Difference`): all three resolve to Distributions.jl's
# generic elementwise fallback, not a ConvolvedDistributions-owned batched
# method — only `Convolved` has one. No declaration added for `Ratio`: a
# false declaration here would route a whole vector into a batched method
# that does not exist.
_has_batched_method(::typeof(Distributions.logpdf), ::Convolved) = true
_has_batched_method(::typeof(pdf), ::Convolved) = true
_has_batched_method(::typeof(cdf), ::Convolved) = true

end # module
