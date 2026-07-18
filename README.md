# ModifiedDistributions <img src="docs/src/assets/logo.svg" width="150" alt="ModifiedDistributions logo" align="right">

<!-- badges:start -->
| **Documentation** | **Build Status** | **Code Quality** | **License & DOI** | **Downloads** |
|:-----------------:|:----------------:|:----------------:|:-----------------:|:-------------:|
| [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://modifieddistributions.epiaware.org/stable/) [![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://modifieddistributions.epiaware.org/dev/) | [![Test](https://github.com/EpiAware/ModifiedDistributions.jl/actions/workflows/test.yaml/badge.svg?branch=main)](https://github.com/EpiAware/ModifiedDistributions.jl/actions/workflows/test.yaml) [![codecov](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg)](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl) [![AD](https://github.com/EpiAware/ModifiedDistributions.jl/actions/workflows/ad.yaml/badge.svg?branch=main)](https://github.com/EpiAware/ModifiedDistributions.jl/actions/workflows/ad.yaml) | [![SciML Code Style](https://img.shields.io/static/v1?label=code%20style&message=SciML&color=9558b2&labelColor=389826)](https://github.com/SciML/SciMLStyle) [![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl) [![JET](https://img.shields.io/badge/%E2%9C%88%EF%B8%8F%20tested%20with%20-%20JET.jl%20-%20red)](https://github.com/aviatesk/JET.jl) | [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![Downloads](https://img.shields.io/badge/dynamic/json?url=http%3A%2F%2Fjuliapkgstats.com%2Fapi%2Fv1%2Ftotal_downloads%2FModifiedDistributions&query=total_requests&label=Downloads)](https://juliapkgstats.com/pkg/ModifiedDistributions) [![Downloads](https://img.shields.io/badge/dynamic/json?url=http%3A%2F%2Fjuliapkgstats.com%2Fapi%2Fv1%2Fmonthly_downloads%2FModifiedDistributions&query=total_requests&suffix=%2Fmonth&label=Downloads)](https://juliapkgstats.com/pkg/ModifiedDistributions) |

| ForwardDiff | ReverseDiff (tape) | Enzyme forward | Enzyme reverse | Mooncake reverse | Mooncake forward |
|:---:|:---:|:---:|:---:|:---:|:---:|
| [![cov ForwardDiff](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-forwarddiff)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-forwarddiff) | [![cov ReverseDiff](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-reversediff)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-reversediff) | [![cov Enzyme forward](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-enzyme-forward)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-enzyme-forward) | [![cov Enzyme reverse](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-enzyme-reverse)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-enzyme-reverse) | [![cov Mooncake reverse](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-mooncake-reverse)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-mooncake-reverse) | [![cov Mooncake forward](https://codecov.io/gh/EpiAware/ModifiedDistributions.jl/graph/badge.svg?flag=ad-mooncake-forward)](https://app.codecov.io/gh/EpiAware/ModifiedDistributions.jl?flags%5B0%5D=ad-mooncake-forward) |
<!-- badges:end -->

Wrappers for [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) univariate distributions that each change one behaviour — rescaling, likelihood weighting, hazard modification, or a forward transform — while everything else keeps working, plus the generic `get_dist` unwrap protocol.

## Why ModifiedDistributions?

- A model routinely needs "the same delay, but weighted, rescaled, or
  hazard-shifted"; ModifiedDistributions wraps each change as one small,
  composable piece instead of hand-deriving the change-of-variables maths
  each time.
- Every wrapper stays a complete distribution — sampling, quantiles,
  moments — so a modified delay drops into a PPL model exactly like the
  distribution it wraps.
- Wrappers nest and unwrap cleanly, so a pipeline built from several small
  changes stays inspectable and reversible rather than collapsing into one
  opaque function.
- Weighting a likelihood is a one-line wrapper instead of an ad hoc
  `n * logpdf(...)` term scattered through model code.
- Hazard-scale changes, such as an intervention that shifts risk, have no
  Distributions.jl counterpart and are given here in closed form.
- The same wrappers apply across ComposedDistributions.jl chains and
  ConvolvedDistributions.jl count series, so a delay modified once carries
  that change through the rest of the pipeline.

## Getting started

See [documentation](https://modifieddistributions.epiaware.org/dev/) for a full walkthrough.

Modifiers nest, so a real pipeline stacks several changes on one delay: an
intervention that halves the hazard of admission, a half-day reporting lag,
and a 60% ascertainment fraction tagged for a downstream count series.

```julia
using ModifiedDistributions, Distributions

admission = Gamma(2.0, 1.0)   # baseline infection-to-admission delay

pipeline = thin(affine(modify(admission, -log(2.0)); shift = 0.5), 0.6)
```

`pipeline` prints as the nested wrapper it is.

```julia
pipeline
```

Each stage compounds the three-day survival: halving the hazard raises it to
its square root, and the reporting lag raises it further (day 3 is now
effectively day 2.5 post-admission); `thin` does not touch the scalar
distribution at all, only tagging it for later use.

```julia
(baseline_survival = ccdf(admission, 3.0),
    after_intervention = ccdf(modify(admission, -log(2.0)), 3.0),
    after_reporting_lag = ccdf(pipeline, 3.0))
```

Unwrapping recovers the baseline delay underneath every layer.

```julia
get_dist_recursive(pipeline) == admission
```

The [getting started guide](https://modifieddistributions.epiaware.org/dev/getting-started/)
carries this same pipeline further: what `thin` does once it meets a real
count series, and how modifiers apply across a composed chain.

## Relationship to Distributions.jl

Distributions.jl already supports affine arithmetic on some distributions (`2.0 * X + 1.0`) by returning a new parameterisation where one exists.
`affine` instead wraps any univariate distribution with the exact change-of-variables maths, so it works uniformly and keeps the inner distribution recoverable via `get_dist`.
Likewise `weight` replaces ad hoc `n * logpdf(d, x)` terms in model code with a distribution object that carries its weight, and `modify` gives hazard-scale transforms that have no Distributions.jl counterpart.

## What packages work well with ModifiedDistributions.jl?

- [Distributions.jl](https://github.com/JuliaStats/Distributions.jl) supplies the distributions being modified.
- [Turing.jl](https://github.com/TuringLang/Turing.jl) and other PPLs consume the wrappers directly, e.g. weighted likelihoods for aggregated data.
- [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) composes distributions into chains; a package extension lets the modifier verbs apply across a chain's observed total.
- [ConvolvedDistributions.jl](https://github.com/EpiAware/ConvolvedDistributions.jl) sums independent delays and convolves count series; a package extension applies `thin`/`cumulative` to the convolved counts and lets modified distributions serve as convolution components.
- [CensoredDistributions.jl](https://github.com/EpiAware/CensoredDistributions.jl) and the wider [EpiAware](https://github.com/EpiAware) ecosystem build censoring, convolution, and composition layers on top of these modifiers.

## Where to learn more

- Want to get started running code? See the [getting started guide](https://modifieddistributions.epiaware.org/dev/getting-started/).
- Want to understand the API? See the [API reference](https://modifieddistributions.epiaware.org/dev/lib/public).
- Want to see the code? Check out our [GitHub repository](https://github.com/EpiAware/ModifiedDistributions.jl).

## Getting help

For usage questions, ask on the [Julia Discourse](https://discourse.julialang.org)
(the SciML or usage categories) or the [epinowcast community forum](https://community.epinowcast.org),
our home for epidemiological modelling questions.
Please use [GitHub issues](https://github.com/EpiAware/ModifiedDistributions.jl/issues)
for bug reports and feature requests only.

## Contributing

We welcome contributions and new contributors! This package follows [ColPrac](https://github.com/SciML/ColPrac) and the [SciML style](https://github.com/SciML/SciMLStyle).

## Supporting and citing

If you would like to support ModifiedDistributions, please star the repository — such metrics help secure future funding.

If you use ModifiedDistributions in your work, please cite it (the DOI is a placeholder until the first Zenodo release):

```bibtex
@software{ModifiedDistributions_jl,
  author       = {Sam Abbott and EpiAware contributors},
  title        = {ModifiedDistributions.jl},
  year         = {2026},
  doi          = {10.5281/zenodo.XXXXXXX},
  url          = {https://github.com/EpiAware/ModifiedDistributions.jl}
}
```

## Code of conduct

Please note that the ModifiedDistributions project is released with a [Contributor Code of Conduct](https://github.com/EpiAware/.github/blob/main/CODE_OF_CONDUCT.md). By contributing, you agree to abide by its terms.
