## Unreleased

This file tracks notes for major releases and significant milestones; GitHub Releases (auto-generated from merged PRs) cover every release in between.

## v0.1.0 - Initial release

Built on the EpiAwarePackageTools scaffold: managed CI, DocumenterVitepress docs, Aqua/ExplicitImports/JET quality gates, the six-backend AD gradient harness, and the evaluation + AD benchmark suite (#9, #25).

### Features

- Ported the `Affine` modifier from CensoredDistributions.jl: `affine(dist; scale, shift)` gives the exact change-of-variables distribution of `scale * X + shift`, including direct `ccdf`/`logccdf` (precise in the upper tail), summary statistics, and discrete-support handling (#10, #13).
- Ported the `Weighted` modifier: `weight(dist, w)` scales `logpdf` by a weight for aggregated or count observations, with observation-time weights, vectorised `Product` forms, and delegated summary statistics (#10, #13).
- Ported the `Transformed` forward-series modifier with the exported `thin`/`cumulative` specialisations and the public (un-exported) generic `map_series` escape hatch, transparent to every distribution method (#10, #35).
- Added the generic `get_dist`/`get_dist_recursive` unwrap protocol, extendable by downstream wrapper packages (#10).
- Added the `modify` hazard-modification verb: `Modified` transforms a continuous distribution's hazard through a link, with closed-form proportional-hazards (`log`, default) and additive-hazards (`identity`, non-negative effects, hazard accrued from the support minimum) paths. General links, negative additive effects, and the discrete path stay upstream in CensoredDistributions.jl (#12, #17).
- Added a ComposedDistributions.jl package extension letting the modifier verbs apply across a composed `Sequential` chain by modifying its observed scalar (#14).
- Reinstated the `AbstractModifiedDistribution` supertype and interface contract shared with the CensoredDistributions hierarchy (#27).

### Documentation

- Getting-started overview touring every modifier, tutorials (weighted likelihoods, the modifier pipeline, composed chains), an FAQ, developer guides, an extended README, and a package logo (#19, #20, #23).
