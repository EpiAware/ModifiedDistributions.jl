## Unreleased

This file tracks notes for major releases and significant milestones; GitHub Releases (auto-generated from merged PRs) cover every release in between.

### Features

- Ported the `Affine` modifier from CensoredDistributions.jl: `affine(dist; scale, shift)` gives the exact change-of-variables distribution of `scale * X + shift`, including tail-accurate `ccdf`/`logccdf`, summary statistics, and discrete-support handling (#10, #13).
- Ported the `Weighted` modifier: `weight(dist, w)` scales `logpdf` by a weight for aggregated or count observations, with observation-time weights, vectorised `Product` forms, and delegated summary statistics (#10, #13).
- Ported the `Transformed` forward-series modifier with `thin`/`cumulative`/`transform`, transparent to every distribution method (#10).
- Added the generic `get_dist`/`get_dist_recursive` unwrap protocol, extendable by downstream wrapper packages (#10).
- Added the `modify` hazard-modification verb: `Modified` transforms a continuous distribution's hazard through a link, with closed-form proportional-hazards (`log`, default) and additive-hazards (`identity`, non-negative effects, hazard accrued from the support minimum) paths. General links, negative additive effects, and the discrete path stay upstream in CensoredDistributions.jl (#12, #17).
- Added a ComposedDistributions.jl package extension letting the modifier verbs apply across a composed `Sequential` chain by modifying its observed scalar (#14).

### Documentation

- Getting-started overview touring every modifier, an FAQ, a guide to writing new modifiers, an extended README, and a package logo (#19).

## v0.1.0 - Initial release

Everything under Unreleased above ships as the initial registered release, on the EpiAwarePackageTools scaffold (managed CI, DocumenterVitepress docs, Aqua/ExplicitImports/JET quality gates, and the multi-backend AD test harness) (#9).
