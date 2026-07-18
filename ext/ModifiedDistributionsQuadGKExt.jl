# ModifiedDistributions × QuadGK
#
# The numeric cumulative-hazard path for `Modified` on a continuous base. When
# the modification has no closed form — a callable time-varying `effect(t)`
# (any link), or a scalar effect under a general link (neither log nor
# identity) — the modified survival needs the integral
#
#   H*(t) = ∫ₘᵗ max(g⁻¹(g(h(u)) + effect(u)), 0) du,
#
# with h(u) = f(u)/S(u) the base hazard, g the link and m the support minimum.
# Core routes those cases through the `_numeric_logccdf` / `_numeric_logpdf`
# seams (with a fallback that asks for a backend); this extension specialises
# them on the numeric-path type set using QuadGK's adaptive quadrature. The
# hazard is clamped at zero because a rate is non-negative (matching the
# identity closed form's clamp).
#
# Function owner: ModifiedDistributions (the `_numeric_*` seams). Type owner:
# ModifiedDistributions (`Modified`). QuadGK owns `quadgk`. No piracy.
#
# AD: `quadgk` is pure Julia, so a ForwardDiff `Dual` flows through the
# integrand — differentiating a numeric-path `Modified` with respect to a
# parameter of `effect` or the base works. Enzyme/Mooncake through the
# quadrature, and routing the base hazard through EpiAwareADTools' AD-safe
# survival for multi-backend safety when a numeric-path `Modified` is a
# convolution component, are follow-ups.
module ModifiedDistributionsQuadGKExt

using QuadGK: quadgk
using Distributions: minimum
import ModifiedDistributions: _numeric_logccdf, _numeric_logpdf
using ModifiedDistributions: Modified, _NumericModified, get_dist, get_effect,
                             get_link, LogitLink, _logit_strict, _base_hazard,
                             _scan_crossings, _scan_upper

# The hazard modification at `u`: a scalar effect broadcast over time, or a
# callable evaluated at `u`.
_effect_at(effect, u) = effect isa Function ? effect(u) : effect

# The unclamped modified hazard g⁻¹(g(h(u)) + effect(u)), which can dip below
# zero (an additive effect pushing the hazard negative); the clamp knots are
# its sign changes.
#
# `LogitLink`'s forward link is `_logit`, which clamps to keep the discrete
# per-bin path (a genuine probability) finite at a saturated bin. Here the
# base hazard is a rate in [0, ∞), not a probability, so a value outside
# (0, 1) is out of domain and must throw rather than silently pin to the
# clamped constant; `_logit_strict` is the unclamped forward link used only
# on this continuous numeric path.
function _raw_mod_hazard(d::Modified, u)
    link = get_link(d)
    h = _base_hazard(get_dist(d), u)
    g = link === LogitLink ? _logit_strict : link.g
    return link.invlink(g(h) + _effect_at(get_effect(d), u))
end

# The modified hazard h*(u) = max(g⁻¹(g(h(u)) + effect(u)), 0), clamped at zero
# so a rate stays non-negative under any link (an additive effect pushing the
# hazard negative is the canonical case).
function _mod_hazard(d::Modified, u)
    raw = _raw_mod_hazard(d, u)
    return max(raw, zero(raw))
end

# Locate the clamp knots in `(lo, hi)`: the points where the unclamped modified
# hazard crosses zero, so the clamped integrand switches between active and
# clamped. Handing these to `quadgk` as subdivision points is essential — a
# bare adaptive rule can sample only clamped points, estimate the error as zero
# and never subdivide, silently returning an integral of zero over a mostly
# clamped interval. Delegates the scan-and-bisect to `_scan_crossings` (shared
# with the `_IdentityModified` closed form's clamp knots). Skipped for an
# unbounded-below base (an additive clamp there is ill-posed anyway; a
# proportional effect never clamps, so there are no interior knots to find).
function _clamp_knots(d::Modified, lo::Real, hi::Real)
    (isfinite(lo) && isfinite(hi)) || return typeof(float(lo))[]
    return _scan_crossings(u -> _raw_mod_hazard(d, u), lo, hi)
end

# The modified cumulative hazard H*(x) = ∫ₘˣ h*(u) du by adaptive quadrature,
# with the clamp knots passed as subdivision points so an active band inside a
# mostly clamped interval is not missed. The knot scan runs over the base's
# scale (capped at `x`), keeping its resolution independent of a far-out `x`;
# the integration itself still runs to `x`, with the clamped tail beyond the
# last knot contributing zero. The callers only reach here for `x` in the
# support, so clamp the upper limit at the support minimum `m` defensively;
# `quadgk(m, m)` returns a typed zero.
function _cumhazard(d::Modified, x::Real)
    m = float(minimum(get_dist(d)))
    xf = max(float(x), m)
    scan_hi = min(xf, _scan_upper(get_dist(d)))
    knots = _clamp_knots(d, m, scan_hi)
    integral, _ = quadgk(u -> _mod_hazard(d, u), m, knots..., xf)
    return integral
end

# logS*(x) = -H*(x). The caller (`logccdf`) has already returned 0 at or below
# the support minimum, so `x` is strictly inside the support here.
_numeric_logccdf(d::_NumericModified, x::Real) = -_cumhazard(d, x)

# logf*(x) = log h*(x) - H*(x). Where the clamped hazard is zero the density is
# zero (log-density -Inf). The caller (`logpdf`) already screened `insupport`.
# The -Inf sentinel is typed from the cumulative hazard so it carries the same
# AD tag as the non-zero branch (keeping the return type stable).
function _numeric_logpdf(d::_NumericModified, x::Real)
    hstar = _mod_hazard(d, x)
    cumhaz = _cumhazard(d, x)
    hstar > zero(hstar) || return oftype(cumhaz, -Inf)
    return log(hstar) - cumhaz
end

end # module
