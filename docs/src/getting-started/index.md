# [Getting started](@id getting-started)

Welcome to the `ModifiedDistributions` documentation.
This page is the quickstart: what the package is for, how to install it, and a tour of each modifier.

`ModifiedDistributions` provides modifiers for [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) univariate distributions.
A modifier is a wrapper around exactly one distribution that changes one behaviour, returning something that still works anywhere a distribution is expected.
Modifiers nest freely, and the [`get_dist`](@ref) protocol unwraps them again.

## Installation

```julia
using Pkg
Pkg.add("ModifiedDistributions")
```

See the [Installation](@ref installation) page for more detail.

Load the package alongside Distributions.jl:

```@example quickstart
using ModifiedDistributions, Distributions
```

## A composed pipeline

Modifiers nest, so a real pipeline stacks several changes on one delay: an
intervention that halves the hazard of admission, a half-day reporting lag,
and a 60% ascertainment fraction tagged for a downstream count series.

```@example quickstart
admission = Gamma(2.0, 1.0)   # baseline infection-to-admission delay

pipeline = thin(affine(modify(admission, -log(2.0)); shift = 0.5), 0.6)
```

`pipeline` prints as the nested wrapper it is.

```@example quickstart
pipeline
```

Each stage compounds the three-day survival: halving the hazard raises it to
its square root, and the reporting lag raises it further (day 3 is now
effectively day 2.5 post-admission); `thin` does not touch the scalar
distribution at all, only tagging it for later use against a count series.

```@example quickstart
(baseline_survival = ccdf(admission, 3.0),
    after_intervention = ccdf(modify(admission, -log(2.0)), 3.0),
    after_reporting_lag = ccdf(pipeline, 3.0))
```

Unwrapping recovers the baseline delay underneath every layer.

```@example quickstart
get_dist_recursive(pipeline) == admission
```

The rest of this page tours each modifier on its own, and the
[Extensions](@ref) section below shows what `thin` does once it meets a real
count series.

## Affine transforms

[`affine`](@ref) gives the exact change-of-variables distribution of `Y = scale * X + shift`:

```@example quickstart
d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
(mean = mean(d), logpdf = logpdf(d, 5.0), median = quantile(d, 0.5))
```

The full distribution interface works, including sampling and `ccdf`/`logccdf` computed directly rather than via `1 - cdf`, so upper-tail probabilities stay precise.

## Likelihood weights

[`weight`](@ref) scales the `logpdf` contribution of an observation, which is the standard trick for aggregated or count data.
The two numbers printed below match, showing the weighted log-density is exactly 25 times the base:

```@example quickstart
base = Normal(2.0, 1.0)
wd = weight(base, 25)  # an observation seen 25 times
(weighted = logpdf(wd, 3.5), manual = 25 * logpdf(base, 3.5))
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

Everything other than `logpdf` (sampling, `cdf`, quantiles, summary statistics) delegates to the underlying distribution, so a weighted distribution stays a complete generative object in a probabilistic programming model.

## Forward-series transforms

[`thin`](@ref) and [`cumulative`](@ref) attach a deterministic operation intended for a downstream count series (for example, one produced by a convolution layer): thinning by an ascertainment probability, or accumulating to cumulative incidence.
They are transparent to every distribution method, so the two log-densities printed below are identical:

```@example quickstart
td = thin(Gamma(2.0, 1.0), 0.3)
(thinned = logpdf(td, 2.0), base = logpdf(Gamma(2.0, 1.0), 2.0))
```

The generic [`series_transform`](@ref) accepts any callable `series -> series` as an escape hatch.
`thin` and `cumulative` cover the common cases; `series_transform` takes any callable `series -> series`.

## Hazard modification

[`modify`](@ref) changes a continuous distribution's hazard function through a link.
Under proportional hazards the survival function is raised to the power `exp(effect)`, and the two values printed below agree:

```@example quickstart
base = Weibull(1.5, 2.0)
md = modify(base, 0.5)  # proportional hazards: h*(t) = exp(0.5) * h(t)
(modified = ccdf(md, 1.0), base_power = ccdf(base, 1.0)^exp(0.5))
```

The default `log` link gives proportional hazards; `link = identity` gives additive hazards for non-negative effects.

## Unwrapping

Modifiers nest, and [`get_dist`](@ref) / [`get_dist_recursive`](@ref) peel them back off:

```@example quickstart
nested = weight(affine(Normal(0, 1); scale = 2.0), 3.0)
(get_dist(nested), get_dist_recursive(nested))
```

Downstream packages can extend `get_dist` for their own wrappers to join the same protocol.

## Extensions

Loading [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) alongside this package activates an extension that lets the modifier verbs apply to a composed `Sequential` chain.
A chain observes one scalar quantity, its convolved total, so a modifier on the chain modifies that observed scalar:

```julia
using ModifiedDistributions, ComposedDistributions, Distributions

chain = sequential(:onset_admit => Gamma(2.0, 1.0),
    :admit_death => LogNormal(0.5, 0.4))
wd = weight(chain, 3.0)  # weights the chain's observed total
logpdf(wd, 5.0)          # 3 times the log-density of the observed total
```

The extension in this package handles applying modifiers to a chain; the reverse direction — rewrapping modifier leaves inside a chain — lives in ComposedDistributions.jl.
See the [Modifiers across composed chains](@ref composed-chains) tutorial for a worked example.

Loading [ConvolvedDistributions.jl](https://github.com/EpiAware/ConvolvedDistributions.jl) activates a second extension.
Its series verb `convolve_series(delay, series)` turns an expected-events series into expected downstream counts, and the extension makes the forward-series transforms act on those counts: [`thin`](@ref) rescales them by an ascertainment fraction, [`cumulative`](@ref) accumulates them, and [`series_transform`](@ref) applies any callable.
It also lets the modifier wrappers serve as components of a distribution-level convolution, including under automatic differentiation:

```julia
using ModifiedDistributions, ConvolvedDistributions, Distributions

total = convolved(Gamma(2.0, 1.0), LogNormal(0.5, 0.4))
infections = [0.0, 10.0, 40.0, 90.0, 60.0, 20.0]
convolve_series(thin(total, 0.3), infections)  # 30% ascertained counts
```

See the [Convolving modified distributions](@ref convolved-modifiers) tutorial for a worked example.

## Learning more

- Want the full interface? See the [Public API](@ref public-api).
- Common questions are answered in the [FAQ](@ref faq).
- Writing your own wrapper? See [Writing a new modifier](@ref extending).

## Getting help

For usage questions, ask on the [Julia Discourse](https://discourse.julialang.org)
(the SciML or usage categories) or the [epinowcast community forum](https://community.epinowcast.org),
our home for epidemiological modelling questions.
Please use [GitHub issues](https://github.com/EpiAware/ModifiedDistributions.jl/issues)
for bug reports and feature requests only.
