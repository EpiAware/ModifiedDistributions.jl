# PACKAGE-OWNED — the AD-fixture registry implementing the EpiAwarePackageTools
# `ADRegistry` contract: scenarios (each with a ForwardDiff reference), a backend
# list, and broken/skip bookkeeping. The shared harness (driven from
# `test/ad/setup.jl`) consumes these. The scenarios are the package's modifier
# log densities (`affine`, `weight`); the reference gradient is ForwardDiff.
module ADFixtures

# `__precompile__(false)` skips the precompile cache so the Mooncake load chain
# does not break the build on CI. Negligible cost — this module is only loaded
# by the AD test suite.
__precompile__(false)

using ModifiedDistributions
using Distributions: LogNormal, logpdf
using ADTypes: AutoForwardDiff, AutoReverseDiff, AutoMooncake, AutoEnzyme
using DifferentiationInterface: DifferentiationInterface, Constant
import DifferentiationInterfaceTest as DIT
import ForwardDiff, ReverseDiff, Mooncake, Enzyme

export scenarios, backends, broken_scenario_names,
       backend_broken_scenarios, backend_skip_scenarios

# ForwardDiff reference gradient for a scenario function. Data travels as a
# `Constant` context rather than a closure capture, so the differentiated
# function holds no active fields (faster, more portable across backends).
function _reference(f, θ, contexts)
    return DifferentiationInterface.gradient(
        f, AutoForwardDiff(), θ, contexts...)
end

"""
    scenarios(; with_reference = false, category = :marginal)

The AD gradient scenarios. Each is a `DIT.Scenario{:gradient, :out}` whose
`res1` carries a ForwardDiff reference when `with_reference = true`. Covers the
`affine` change-of-variables logpdf (gradient through the inner delay params,
the scale, and the shift) and the `weight` count/aggregated-data likelihood
(scalar and `Product{Weighted}` vector forms).
"""
function scenarios(; with_reference::Bool = false, category::Symbol = :marginal)
    out = DIT.Scenario{:gradient, :out}[]

    function _push!(name, f, θ₀, contexts)
        res1 = with_reference ? _reference(f, θ₀, contexts) : nothing
        # Prepare at the real parameter point with the real data contexts; DIT's
        # `zero(x)` default would build e.g. `LogNormal(0, 0)` and trip a domain
        # assertion.
        prep_args = (; x = θ₀, contexts = contexts)
        push!(out,
            res1 === nothing ?
            DIT.Scenario{:gradient, :out}(
                f, θ₀, contexts...; prep_args = prep_args, name = name) :
            DIT.Scenario{:gradient, :out}(
                f, θ₀, contexts...;
                res1 = res1, prep_args = prep_args, name = name))
    end

    # Affine transform. The change-of-variables logpdf is
    # `logpdf(inner, (y - shift) / scale) - log(scale)`, so the gradient flows
    # through the inner delay params (θ[1], θ[2]) AND the affine scale (θ[3]) and
    # shift (θ[4]). Distributions are written as literals rather than captured
    # `Type`s so Enzyme forward differentiates cleanly.
    obs_aff = [2.0, 3.5, 5.0, 7.0]
    _push!("Affine LogNormal scale+shift logpdf",
        (θ, obs) -> sum(
            x -> logpdf(
                affine(LogNormal(θ[1], θ[2]); scale = θ[3], shift = θ[4]), x),
            obs),
        [1.0, 0.5, 2.0, 1.0], (Constant(obs_aff),))

    # Weighted scalar logpdf: a count/aggregated-data likelihood term
    # `n * logpdf(dist, x)`. The count is an inactive `Constant` context; the
    # gradient flows through the delay parameters only.
    obs = [0.5, 1.2, 2.5, 3.8, 5.1]
    counts = [3.0, 1.0, 4.0, 2.0, 5.0]
    _push!("Weighted LogNormal scalar logpdf",
        (θ, obs, cts) -> sum(
            i -> logpdf(weight(LogNormal(θ[1], θ[2]), cts[i]), obs[i]),
            eachindex(obs)),
        [1.0, 0.75], (Constant(obs), Constant(counts)))

    # Product{Weighted} vector logpdf via `weight(dist, counts::Vector)`, which
    # builds a `Product` of `Weighted` and routes the vector observation through
    # `_logpdf_product`. Counts are the (inactive) constructor weights; the
    # gradient is w.r.t. the shared delay params.
    _push!("Product{Weighted} LogNormal vector logpdf",
        (θ, obs, cts) -> logpdf(weight(LogNormal(θ[1], θ[2]), cts), obs),
        [1.0, 0.75], (Constant(obs), Constant(counts)))

    return out
end

"""
    backends()

The AD backends to test, as `(; name, backend)` named tuples. The names match
the `test/ad/scenarios.jl` test items.
"""
function backends()
    return [
        (name = "ForwardDiff", backend = AutoForwardDiff()),
        (name = "ReverseDiff (tape)",
            backend = AutoReverseDiff(compile = false)),
        (name = "Mooncake reverse",
            backend = AutoMooncake(config = nothing)),
        (name = "Enzyme reverse",
            backend = AutoEnzyme(
                mode = Enzyme.set_runtime_activity(Enzyme.Reverse)))
    ]
end

"Scenario names broken on every backend."
broken_scenario_names() = String[]

"Per-backend broken scenario names (`Dict{String, Set{String}}`)."
backend_broken_scenarios() = Dict{String, Set{String}}()

"Per-backend scenario names too unstable to run at all."
backend_skip_scenarios() = Dict{String, Set{String}}()

end # module ADFixtures
