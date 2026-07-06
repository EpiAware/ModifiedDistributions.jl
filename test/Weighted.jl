@testitem "Weighted constructor" begin
    using Distributions

    # Test valid construction
    d = Normal(0, 1)
    wd = weight(d, 10.0)
    @test typeof(wd) <: ModifiedDistributions.Weighted
    @test wd.dist === d
    @test wd.weight == 10.0

    # Test with different distribution types
    wd_exp = weight(Exponential(2.0), 5.5)
    @test wd_exp.dist isa Exponential
    @test wd_exp.weight == 5.5

    # Test error on negative weight
    @test_throws ArgumentError weight(d, -1.0)

    # Test zero weight is allowed
    wd_zero = weight(d, 0.0)
    @test wd_zero.weight == 0.0

    # nothing threads through unchanged
    @test weight(d, nothing) === d
end

@testitem "Weighted distribution interface" begin
    using Distributions

    d = LogNormal(1.5, 0.5)
    w = 2.5
    wd = weight(d, w)

    # Test basic properties
    @test minimum(wd) == minimum(d)
    @test maximum(wd) == maximum(d)
    @test insupport(wd, 1.0) == insupport(d, 1.0)
    @test insupport(wd, -1.0) == insupport(d, -1.0)

    # Test params
    p = params(wd)
    @test p == (params(d)..., w)

    # Test eltype
    @test eltype(wd) == Float64
end

@testitem "Weighted summary statistics delegate to underlying" begin
    using Distributions, Statistics

    d = Gamma(2.0, 1.5)
    wd = weight(d, 7.0)

    # The weight only affects logpdf; summary statistics describe the
    # underlying distribution.
    @test mean(wd) == mean(d)
    @test var(wd) == var(d)
    @test std(wd) == std(d)
    @test median(wd) == median(d)
    @test mode(wd) == mode(d)
    @test skewness(wd) == skewness(d)
    @test kurtosis(wd) == kurtosis(d)
    @test entropy(wd) == entropy(d)

    # Also with a missing constructor weight.
    wd_missing = weight(d)
    @test mean(wd_missing) == mean(d)
    @test var(wd_missing) == var(d)
end

@testitem "Weighted probability functions" begin
    using Distributions

    d = Normal(2.0, 1.0)
    w = 3.0
    wd = weight(d, w)
    x = 2.5

    # Test pdf - should be unweighted
    @test pdf(wd, x) == pdf(d, x)

    # Test logpdf - should be weighted
    @test logpdf(wd, x) == w * logpdf(d, x)

    # Test CDF methods - should be unweighted
    @test cdf(wd, x) == cdf(d, x)
    @test logcdf(wd, x) == logcdf(d, x)
    @test ccdf(wd, x) == ccdf(d, x)
    @test logccdf(wd, x) == logccdf(d, x)

    # Test quantile - should be unweighted
    @test quantile(wd, 0.5) == quantile(d, 0.5)
end

@testitem "Weighted with zero weight" begin
    using Distributions

    d = Normal(0, 1)
    wd = weight(d, 0.0)

    # Test that logpdf returns -Inf for zero weight
    @test logpdf(wd, 0.0) == -Inf
    @test logpdf(wd, 1.0) == -Inf

    # Other methods should work normally
    @test pdf(wd, 0.0) == pdf(d, 0.0)
    @test cdf(wd, 0.0) == cdf(d, 0.0)
end

@testitem "Weighted sampling" begin
    using Distributions
    using Random
    using Statistics

    d = Normal(5.0, 2.0)
    w = 10.0
    wd = weight(d, w)

    # Sampling should be unaffected by weight
    samples_d = rand(MersenneTwister(123), d, 10000)
    samples_wd = rand(MersenneTwister(123), wd, 10000)

    # Check that samples follow the underlying distribution
    @test mean(samples_wd) ≈ mean(d) atol=0.1
    @test std(samples_wd) ≈ std(d) atol=0.1
    @test mean(samples_d) ≈ mean(samples_wd) atol=0.1
    @test std(samples_d) ≈ std(samples_wd) atol=0.1

    # sampler delegates to the base sampler; the weight never touches
    # sampling, and re-wrapping crashed for sampler-object bases.
    s = sampler(wd)
    @test s === sampler(d)
end

@testitem "Weighted with different numeric types" begin
    using Distributions

    d = Normal(0, 1)

    # Test with different weight types
    wd_int = weight(d, 5)
    @test wd_int.weight isa Int
    @test logpdf(wd_int, 0.0) == 5 * logpdf(d, 0.0)

    wd_float32 = weight(d, Float32(2.5))
    @test wd_float32.weight isa Float32
    @test logpdf(wd_float32, 0.0) ≈ 2.5 * logpdf(d, 0.0)
end

@testitem "Weighted product distribution constructor" begin
    using Distributions

    d = Normal(1, 2)
    weights = [1.0, 2.0, 3.0]

    wd_array = weight(d, weights)

    # Should create a Product distribution
    @test wd_array isa Product
    @test length(wd_array) == 3

    # Each component should be a Weighted distribution
    for (i, w) in enumerate(weights)
        component = wd_array.v[i]
        @test component isa ModifiedDistributions.Weighted
        @test component.weight == w
        @test component.dist === d
    end

    # Test logpdf on array
    x = [0.5, 1.0, 1.5]
    expected_logpdf = sum(weights .* logpdf.(d, x))
    @test logpdf(wd_array, x) ≈ expected_logpdf
end

@testitem "Vectorised weighted logpdf equals per-obs weighted sum" begin
    using Distributions

    # Product{Weighted} vector logpdf equals the per-observation weighted-sum
    # loop for a shared distribution.
    d = Normal(2.0, 1.0)
    x = [2.0, 3.0, 2.0, 5.0, 3.0, 2.0]
    weights = [3.0, 2.0, 5.0, 1.0, 4.0, 2.0]
    wd = weight(d, weights)

    loop = sum(w * logpdf(d, xi) for (w, xi) in zip(weights, x))
    @test logpdf(wd, x) == loop
    @test all(c -> c.dist === d, wd.v)

    # Joint observation form (constructor weight * observation weight) matches.
    obs_w = [1.0, 2.0, 1.0, 3.0, 1.0, 2.0]
    loop_joint = sum((cw * ow) * logpdf(d, xi)
    for (cw, ow, xi) in zip(weights, obs_w, x))
    @test logpdf(wd, (values = x, weights = obs_w)) == loop_joint
end

@testitem "Vectorised weighted logpdf: mixed distributions fall back" begin
    using Distributions

    dists = [LogNormal(1.5, 0.5), LogNormal(1.0, 0.7), Gamma(2.0, 1.5)]
    weights = [2.0, 3.0, 1.0]
    x = [2.0, 3.0, 4.0]
    wd = weight(dists, weights)

    expected = sum(w * logpdf(di, xi)
    for (w, di, xi) in zip(weights, dists, x))
    @test logpdf(wd, x) == expected
end

@testitem "Vectorised weighted logpdf: zero weight gives -Inf" begin
    using Distributions

    d = LogNormal(1.5, 0.5)
    x = [2.0, 3.0, 2.0]
    wd = weight(d, [3.0, 0.0, 5.0])  # a zero weight short-circuits to -Inf
    @test logpdf(wd, x) == -Inf
end

@testitem "Weighted with truncated distributions" begin
    using Distributions

    d = truncated(Normal(0, 1), -2, 2)
    w = 5.0
    wd = weight(d, w)

    # Test that it works with truncated distributions
    @test minimum(wd) == -2
    @test maximum(wd) == 2
    @test insupport(wd, 0.0) == true
    @test insupport(wd, 3.0) == false

    # Test logpdf is weighted correctly
    x = 0.5
    @test logpdf(wd, x) == w * logpdf(d, x)
end

@testitem "Weighted with missing constructor weights" begin
    using Distributions

    # Test construction with missing weight
    d = Normal(0, 1)
    wd = ModifiedDistributions.Weighted(d, missing)
    @test ismissing(wd.weight)
    @test wd.dist === d

    # Test logpdf with missing constructor weight should return -Inf
    @test logpdf(wd, 0.0) == -Inf
    @test logpdf(wd, 1.0) == -Inf

    # Test joint observation with missing constructor weight uses obs weight
    @test logpdf(wd, (value = 0.0, weight = 2.0)) == 2.0 * logpdf(d, 0.0)
end

@testitem "Joint observation support" begin
    using Distributions

    d = Normal(2.0, 1.0)
    w = 3.0
    wd = weight(d, w)

    # Test scalar observation (existing functionality)
    x = 2.5
    @test logpdf(wd, x) == w * logpdf(d, x)

    # Test joint observation (value, weight)
    joint_obs = (value = x, weight = 2.0)
    expected_logpdf = (w * 2.0) * logpdf(d, x)  # weight stacking
    @test logpdf(wd, joint_obs) == expected_logpdf
end

@testitem "Weight combination rules" begin
    using Distributions
    using ModifiedDistributions: combine_weights

    # Test dispatch-based combination rules
    @test ismissing(combine_weights(missing, missing))
    @test combine_weights(3.0, missing) == 3.0
    @test combine_weights(missing, 2.0) == 2.0
    @test combine_weights(3.0, 2.0) == 6.0

    # Test zero weight handling
    @test combine_weights(0.0, 5.0) == 0.0
    @test combine_weights(5.0, 0.0) == 0.0
    @test combine_weights(0, 5.0) == 0

    # Test vector combinations
    constructor_weights = [2.0, 3.0, 1.0]
    obs_weights = [1.0, 2.0, 4.0]

    # Vector, Vector → element-wise combination
    result_vec = combine_weights(constructor_weights, obs_weights)
    @test result_vec == [2.0, 6.0, 4.0]

    # Vector, missing → keep constructor weights
    result_missing = combine_weights(constructor_weights, missing)
    @test result_missing == constructor_weights

    # Vector, scalar → broadcast scalar to all elements
    result_scalar = combine_weights(constructor_weights, 2.0)
    @test result_scalar == [4.0, 6.0, 2.0]

    # Test with zero scalar weight
    result_zero = combine_weights(constructor_weights, 0.0)
    @test result_zero == [0.0, 0.0, 0.0]

    # Test with mixed missing constructor weights and scalar observation weight
    mixed_weights = [2.0, missing, 3.0]
    result_mixed = combine_weights(mixed_weights, 5.0)
    @test result_mixed == [10.0, 5.0, 15.0]
end

@testitem "weight() constructor with missing weights" begin
    using Distributions

    dists = [Normal(0, 1), Normal(1, 1), Normal(2, 1)]
    weighted_dists = weight(dists)

    # Should create Product distribution
    @test weighted_dists isa Product
    @test length(weighted_dists) == 3

    # Each component should have missing weight
    for component in weighted_dists.v
        @test component isa ModifiedDistributions.Weighted
        @test ismissing(component.weight)
    end
end

@testitem "Product{<:Any, <:Weighted} logpdf with joint observations" begin
    using Distributions

    # Create weighted distributions
    dists = [Normal(0, 1), Normal(1, 1), Normal(2, 1)]
    constructor_weights = [2.0, 3.0, 1.0]
    weighted_dists = weight(dists, constructor_weights)

    # Test values and observation weights
    values = [0.5, 1.5, 2.5]
    obs_weights = [1.0, 2.0, 3.0]
    joint_obs = (values = values, weights = obs_weights)

    # Expected: sum of (constructor_weight * obs_weight * logpdf(dist, value))
    expected = sum([constructor_weights[i] * obs_weights[i] *
                    logpdf(dists[i], values[i]) for i in 1:3])

    @test logpdf(weighted_dists, joint_obs) ≈ expected
end

@testitem "Product{<:Any, <:Weighted} with missing constructor weights" begin
    using Distributions

    # Create weighted distributions with missing constructor weights
    dists = [Normal(0, 1), Normal(1, 1), Normal(2, 1)]
    weighted_dists = weight(dists)  # No constructor weights

    # Test values and observation weights
    values = [0.5, 1.5, 2.5]
    obs_weights = [2.0, 3.0, 1.0]
    joint_obs = (values = values, weights = obs_weights)

    # Expected: sum of (obs_weight * logpdf) since constructor weights missing
    expected = sum([obs_weights[i] * logpdf(dists[i], values[i]) for i in 1:3])

    @test logpdf(weighted_dists, joint_obs) ≈ expected
end

@testitem "Mixed missing weights in Product distribution" begin
    using Distributions

    # Create mixed scenario: some with weights, some without
    d1 = Normal(0, 1)
    d2 = Normal(1, 1)
    d3 = Normal(2, 1)

    wd1 = ModifiedDistributions.Weighted(d1, 2.0)
    wd2 = ModifiedDistributions.Weighted(d2, missing)
    wd3 = ModifiedDistributions.Weighted(d3, 3.0)

    mixed_dist = product_distribution([wd1, wd2, wd3])

    values = [0.5, 1.5, 2.5]
    obs_weights = [1.0, 2.0, 1.0]
    joint_obs = (values = values, weights = obs_weights)

    # Expected weights: [2.0*1.0, missing*2.0, 3.0*1.0] = [2.0, 2.0, 3.0]
    expected = 2.0 * logpdf(d1, 0.5) + 2.0 * logpdf(d2, 1.5) +
               3.0 * logpdf(d3, 2.5)

    @test logpdf(mixed_dist, joint_obs) ≈ expected
end

@testitem "Weight stacking with zero weights" begin
    using Distributions

    d = Normal(0, 1)

    # Zero constructor weight: 0 * 5 = 0, zero weight gives -Inf
    wd_zero = weight(d, 0.0)
    @test logpdf(wd_zero, (value = 1.0, weight = 5.0)) == -Inf

    # Zero observation weight: 3 * 0 = 0, zero weight gives -Inf
    wd_nonzero = weight(d, 3.0)
    @test logpdf(wd_nonzero, (value = 1.0, weight = 0.0)) == -Inf
end

@testitem "Type stability" begin
    using Distributions

    d = Normal(0.0, 1.0)
    wd_real = weight(d, 2.0)
    wd_missing = ModifiedDistributions.Weighted(d, missing)

    # Type annotations should be correct
    @test wd_real isa ModifiedDistributions.Weighted{<:Normal, Float64}
    @test wd_missing isa ModifiedDistributions.Weighted{<:Normal, Missing}

    # logpdf should return Float64
    @test logpdf(wd_real, 0.0) isa Float64
    @test logpdf(wd_missing, 0.0) isa Float64  # -Inf is Float64
end

@testitem "Product distribution with zero weights in vector" begin
    using Distributions

    # Edge case where final_weights contains zeros after combination
    dists = [Normal(0, 1), Normal(1, 1), Normal(2, 1)]
    constructor_weights = [2.0, 3.0, 1.0]
    weighted_dists = weight(dists, constructor_weights)

    # Observation weight of 0 makes final weight zero
    values = [0.5, 1.5, 2.5]
    obs_weights = [1.0, 0.0, 1.0]  # Middle weight is zero
    joint_obs = (values = values, weights = obs_weights)
    @test logpdf(weighted_dists, joint_obs) == -Inf

    # Constructor weight of 0 makes final weight zero
    wd1 = weight(Normal(0, 1), 2.0)
    wd2 = weight(Normal(1, 1), 0.0)
    mixed_zero = product_distribution([wd1, wd2])
    @test logpdf(mixed_zero, [0.5, 1.5]) == -Inf
end

@testitem "loglikelihood with vectorised NamedTuple observations" begin
    using Distributions

    d = Normal(0, 1)
    wd = weight(d, 2.0)

    values = [1.0, 0.5, -0.5]
    weights = [3, 2, 4]
    obs = (values = values, weights = weights)

    expected = sum([logpdf(wd, (value = v, weight = w))
                    for (v, w) in zip(values, weights)])
    result = loglikelihood(wd, obs)

    @test result ≈ expected
    @test result == sum([2.0 * w * logpdf(d, v)
                         for (v, w) in zip(values, weights)])

    # Missing constructor weight
    wd_missing = ModifiedDistributions.Weighted(d, missing)
    expected_missing = sum([logpdf(wd_missing, (value = v, weight = w))
                            for (v, w) in zip(values, weights)])
    result_missing = loglikelihood(wd_missing, obs)

    @test result_missing ≈ expected_missing
    @test result_missing == sum([w * logpdf(d, v)
                                 for (v, w) in zip(values, weights)])
end

@testitem "weight(dist) constructor with missing weight" begin
    using Distributions

    d = Normal(2.0, 1.0)
    wd = weight(d)

    @test wd isa ModifiedDistributions.Weighted
    @test wd.dist === d
    @test ismissing(wd.weight)

    wd_exp = weight(Exponential(3.0))
    @test wd_exp.dist isa Exponential
    @test ismissing(wd_exp.weight)

    # logpdf with missing constructor weight returns -Inf
    @test logpdf(wd, 1.0) == -Inf

    # Joint observation uses observation weight directly
    @test logpdf(wd, (value = 1.0, weight = 5.0)) == 5.0 * logpdf(d, 1.0)

    # Zero observation weight
    @test logpdf(wd, (value = 1.0, weight = 0.0)) == -Inf
end

@testitem "loglikelihood for single Weighted scalar joint observations" begin
    using Distributions

    d = Normal(1.0, 0.5)
    wd = weight(d, 3.0)

    joint_obs = (value = 2.0, weight = 4.0)
    expected = logpdf(wd, joint_obs)
    result = loglikelihood(wd, joint_obs)

    @test result == expected
    @test result == 3.0 * 4.0 * logpdf(d, 2.0)

    wd_missing = weight(d)
    expected_missing = logpdf(wd_missing, joint_obs)
    result_missing = loglikelihood(wd_missing, joint_obs)

    @test result_missing == expected_missing
    @test result_missing == 4.0 * logpdf(d, 2.0)
end

@testitem "loglikelihood for Product distribution with joint observations" begin
    using Distributions

    dists = [Normal(0, 1), Normal(1, 1), Normal(2, 1)]
    constructor_weights = [2.0, 3.0, 1.5]
    weighted_dists = weight(dists, constructor_weights)

    values = [0.5, 1.2, 2.8]
    obs_weights = [1.0, 2.0, 0.5]
    joint_obs = (values = values, weights = obs_weights)

    expected = logpdf(weighted_dists, joint_obs)
    result = loglikelihood(weighted_dists, joint_obs)
    @test result == expected

    expected_manual = sum([constructor_weights[i] * obs_weights[i] *
                           logpdf(dists[i], values[i]) for i in 1:3])
    @test result ≈ expected_manual
end

@testitem "weight() method coverage" begin
    using Distributions

    d = LogNormal(1.0, 0.5)

    wd_with_weight = weight(d, 2.5)
    @test wd_with_weight.weight == 2.5

    wd_missing = weight(d)
    @test ismissing(wd_missing.weight)

    dists = [d, Normal(0, 1)]
    weights_vec = [1.0, 2.0]

    wd_vec_weighted = weight(dists, weights_vec)
    @test wd_vec_weighted isa Product
    @test length(wd_vec_weighted) == 2
    @test wd_vec_weighted.v[1].weight == 1.0
    @test wd_vec_weighted.v[2].weight == 2.0

    wd_vec_missing = weight(dists)
    @test wd_vec_missing isa Product
    @test length(wd_vec_missing) == 2
    @test ismissing(wd_vec_missing.v[1].weight)
    @test ismissing(wd_vec_missing.v[2].weight)

    # Vector of single distribution
    weights_single = [3.0, 4.0, 5.0]
    wd_single_vec = weight(d, weights_single)
    @test wd_single_vec isa Product
    @test length(wd_single_vec) == 3
    @test all([wd_single_vec.v[i].weight == weights_single[i] for i in 1:3])

    # Mismatched lengths error
    @test_throws ArgumentError weight(dists, [1.0, 2.0, 3.0])
end

@testitem "Weighted batched vector observations" begin
    using Distributions

    base = Normal(2.0, 1.0)
    xs = [1.9, 2.1, 2.3]

    # Per-point results equal the scalar map, with a stable eltype. A vector
    # observation on a single Weighted is per-point (vector result), unlike
    # the Product{Weighted} joint-scalar convention below.
    wd = weight(base, 2.5)
    batched = logpdf(wd, xs)
    @test batched ≈ map(x -> logpdf(wd, x), xs)
    @test batched isa Vector{Float64}
    @test batched ≈ 2.5 .* logpdf.(base, xs)

    # Missing and zero weights give -Inf elementwise, mirroring the scalar
    # sentinel semantics.
    wm = weight(base)
    @test logpdf(wm, xs) == fill(-Inf, 3)
    @test logpdf(wm, xs) isa Vector{Float64}
    w0 = weight(base, 0.0)
    @test logpdf(w0, xs) == fill(-Inf, 3)
    @test logpdf(w0, xs) isa Vector{Float64}

    # The Product{Weighted} convention is untouched: a vector observation
    # there is one joint observation with a scalar result.
    wp = weight(base, [2.0, 3.0, 4.0])
    @test logpdf(wp, xs) isa Float64
    @test logpdf(wp, xs) ≈ sum([2.0, 3.0, 4.0] .* logpdf.(base, xs))
end

@testitem "Weighted delegates a whole batch to the base distribution" begin
    using Distributions

    # A spy base distribution counting scalar vs batched logpdf calls. When
    # the base declares a specialised batched logpdf, a vector observation
    # must reach it as one batched call, never as a per-point fan-out.
    struct SpyDist <: ContinuousUnivariateDistribution
        dist::Normal{Float64}
        nscalar::Base.RefValue{Int}
        nvector::Base.RefValue{Int}
    end
    SpyDist() = SpyDist(Normal(2.0, 1.0), Ref(0), Ref(0))
    function Distributions.logpdf(d::SpyDist, x::Real)
        d.nscalar[] += 1
        return logpdf(d.dist, x)
    end
    function Distributions.logpdf(d::SpyDist, x::AbstractVector{<:Real})
        d.nvector[] += 1
        return map(Base.Fix1(logpdf, d.dist), x)
    end
    function ModifiedDistributions._has_batched_method(
            ::typeof(Distributions.logpdf), ::SpyDist)
        return true
    end

    spy = SpyDist()
    wd = weight(spy, 2.0)
    logpdf(wd, [1.9, 2.1, 2.3])
    @test spy.nscalar[] == 0
    @test spy.nvector[] == 1
end

@testitem "batch sampling uses the base sampler" begin
    using Distributions, Random

    # Gamma and Poisson have dedicated sampler objects; re-wrapping them
    # in Weighted crashed batch rand (pre-release review finding).
    rng = MersenneTwister(7)
    draws_gamma = rand(rng, weight(Gamma(2.0, 3.0), 3.0), 4)
    draws_pois = rand(rng, weight(Poisson(4.0), 2.0), 4)
    (gamma = draws_gamma, poisson = draws_pois)
    @test length(draws_gamma) == 4
    @test all(>(0), draws_gamma)
    @test length(draws_pois) == 4
    @test all(>=(0), draws_pois)
end
