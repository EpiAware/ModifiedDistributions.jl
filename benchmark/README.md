# ModifiedDistributions.jl Benchmarks

Benchmarks for the modifier wrappers, reading each modifier's overhead against a bare base LogNormal.

## Quick Start

### One-time Setup

Install the `benchpkg` CLI to your global Julia environment:

```bash
task benchmark-install
# Or: julia -e 'using Pkg; Pkg.add("AirspeedVelocity")'
```

Ensure `~/.julia/bin` is on your PATH.

### Running Benchmarks

```bash
# Benchmark current state
task benchmark

# Compare main branch vs current state
task benchmark-compare

# Filter to specific benchmarks
task benchmark -- --filter=Modified
task benchmark-compare -- --filter=Weighted
```

## Benchmark Structure

```
Baseline/
  LogNormal/       (construction, logpdf, pdf, cdf, ccdf, quantile, rand)

Affine/
  LogNormal/       (construction, logpdf, pdf, cdf, ccdf, quantile, rand)

Weighted/
  scalar/          (construction, logpdf)
  Product/         (construction, vectorised logpdf)

Transformed/
  thin/            (construction, logpdf, cdf, rand)
  cumulative/      (construction, logpdf, cdf, rand)

Modified/
  LogLink/         (construction, logpdf, pdf, cdf, ccdf, quantile, rand)
  IdentityLink/    (construction, logpdf, pdf, cdf, ccdf, quantile, rand)

AD gradients/
  <scenario>/      (one leaf per AD backend)
```

The `Baseline` group is the floor: every modifier wraps the same base LogNormal and benchmarks the same operations over the same points.
`Transformed` rows should sit on that floor (the forward ops are transparent to every distribution method).
`Modified/IdentityLink` `quantile` and `rand` exercise the monotone-bisection cdf inversion, the one non-closed-form path.

The `AD gradients` group (`benchmark/src/ad_gradients.jl`) times `DifferentiationInterface.gradient` for every (scenario, backend) pair from the `test/ADFixtures` path package, which also drives the AD test suite (`test/ad/runtests.jl`), keeping the two surfaces in lock-step.
Backends cover ForwardDiff, ReverseDiff (tape), Mooncake (reverse and forward) and Enzyme (reverse and forward).
Each pair is smoke-tested for a finite gradient before registration, so known-broken combinations are silently omitted and the suite can run unattended.

## CI Integration

Benchmarks run automatically on PRs via `.github/workflows/benchmark.yaml`: each of PR head and `main` is benchmarked in its own job and a single comparison comment is posted (see `benchmark/compare.jl`, which calls the shared `EpiAwarePackageTools.Benchmarks` harness).
Pushes to `main` and tags additionally record a performance timeline to the repo's `benchmarks` branch via `.github/workflows/benchmark-history.yaml`, rendered on the docs' Benchmarks page.

## Direct CLI Usage

```bash
# Run benchmarks
benchpkg --rev=dirty --script=benchmark/benchmarks.jl

# Compare specific revisions
benchpkg --rev=main,dirty --script=benchmark/benchmarks.jl

# View results
benchpkgtable ModifiedDistributions
```
