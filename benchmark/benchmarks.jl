# PACKAGE-OWNED — scaffold writes this once and never overwrites it.
#
# Benchmark suite definition. Build a BenchmarkTools `BenchmarkGroup` named
# `SUITE`; the managed `run.jl` / `compare.jl` consume it.
#
# The suite benchmarks each modifier's hot paths (construction, `logpdf`,
# `pdf`, `cdf`/`ccdf`, `quantile`, `rand`) against a bare base LogNormal, so
# the wrapper overhead of every modifier can be read against the same floor.
# Groups follow the CensoredDistributions.jl convention:
# `SUITE[<Type>][<variant>][<operation>]`.

using BenchmarkTools
using ModifiedDistributions
using Distributions

const SUITE = BenchmarkGroup()

# Shared evaluation data: the base every modifier wraps, evaluation points
# spanning its bulk, and quantile probabilities.
const BASE = LogNormal(1.5, 0.5)
const TEST_XS = collect(range(0.1, 10.0, length = 100))
const TEST_PS = collect(range(0.05, 0.95, length = 20))

# Include benchmark definitions.
include("src/baseline.jl")
include("src/affine.jl")
include("src/weighted.jl")
include("src/transformed.jl")
include("src/modified.jl")
include("src/ad_gradients.jl")
