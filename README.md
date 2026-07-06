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

- **Rescale and shift** — exact `affine` transforms of any univariate distribution, with the full distribution interface intact.
- **Weight likelihoods** — scale an observation's contribution with `weight` while the result stays a real, samplable distribution, so a Turing.jl model (or any PPL built on Distributions.jl) remains a complete generative model.
- **Modify hazards** — proportional or additive hazard changes with `modify`, in closed form.
- **Forward transforms** — carry thinning or accumulation for a downstream count series without touching the distribution itself.
- **Unwrap anywhere** — recover the distribution underneath any wrapper with `get_dist`.
- **Works with composed chains** — modifiers apply across ComposedDistributions.jl chains.
- **AD-ready** — tested in CI against ForwardDiff, ReverseDiff, Enzyme, and Mooncake.

## Getting started

See [documentation](https://modifieddistributions.epiaware.org/stable/) for a full walkthrough.

An affine transform gives the exact distribution of `Y = 2X + 1`, and the whole distribution interface follows:

```julia
using ModifiedDistributions, Distributions

d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
(mean = mean(d), logpdf = logpdf(d, 5.0), median = quantile(d, 0.5))
```

Weighting scales the log-likelihood contribution of an observation seen 10 times.
The two numbers printed below match, showing the weighted log-density is exactly 10 times the base:

```julia
wd = weight(d, 10.0)
(weighted = logpdf(wd, 5.0), manual = 10.0 * logpdf(d, 5.0))
```

Hazard modification works in closed form.
Halving the hazard raises the survival function to the power one half, and the two printed values agree:

```julia
md = modify(LogNormal(1.5, 0.5), -log(2.0))
(modified = ccdf(md, 2.0), base_sqrt = ccdf(LogNormal(1.5, 0.5), 2.0)^0.5)
```

Unwrapping the weighted distribution returns the affine transform underneath:

```julia
get_dist(wd)
```

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

- [GitHub Discussions](https://github.com/EpiAware/ModifiedDistributions.jl/discussions)
- [GitHub Repository](https://github.com/EpiAware/ModifiedDistributions.jl)

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
