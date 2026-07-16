# ============================================================================
# Discrete-time reporting hazard: PMF <-> hazard and per-bin effects
# ============================================================================
#
# Vector helpers for the epinowcast discrete-time reporting hazard: PMF ->
# hazard, a link-scale modification of the hazard by additive per-bin effects,
# and hazard -> PMF. Every step is AD-safe arithmetic over vectors. These are
# the building blocks the discrete [`Modified`](@ref) path (a per-bin effect
# vector on a discrete base) reuses; the epinowcast reference-by-report count
# MATRIX layer stays upstream in CensoredDistributions, since it needs the
# interval-censoring discretisation helpers that live there.

@doc raw"

Discrete-time reporting hazard of a delay PMF.

`delay_hazard(pmf)` converts a delay probability-mass vector `pmf` (the
probability of report at each delay ``d = 0, 1, \dots, D``) to the discrete-time
hazard vector ``h``,

```math
h_d = \frac{p_d}{1 - \sum_{d' < d} p_{d'}},
```

the conditional probability of report at delay ``d`` given no report by delay
``d - 1``. The final hazard is clamped to one (``h_D = 1``) so a PMF that does
not sum to one over the truncated grid is treated as fully reported by the
maximum delay.

The reduction is a cumulative sum and a divide, seeded from the input element
type, so `Dual`/tracked numbers propagate and the hazard differentiates under
AD.

# Arguments
- `pmf`: the delay PMF over the grid `0:D`.

# Examples
```@example
using ModifiedDistributions

pmf = [0.2, 0.3, 0.3, 0.2]
ModifiedDistributions.delay_hazard(pmf)
```

# See also
- [`hazard_to_pmf`](@ref): the inverse map (hazard -> PMF).
- [`apply_hazard_effects`](@ref): add logit-scale per-bin effects.
"
function delay_hazard(pmf::AbstractVector)
    n = length(pmf)
    T = eltype(pmf)
    h = zeros(T, n)
    surv = one(T)             # survival: 1 - Σ_{d' < d} p_{d'}
    @inbounds for d in 1:n
        denom = surv
        # A non-positive survival (numerically exhausted PMF) yields a
        # saturated hazard of one rather than a divide-by-zero NaN.
        h[d] = denom > 0 ? pmf[d] / denom : one(T)
        surv -= pmf[d]
    end
    # Enforce the maximum-delay constraint h_D = 1: everything not yet reported
    # is reported in the final bin, so the reconstructed PMF sums to one.
    h[n] = one(T)
    return h
end

@doc raw"

Delay PMF reconstructed from a discrete-time hazard.

`hazard_to_pmf(h)` is the inverse of [`delay_hazard`](@ref): given a hazard
vector ``h`` over delays ``0, 1, \dots, D`` it returns the report-probability
PMF,

```math
p_0 = h_0, \qquad p_d = \left(1 - \sum_{d' < d} p_{d'}\right) h_d.
```

With ``h_D = 1`` the returned PMF sums to one. The reduction carries a running
survival term, seeded from the input element type, so `Dual`/tracked hazards
propagate under AD.

# Arguments
- `h`: the discrete-time hazard over the grid `0:D`, each entry in ``[0, 1]``.

# Examples
```@example
using ModifiedDistributions

pmf = [0.2, 0.3, 0.3, 0.2]
h = ModifiedDistributions.delay_hazard(pmf)
ModifiedDistributions.hazard_to_pmf(h)
```

# See also
- [`delay_hazard`](@ref): the forward map (PMF -> hazard).
- [`apply_hazard_effects`](@ref): add logit-scale per-bin effects.
"
function hazard_to_pmf(h::AbstractVector)
    n = length(h)
    T = eltype(h)
    p = zeros(T, n)
    surv = one(T)
    @inbounds for d in 1:n
        p[d] = surv * h[d]
        surv -= p[d]
    end
    return p
end

@doc raw"

Modify a delay PMF through its discrete-time hazard with additive logit effects.

`apply_hazard_effects(pmf, effects)` reshapes a baseline delay `pmf` by adding
`effects` to its hazard on the logit scale and reconstructing the PMF,

```math
\operatorname{logit}(h^{*}_d) = \operatorname{logit}(h_d) + \eta_d, \qquad
p^{*} = \operatorname{hazard\_to\_pmf}(h^{*}),
```

the epinowcast logit-hazard model: a positive effect speeds reporting at that
delay and the returned PMF is the modified per-reference-date delay
distribution. The maximum-delay hazard stays one, so ``p^{*}`` sums to one.

The map is `logit -> add -> logistic -> reconstruct`, all AD-safe arithmetic, so
`Dual`/tracked `effects` differentiate through.

# Arguments
- `pmf`: the baseline delay PMF over the grid `0:D`.
- `effects`: the additive logit-hazard effects ``\eta_d``, one per delay, same
  length as `pmf`. Use zeros for no modification.

# Examples
```@example
using ModifiedDistributions

pmf = [0.2, 0.3, 0.3, 0.2]
# A positive early-delay effect speeds reporting at short delays.
effects = [0.8, 0.4, 0.0, 0.0]
ModifiedDistributions.apply_hazard_effects(pmf, effects)
```

# See also
- [`delay_hazard`](@ref), [`hazard_to_pmf`](@ref): the hazard <-> PMF maps.
"
function apply_hazard_effects(pmf::AbstractVector, effects::AbstractVector)
    return _apply_hazard_link(pmf, effects, LogitLink)
end

# Generic-link version of `apply_hazard_effects`: reshape a baseline PMF by
# adding per-bin `effects` to its discrete-time hazard on the `link`'s scale,
# `h*_d = g⁻¹(g(h_d) + effect_d)`, then reconstruct. `apply_hazard_effects` is
# the logit-link case; the discrete `Modified` path reuses this for any link,
# including a user callable. The final-bin hazard is pinned to one (the
# maximum-delay constraint) so the reconstructed PMF stays normalised.
function _apply_hazard_link(
        pmf::AbstractVector, effects::AbstractVector, link::HazardLink)
    length(pmf) == length(effects) || throw(DimensionMismatch(
        "effects must have one entry per delay; got $(length(effects)) for " *
        "a PMF of length $(length(pmf))"))
    h = delay_hazard(pmf)
    n = length(h)
    T = promote_type(eltype(h), eltype(effects))
    hstar = Vector{T}(undef, n)
    @inbounds for d in 1:n
        if d == n
            hstar[d] = one(T)
        else
            hstar[d] = link.invlink(link.g(h[d]) + effects[d])
        end
    end
    return hazard_to_pmf(hstar)
end
