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

In every form the result is still a real Distributions.jl distribution, unlike an ad hoc `n * logpdf(d, x)` term or Turing.jl's `@addlogprob!`.
Sampling delegates to the base while only the likelihood contribution is scaled, so a Turing.jl model (or any PPL built on Distributions.jl) that uses a weighted distribution stays a complete generative model — prior simulation and posterior-predictive draws keep working.

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

## Which hazard modifications does `modify` support?

The `log` link (proportional hazards) and the `identity` link with a non-negative effect use closed forms.
Any other link (`:logit` or an invertible callable from [`hazard_link`](@ref)), a negative additive effect, or a callable `effect(t)` on a continuous base routes through numeric cumulative-hazard integration.
A discrete base takes a per-bin vector effect and reconstructs the modified PMF exactly through the discrete-time reporting hazard, for any link.

The closed-form (`log` and non-negative `identity`) and the discrete per-bin paths need only the core package.
The numeric path reuses [ConvolvedDistributions.jl](https://github.com/EpiAware/ConvolvedDistributions.jl)'s Gauss-Legendre quadrature, so it lives in a package extension.
A `Modified` on the numeric path (a `:logit`/custom link, a negative additive effect, or a callable effect on a continuous base) still constructs without ConvolvedDistributions loaded, but evaluating it (`logpdf`, `cdf`, `quantile`, `rand`) throws an `ArgumentError` telling you to run `using ConvolvedDistributions`.
Once that package is loaded the numeric path evaluates normally.
This is the standard weak-dependency pattern: you only pay for the quadrature dependency when you use the numeric path.

The epinowcast reference-by-report expected-count matrix layer (and the interval-censoring discretisation it needs) stays upstream in [CensoredDistributions.jl](https://github.com/EpiAware/CensoredDistributions.jl).
The numeric path differentiates under ForwardDiff for bases with a ForwardDiff-safe survival (`LogNormal`, `Weibull`); a `Gamma` base on the numeric path needs the AD-safe gamma survival that lives upstream.

## Does this work with composed distribution chains?

Yes.
Loading [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) activates a package extension that lets the modifier verbs apply to a `Sequential` chain.
A chain observes one scalar quantity — its convolved total — so a modifier on the chain modifies that observed scalar: the chain collapses to its convolved total first, then the modifier wraps the resulting univariate distribution.
A `Parallel` has several independent endpoints and no single observed scalar, so the verbs are not defined for it.
See the [Modifiers across composed chains](@ref composed-chains) tutorial.

## How do I cite ModifiedDistributions?

See the citation section of the [README](https://github.com/EpiAware/ModifiedDistributions.jl#supporting-and-citing).
