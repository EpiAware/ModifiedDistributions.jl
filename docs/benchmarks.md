<!-- PACKAGE-OWNED — your benchmark narrative. scaffold writes this once and
never overwrites it. The managed build splices this file verbatim into the
generated `docs/src/benchmarks.md`, between the page heading and the rendered
`## Performance history` section. ALL benchmark narrative lives here (the
managed skeleton carries none): describe what the suite covers, how to run it,
and how to read the history below. Add your own `## ...` subsections freely. -->

`ModifiedDistributions` benchmarks each modifier's hot paths so wrapper overhead is visible and regressions are caught on every pull request.

The suite (`benchmark/benchmarks.jl`) evaluates construction, `logpdf`, `pdf`, `cdf`/`ccdf`, `quantile` and `rand` for every modifier around the same base LogNormal, with the bare base as the shared baseline floor:

- `Baseline`: the bare base LogNormal.
- `Affine`: the change-of-variables paths through `Y = scale * X + shift`.
- `Weighted`: the `logpdf` weight paths, scalar and the vectorised `Product{Weighted}` form.
- `Transformed`: `thin` and `cumulative`, whose forward ops are transparent to every distribution method, so these rows should sit on the baseline.
- `Modified`: the hazard modification on both analytic links; the identity-link `quantile` and `rand` exercise the monotone-bisection cdf inversion, the one non-closed-form path.

Run the suite locally with `task benchmark`, or compare against `main` with `task benchmark-compare` (see `benchmark/README.md`).
On pull requests the [benchmark workflow](https://github.com/EpiAware/ModifiedDistributions.jl/blob/main/.github/workflows/benchmark.yaml) benchmarks head and base in separate jobs and posts a single comparison comment; pushes to `main` and tags append to the performance history shown below.
