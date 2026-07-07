# PACKAGE-OWNED — the AD-fixture registry implementing the EpiAwarePackageTools
# `ADRegistry` contract: scenarios (each with a ForwardDiff reference), a backend
# list, and broken/skip bookkeeping. The shared harness (driven from
# `test/ad/setup.jl`) consumes these. The scenarios are the package's modifier
# log densities (`affine`, `weight`, `modify`, `thin`/`cumulative` and nested
# stacks of them); the reference gradient is ForwardDiff.
module ADFixtures

# `__precompile__(false)` skips the precompile cache so the Mooncake load chain
# does not break the build on CI. Negligible cost — this module is only loaded
# by the AD test suite.
__precompile__(false)

using ModifiedDistributions
using Distributions: Gamma, LogNormal, logpdf
# Loading ComposedDistributions activates the package's
# ModifiedDistributionsComposedDistributionsExt extension, whose collapse of a
# `Sequential` chain to its observed convolved total is exercised below.
using ComposedDistributions: sequential
# Loading ConvolvedDistributions activates
# ModifiedDistributionsConvolvedDistributionsExt, whose series handshake
# (a thinned convolved count series) is exercised below.
using ConvolvedDistributions: convolve_series
using ADTypes: AutoForwardDiff, AutoReverseDiff, AutoMooncake,
               AutoMooncakeForward, AutoEnzyme
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
`res1` carries a ForwardDiff reference when `with_reference = true`. Covers
the `affine` change-of-variables logpdf (gradient through the inner delay
params, the scale, and the shift), the `weight` count/aggregated-data
likelihood (scalar, `Product{Weighted}` vector, and observation-time weight
forms), the `modify` hazard logpdf on both links (log and identity; gradient
through the inner params and the effect), the `thin`/`cumulative` forward
transforms (transparent delegation to the inner logpdf), a nested
`weight`-over-`affine` stack (gradients through both wrappers at once), the
ComposedDistributions extension (`weight` of a `Sequential` chain,
collapsing to the observed convolved total via the numeric quadrature), and
the ConvolvedDistributions extension (a thinned convolved count series,
whose interval masses differentiate through the delay params).
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
        (θ,
            obs) -> sum(
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
        (θ,
            obs,
            cts) -> sum(
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

    # Modified proportional-hazards (log-link) logpdf:
    # `β + logpdf(base, x) + (exp(β) - 1) * logccdf(base, x)`, so the gradient
    # flows through the inner delay params (θ[1], θ[2]) AND the hazard effect
    # (θ[3]). The distribution is written as a literal so Enzyme differentiates
    # cleanly.
    obs_mod = [0.8, 1.6, 2.4, 4.0]
    _push!("Modified LogNormal log-link logpdf",
        (θ,
            obs) -> sum(
            x -> logpdf(modify(LogNormal(θ[1], θ[2]), θ[3]), x),
            obs),
        [1.0, 0.5, 0.4], (Constant(obs_mod),))

    # Modified additive-hazards (identity-link) logpdf:
    # `log(f(x) + β S(x)) - β (x - m)` via `_logaddexp` with the accrual from
    # the support minimum `m`, so the gradient flows through the inner delay
    # params (θ[1], θ[2]) AND the additive effect. The effect is `exp(θ[3])`
    # (a positive transform), so the constructor's non-negativity check
    # cannot trip during finite perturbations of θ.
    _push!("Modified LogNormal identity-link logpdf",
        (θ,
            obs) -> sum(
            x -> logpdf(
                modify(LogNormal(θ[1], θ[2]), exp(θ[3]); link = identity),
                x),
            obs),
        [1.0, 0.5, -0.9], (Constant(obs_mod),))

    # Transformed thin logpdf: the forward op is transparent to `logpdf`, so
    # the gradient flows through the inner delay params only. The thin factor
    # is data (a literal), not a differentiated parameter, since `thin`
    # validates p ∈ [0, 1].
    _push!("Transformed thin LogNormal logpdf",
        (θ,
            obs) -> sum(
            x -> logpdf(thin(LogNormal(θ[1], θ[2]), 0.3), x), obs),
        [1.0, 0.75], (Constant(obs),))

    # Transformed cumulative logpdf: the same transparent delegation with the
    # running-sum op carried for a downstream count series.
    _push!("Transformed cumulative LogNormal logpdf",
        (θ,
            obs) -> sum(
            x -> logpdf(cumulative(LogNormal(θ[1], θ[2])), x), obs),
        [1.0, 0.75], (Constant(obs),))

    # Weighted observation-time weight path: the constructor weight is
    # `missing`, so the joint observation `(value = x, weight = w)` supplies
    # the weight. The weights are inactive `Constant` data; the gradient
    # flows through the inner delay params only.
    _push!("Weighted LogNormal observation-time weight logpdf",
        (θ,
            obs,
            cts) -> sum(
            i -> logpdf(weight(LogNormal(θ[1], θ[2])),
                (value = obs[i], weight = cts[i])),
            eachindex(obs)),
        [1.0, 0.75], (Constant(obs), Constant(counts)))

    # Nested modifier stack: a likelihood weight over an affine transform, so
    # the gradient flows through both wrappers at once — the inner delay
    # params (θ[1], θ[2]) and the affine scale (θ[3]) and shift (θ[4]). The
    # weights stay inactive `Constant` data.
    wts_nest = [3.0, 1.0, 4.0, 2.0]
    _push!("Weighted Affine LogNormal nested logpdf",
        (θ,
            obs,
            cts) -> sum(
            i -> logpdf(
                weight(
                    affine(LogNormal(θ[1], θ[2]);
                        scale = θ[3], shift = θ[4]),
                    cts[i]),
                obs[i]),
            eachindex(obs)),
        [1.0, 0.5, 2.0, 1.0], (Constant(obs_aff), Constant(wts_nest)))

    # ComposedDistributions extension: `weight(seq, w)` collapses a
    # `Sequential` chain to its observed convolved total and weights that
    # total's logpdf. The differentiated params sit on the leading Gamma step
    # so the gradient flows through the AD-safe numeric convolution
    # quadrature; the trailing LogNormal is the integration component (its
    # window quantile stays off the AD path) and the weights are data. This
    # mirrors ConvolvedDistributions' own Gamma+LogNormal AD scenario.
    _push!("Weighted Sequential observed-total logpdf",
        (θ,
            obs,
            cts) -> sum(
            i -> logpdf(
                weight(
                    sequential(:a => Gamma(θ[1], θ[2]),
                        :b => LogNormal(0.5, 0.4)),
                    cts[i]),
                obs[i]),
            eachindex(obs)),
        [2.0, 1.0], (Constant(obs), Constant(counts)))

    # ConvolvedDistributions extension: the series handshake peels the thin
    # op off the wrapper, convolves the series with the inner Gamma delay's
    # discretised PMF (interval masses through the AD-safe CDF helpers, so
    # the gradient flows through the delay params), then thins the counts.
    # The thin factor is data (a literal), as in the thin logpdf scenario.
    series_conv = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]
    _push!("Thinned convolved series sum",
        (θ,
            series) -> sum(convolve_series(
            thin(Gamma(θ[1], θ[2]), 0.3), series)),
        [2.0, 1.0], (Constant(series_conv),))

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
        (name = "Mooncake forward", backend = AutoMooncakeForward()),
        # `set_runtime_activity` is the only user-facing Enzyme setting
        # needed; no `function_annotation = Duplicated`, because the
        # differentiated functions capture no data (see `scenarios`).
        (name = "Enzyme reverse",
            backend = AutoEnzyme(
                mode = Enzyme.set_runtime_activity(Enzyme.Reverse))),
        (name = "Enzyme forward",
            backend = AutoEnzyme(
                mode = Enzyme.set_runtime_activity(Enzyme.Forward)))
    ]
end

"Scenario names broken on every backend."
broken_scenario_names() = String[]

"Per-backend broken scenario names (`Dict{String, Set{String}}`)."
backend_broken_scenarios() = Dict{String, Set{String}}()

"Per-backend scenario names too unstable to run at all."
backend_skip_scenarios() = Dict{String, Set{String}}()

end # module ADFixtures
