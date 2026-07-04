# [Getting started](@id getting-started)

Welcome to the `ModifiedDistributions` documentation.
This page is the quickstart: what the package is for, how to install it, and a tour of each modifier.

`ModifiedDistributions` provides unary modifiers for [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) univariate distributions.
Each modifier wraps exactly one distribution and changes one behaviour, returning something that still works anywhere a distribution is expected.
Modifiers nest freely, and the [`get_dist`](@ref) protocol unwraps them again.

## Installation

```julia
using Pkg
Pkg.add("ModifiedDistributions")
```

Load the package alongside Distributions.jl:

```@example quickstart
using ModifiedDistributions, Distributions
```

## Affine transforms

[`affine`](@ref) gives the exact change-of-variables distribution of `Y = scale * X + shift`:

```@example quickstart
d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
(mean(d), logpdf(d, 5.0), quantile(d, 0.5))
```

The full distribution interface works, including sampling and tail-accurate `ccdf`/`logccdf`.

## Likelihood weights

[`weight`](@ref) scales the `logpdf` contribution of an observation, which is the standard trick for aggregated or count data:

```@example quickstart
base = Normal(2.0, 1.0)
wd = weight(base, 25)  # an observation seen 25 times
logpdf(wd, 3.5) ≈ 25 * logpdf(base, 3.5)
```

Weights can also arrive at observation time, or vectorised as a `Product` distribution:

```@example quickstart
wd_obs = weight(base)  # weight supplied with the observation
logpdf(wd_obs, (value = 3.5, weight = 25))
```

```@example quickstart
wds = weight(base, [3, 1, 4])
logpdf(wds, [1.9, 2.1, 2.3])
```

Everything other than `logpdf` (sampling, `cdf`, quantiles, summary statistics) delegates to the underlying distribution.

## Forward-series transforms

[`thin`](@ref) and [`cumulative`](@ref) attach a deterministic operation intended for a downstream count series (for example, one produced by a convolution layer): thinning by an ascertainment probability, or accumulating to cumulative incidence.
They are transparent to every distribution method:

```@example quickstart
td = thin(Gamma(2.0, 1.0), 0.3)
logpdf(td, 2.0) == logpdf(Gamma(2.0, 1.0), 2.0)
```

The generic [`transform`](@ref) accepts any callable `series -> series` as an escape hatch.

## Hazard modification

[`modify`](@ref) changes a continuous distribution's hazard function through a link:

```@example quickstart
base = Weibull(1.5, 2.0)
md = modify(base, 0.5)  # proportional hazards: h*(t) = exp(0.5) * h(t)
ccdf(md, 1.0) ≈ ccdf(base, 1.0)^exp(0.5)
```

The default `log` link gives proportional hazards; `link = identity` gives additive hazards for non-negative effects.

## Unwrapping

Modifiers nest, and [`get_dist`](@ref) / [`get_dist_recursive`](@ref) peel them back off:

```@example quickstart
nested = weight(affine(Normal(0, 1); scale = 2.0), 3.0)
(get_dist(nested), get_dist_recursive(nested))
```

Downstream packages can extend `get_dist` for their own wrappers to join the same protocol.

## Learning more

- Want the full interface? See the [Public API](@ref public-api).
- Common questions are answered in the [FAQ](@ref faq).
- Writing your own wrapper? See [Writing a new modifier](@ref extending).
- Want to report a problem or ask a question? Open an issue or start a
  discussion on the [GitHub repository](https://github.com/EpiAware/ModifiedDistributions.jl).
