# [Frequently asked questions](@id faq)

## How do I create a modified distribution?

Each modifier is a plain function taking a distribution and returning a distribution:

```@example faq
using ModifiedDistributions, Distributions

affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
weight(Normal(2.0, 1.0), 10.0)
thin(Gamma(2.0, 1.0), 0.3)
cumulative(Gamma(2.0, 1.0))
modify(Weibull(1.5, 2.0), 0.5)
```

## What are the three weight scenarios for `weight`?

1. A fixed constructor weight: `weight(d, 10.0)` multiplies `logpdf` by 10.
2. An observation-time weight: `weight(d)` stores `missing` and expects joint observations `(value = x, weight = w)`.
3. Vectorised weights: `weight(d, [3, 1, 4])` builds a `Product` of weighted components for vector observations.

Constructor and observation weights combine by multiplication when both are present.

## Why does a zero or missing weight give `-Inf` rather than `NaN`?

`0 * logpdf` is `NaN` when `logpdf` is `-Inf`, which poisons a sampler.
`weight` short-circuits zero and missing weights to `-Inf` directly, keeping the log-density well defined (and keeping automatic differentiation happy).

## Why doesn't `thin` change `logpdf`?

`thin` and `cumulative` are forward-series transforms: they carry an operation for a count series a downstream layer (for example a convolution engine) produces.
The distribution itself is unchanged — `logpdf`, `rand`, `cdf` and everything else delegate to the inner distribution.
If you want thinning that changes the density, that is a different operation and lives with the convolution layer that owns the series.

## What is the difference between `get_dist` and `get_dist_recursive`?

`get_dist` removes one layer of wrapping; `get_dist_recursive` keeps unwrapping until it reaches a distribution with no more layers:

```@example faq
nested = weight(affine(Normal(0, 1); scale = 2.0), 3.0)
get_dist(nested)           # the Affine wrapper
```

```@example faq
get_dist_recursive(nested) # the Normal
```

## Can I combine modifiers in any order?

Yes.
Each modifier is a thin wrapper around whatever you pass it, so `weight(affine(d; scale = 2), 10)` and `affine(weight(d, 10); scale = 2)` both work.
Order matters for meaning, not validity: modify the distribution first, then weight the resulting likelihood term, unless you have a reason to do otherwise.

## Why does `modify` reject my discrete distribution or negative additive effect?

The hazard-modification maths implemented here is the closed-form continuous path.
The discrete (interval-censored) path lives upstream in [CensoredDistributions.jl](https://github.com/EpiAware/CensoredDistributions.jl), where the interval types live.
Negative additive effects need hazard clamping and numeric integration of the cumulative hazard (see CensoredDistributions#670) — not yet ported; use the `log` link for hazard reductions (`modify(d, -0.5)` with the default link scales the hazard by `exp(-0.5)`).

## Does this work with composed distribution chains?

Yes.
Loading [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) activates a package extension that lets the modifier verbs apply to a `Sequential` chain.
A chain observes one scalar quantity — its convolved total — so a modifier on the chain modifies that observed scalar: the chain collapses to its convolved total first, then the modifier wraps the resulting univariate distribution.
A `Parallel` has several independent endpoints and no single observed scalar, so the verbs are not defined for it.
See the [Modifiers across composed chains](@ref composed-chains) tutorial.

## How do I cite ModifiedDistributions?

See the citation section of the [README](https://github.com/EpiAware/ModifiedDistributions.jl#supporting-and-citing).
