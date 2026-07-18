# [Frequently asked questions](@id faq)

## How do I create a modified distribution?

Each modifier is a plain function taking a distribution and returning a distribution.
The printed result below shows each wrapper displaying the distribution it wraps:

```@example faq
using ModifiedDistributions, Distributions

[affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0),
    weight(Normal(2.0, 1.0), 10.0),
    thin(Gamma(2.0, 1.0), 0.3),
    cumulative(Gamma(2.0, 1.0)),
    modify(Weibull(1.5, 2.0), 0.5)]
```

## What are the three weight scenarios for `weight`?

1. A fixed constructor weight: `weight(d, 10.0)` multiplies `logpdf` by 10.
2. An observation-time weight: `weight(d)` stores `missing` and expects joint observations `(value = x, weight = w)`.
3. Vectorised weights: `weight(d, [3, 1, 4])` builds a `Product` of weighted components for vector observations.

Constructor and observation weights combine by multiplication when both are present.

In every form the result stays a real, samplable Distributions.jl distribution.
See the [Weighted likelihoods](@ref weighted-likelihoods) tutorial's *Weighted distributions stay samplable* section for why that matters in a PPL.

## Why does a zero or missing weight give `-Inf` rather than `NaN`?

`0 * logpdf` would be `NaN` at an out-of-support value (`logpdf = -Inf`), which poisons a sampler; `weight` short-circuits a zero or missing weight straight to `-Inf` instead.
See the [Weighted likelihoods](@ref weighted-likelihoods) tutorial's *Why zero and missing weights give `-Inf`* section for the full reasoning, including why it keeps automatic differentiation well defined.

## Why doesn't `thin` change `logpdf`?

`thin` and `cumulative` are forward-series transforms: they carry an operation for a count series a downstream layer (for example a convolution engine) produces.
The distribution itself is unchanged — `logpdf`, `rand`, `cdf` and everything else delegate to the inner distribution.
If you want thinning that changes the density, that is a different operation and lives with the convolution layer that owns the series.

## What is the difference between `get_dist` and `get_dist_recursive`?

`get_dist` removes one layer of wrapping; `get_dist_recursive` keeps unwrapping until it reaches a distribution with no more layers.
See the [Unwrapping](@ref getting-started) section of the Getting started overview for a worked example.

## Can I combine modifiers in any order?

Yes.
Each modifier is a thin wrapper around whatever you pass it, so `weight(affine(d; scale = 2), 10)` and `affine(weight(d, 10); scale = 2)` both work.
Order matters for meaning, not validity: modify the distribution first, then weight the resulting likelihood term, unless you have a reason to do otherwise.

## Which hazard modifications does `modify` support?

The `effect` is a scalar, a callable `effect(t)`, or a per-bin vector, and the path is chosen by the base and the link (see the [Getting started](@ref getting-started) overview and the [modifier pipeline](@ref modifier-pipeline) tutorial for the closed-form maths).

| Base | Effect | Link | Behaviour |
|---|---|---|---|
| Continuous | Scalar | `log` | Closed form: proportional hazards, survival raised to `exp(effect)`. |
| Continuous | Scalar, negative | `identity` | Closed form: hazard clamped to `max(h(t) + β, 0)`, survival reconstructed exactly from the base cumulative hazard between clamp knots (no quadrature). A non-monotone base hazard can go sub-stochastic (defective) under a strong negative effect, and `quantile`/`rand` above the total mass then throw. |
| Discrete | Per-bin vector | any (including `:logit` or a user callable) | Closed form: reshapes each delay bin's reporting hazard on the link scale, reconstructing the PMF exactly — the epinowcast discrete-time reporting hazard. |
| Continuous | Callable `effect(t)` | any | Deferred: a time-varying hazard has no closed-form cumulative hazard, so it needs numeric integration. Tracked in [issue #77](https://github.com/EpiAware/ModifiedDistributions.jl/issues/77) part (b); such a `Modified` constructs, but evaluating it throws until the path lands. |

The epinowcast reference-by-report expected-count matrix layer stays upstream in [CensoredDistributions.jl](https://github.com/EpiAware/CensoredDistributions.jl).

## Does this work with composed distribution chains?

Yes.
Loading [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) activates a package extension that lets the modifier verbs apply to a `Sequential` chain's one observed scalar (a `Parallel` has no single observed scalar, so the verbs are not defined for it).
See the [Modifiers across composed chains](@ref composed-chains) tutorial for why a chain has exactly one observed scalar and a worked example.

## How do I cite ModifiedDistributions?

See the citation section of the [README](https://github.com/EpiAware/ModifiedDistributions.jl#supporting-and-citing).
