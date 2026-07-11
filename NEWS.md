## Unreleased

- **Breaking (upstream-driven):** adopt ConvolvedDistributions 0.2, which makes the bare-distribution `convolve_series(delay, series)` discrete-only — a continuous delay now throws, because discretising it is an explicit modelling choice (single- vs double-interval censoring) upstream will not make silently. The ConvolvedDistributions extension's `convolve_series` methods (forward-transformed and other modified delays) preserve their behaviour by discretising the inner continuous delay with the interval-censored-secondary scheme (`discretise_pmf`) before convolving, so the modifier counts are unchanged; a bare continuous delay must now be discretised by the caller (`convolve_series(discretise_pmf(delay, maxlag), series)`). The `interval` kwarg now flows to `discretise_pmf` (a non-unit width discretises on that grid) rather than being rejected. Compat bumped to `0.2`.

This file tracks notes for major releases and significant milestones; GitHub Releases (auto-generated from merged PRs) cover every release in between.

## v0.1.0 - Initial release

Built on the EpiAwarePackageTools scaffold: managed CI, DocumenterVitepress docs, Aqua/ExplicitImports/JET quality gates, the six-backend AD gradient harness, and the evaluation + AD benchmark suite (#9, #25).

### Features

- Ported the `Affine` modifier from CensoredDistributions.jl: `affine(dist; scale, shift)` gives the exact change-of-variables distribution of `scale * X + shift`, including direct `ccdf`/`logccdf` (precise in the upper tail), summary statistics, and discrete-support handling (#10, #13).
- Ported the `Weighted` modifier: `weight(dist, w)` scales `logpdf` by a weight for aggregated or count observations, with observation-time weights, vectorised `Product` forms, and delegated summary statistics (#10, #13).
- Ported the `Transformed` forward-series modifier with `series_transform`/`thin`/`cumulative`, transparent to every distribution method; the generic verb is named `series_transform` so it cannot clash with `DataFrames.transform` (#10, #35, #38).
- Added the generic `get_dist`/`get_dist_recursive` unwrap protocol, extendable by downstream wrapper packages (#10).
- Added the `modify` hazard-modification verb: `Modified` transforms a continuous distribution's hazard through a link, with closed-form proportional-hazards (`log`, default) and additive-hazards (`identity`, non-negative effects, hazard accrued from the support minimum) paths. General links, negative additive effects, and the discrete path stay upstream in CensoredDistributions.jl (#12, #17).
- Added a ComposedDistributions.jl package extension letting the modifier verbs apply across a composed `Sequential` chain by modifying its observed scalar (#14, #41).
- Added a ConvolvedDistributions.jl package extension: the forward-series transforms (`thin`/`cumulative`/`series_transform`) ride the convolved count series a convolution layer produces, modified distributions serve as convolution components through an AD-safe closed-form survival, and each wrapper reconstructs its own quadrature window (#41).
- Added batched vector-observation evaluation: a `Convolved` component routes a whole batch of observations through a single quadrature solve via the batched-evaluation traits, while other inners keep exact per-point evaluation (#41).
- Reinstated the `AbstractModifiedDistribution` supertype and interface contract shared with the CensoredDistributions hierarchy (#27).

### Documentation

- Getting-started overview touring every modifier, tutorials (weighted likelihoods, the modifier pipeline, composed chains), an FAQ, developer guides, an extended README, and a package logo (#19, #20, #23).
