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
# 2. Quadrature window reconstruction. ConvolvedDistributions picks finite
#    integration windows from a quantile of an AD-stripped (primal) copy of
#    a component. Its generic rebuild goes through the type's positional
#    constructor over `params`, which does not hold for wrapper types, so
#    each wrapper gets its own primal reconstruction.
# 3. An AD-safe survival family for `Modified`. The convolution kernels
#    evaluate component CDFs through ConvolvedDistributions' `_*_ad_safe`
#    helpers so e.g. a Gamma base differentiates under every AD backend.
#    A `Modified` component routes its closed-form survival through the
#    base's AD-safe log-survival to keep that property.
#
# Function owner: ConvolvedDistributions (`convolve_series`,
# `_primal_distribution`, the `_*_ad_safe` family). Type owner:
# ModifiedDistributions (`Transformed`, `Affine`, `Weighted`, `Modified`).
# The extension depends on both, so there is no piracy.
module ModifiedDistributionsConvolvedDistributionsExt

import ConvolvedDistributions: convolve_series, _primal_distribution,
                               _cdf_ad_safe, _ccdf_ad_safe, _logcdf_ad_safe,
                               _logccdf_ad_safe
using ConvolvedDistributions: _primal, discretise_pmf
using ModifiedDistributions: AbstractModifiedDistribution, Affine, Modified,
                             Transformed, Weighted, get_dist,
                             _peel_forward, _apply_forward_ops, _log1mexp,
                             _LogModified, _IdentityModified
import ModifiedDistributions: _has_batched_method
using ConvolvedDistributions: Convolved
using Distributions: Distributions, pdf, cdf

# --- 1. The series handshake -----------------------------------------------

# Convolving a forward-transformed delay with a numeric series: peel the
# forward ops off the wrapper, convolve the inner delay's discretised PMF
# with the series, then apply the ops (innermost first) to the resulting
# counts. ConvolvedDistributions 0.2 makes the bare-distribution
# `convolve_series` discrete-only (discretising a continuous delay is an
# explicit modelling choice it will not make silently), so the inner
# continuous delay is discretised here with the interval-censored-secondary
# scheme (`discretise_pmf`) — the same CDF-difference masses the pre-0.2 path
# used, so the modifier counts are unchanged.
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

# Discretise a continuous delay to its interval-censored-secondary PMF and
# convolve the series with it. ConvolvedDistributions 0.2 no longer
# discretises a continuous delay inside `convolve_series` (it is
# discrete-only), so the modifier convenience does it here; the
# CDF-difference masses over lags `0:(length(series) - 1)` are exactly the
# pre-0.2 discretisation, so the counts are unchanged. `delay` is a plain
# delay or a non-forward modifier wrapper, whose own CDF drives the masses.
function _convolve_delay_series(
        delay, series::AbstractVector{<:Real}, interval)
    pmf = discretise_pmf(delay, length(series) - 1; interval = interval)
    return convolve_series(pmf, series)
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
    return Modified(_primal_distribution(d.dist), _primal(d.effect), d.link)
end

# --- 3. AD-safe survival family for Modified --------------------------------

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
# survival stays at one at or below it.
function _logccdf_ad_safe(d::_IdentityModified, x::Real)
    m = minimum(d.dist)
    x <= m && return zero(float(typeof(x)))
    return _logccdf_ad_safe(d.dist, x) - d.effect * (x - m)
end

# The cdf/ccdf/logcdf variants the convolution paths call, all derived
# from the AD-safe log-survival exactly as the public `Modified` methods
# derive them from `logccdf`.
_ccdf_ad_safe(d::Modified, x::Real) = exp(_logccdf_ad_safe(d, x))
_cdf_ad_safe(d::Modified, x::Real) = -expm1(_logccdf_ad_safe(d, x))
_logcdf_ad_safe(d::Modified, x::Real) = _log1mexp(_logccdf_ad_safe(d, x))

# --- 4. Batched-evaluation traits --------------------------------------------

# A `Convolved` provides specialised whole-batch `logpdf`, `pdf` and `cdf`
# (one quadrature solve for the batch), so a modifier wrapping one should
# delegate vector observations in a single call rather than a scalar map.
# The remaining cdf-family functions have no batched `Convolved` methods, so
# they keep the default scalar-map path.
_has_batched_method(::typeof(Distributions.logpdf), ::Convolved) = true
_has_batched_method(::typeof(pdf), ::Convolved) = true
_has_batched_method(::typeof(cdf), ::Convolved) = true

end # module
