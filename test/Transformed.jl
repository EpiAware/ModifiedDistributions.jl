@testitem "thin / cumulative construction and validation" begin
    using ModifiedDistributions, Distributions

    d = thin(LogNormal(1.5, 0.5), 0.3)
    @test d isa ModifiedDistributions.Transformed
    @test d.op isa ModifiedDistributions.ThinOp
    @test d.op.factor == 0.3
    @test get_dist(d) === LogNormal(1.5, 0.5)

    # thin probability must be in [0, 1].
    @test_throws ArgumentError thin(Normal(0.0, 1.0), -0.1)
    @test_throws ArgumentError thin(Normal(0.0, 1.0), 1.5)
    @test thin(Normal(0.0, 1.0), 0.0).op.factor == 0.0
    @test thin(Normal(0.0, 1.0), 1.0).op.factor == 1.0

    # nothing threads through unchanged.
    base = Gamma(2.0, 1.0)
    @test thin(base, nothing) === base

    c = cumulative(Gamma(2.0, 1.0))
    @test c isa ModifiedDistributions.Transformed
    @test c.op isa ModifiedDistributions.CumulativeOp
    @test get_dist(c) === Gamma(2.0, 1.0)

    # thin and cumulative are specialisations of the generic series_transform.
    g = series_transform(Gamma(2.0, 1.0), s -> 2.0 .* s)
    @test g isa ModifiedDistributions.Transformed
    @test logpdf(g, 2.0) == logpdf(Gamma(2.0, 1.0), 2.0)
end

@testitem "forward transforms are transparent to logpdf/cdf" begin
    using ModifiedDistributions, Distributions

    inner = LogNormal(1.5, 0.5)
    for d in (thin(inner, 0.3), cumulative(inner))
        for x in [0.5, 1.0, 2.0, 4.0]
            @test logpdf(d, x) == logpdf(inner, x)
            @test pdf(d, x) == pdf(inner, x)
            @test cdf(d, x) == cdf(inner, x)
            @test logcdf(d, x) == logcdf(inner, x)
            @test quantile(d, 0.4) == quantile(inner, 0.4)
        end
        @test minimum(d) == minimum(inner)
        @test maximum(d) == maximum(inner)
        @test mean(d) == mean(inner)
        @test var(d) == var(inner)
        @test std(d) == std(inner)
        @test median(d) == median(inner)
        @test mode(d) == mode(inner)
        @test skewness(d) == skewness(inner)
        @test kurtosis(d) == kurtosis(inner)
        @test entropy(d) == entropy(inner)
    end
end

@testitem "forward transforms delegate sampling" begin
    using ModifiedDistributions, Distributions, Random

    inner = LogNormal(1.5, 0.5)
    d = thin(inner, 0.3)

    # sampler delegates to the inner distribution's sampler, so draws match
    # the inner distribution's draws for the same seed.
    @test rand(MersenneTwister(7), sampler(d), 5) ==
          rand(MersenneTwister(7), sampler(inner), 5)
    @test rand(MersenneTwister(7), d, 5) == rand(MersenneTwister(7), inner, 5)

    # eltype follows the inner distribution, so batch sampling allocates a
    # concretely typed array (regression: Vector{Any} broke rand(rng, d, n)).
    @test eltype(typeof(d)) == eltype(typeof(inner))
    @test rand(MersenneTwister(7), d, 5) isa Vector{Float64}
end

@testitem "forward transforms surface op params and get_dist" begin
    using ModifiedDistributions, Distributions

    inner = Gamma(2.0, 1.0)
    d = thin(inner, 0.3)
    # thin factor surfaces in params after the inner params.
    @test params(d) == (params(inner)..., 0.3)
    @test get_dist(d) === inner
    @test get_dist_recursive(d) === inner

    # cumulative op is pure, so params is just the inner params.
    c = cumulative(inner)
    @test params(c) == params(inner)
end

@testitem "forward ops apply to a series via _apply_forward_ops" begin
    using ModifiedDistributions, Distributions

    series = [1.0, 2.0, 3.0, 4.0]

    # thin scales.
    _, ops = ModifiedDistributions._peel_forward(thin(Gamma(2.0, 1.0), 0.5))
    @test ModifiedDistributions._apply_forward_ops(series, ops) ≈ 0.5 .* series

    # cumulative accumulates.
    _, opsc = ModifiedDistributions._peel_forward(cumulative(Gamma(2.0, 1.0)))
    @test ModifiedDistributions._apply_forward_ops(series, opsc) == cumsum(series)

    # a non-transform distribution has no ops.
    inner, noop = ModifiedDistributions._peel_forward(Gamma(2.0, 1.0))
    @test inner === Gamma(2.0, 1.0)
    @test noop == ()

    # nested transforms peel to the inner distribution, ops in order.
    base = Gamma(2.0, 1.0)
    nested = cumulative(thin(base, 0.5))
    peeled, nested_ops = ModifiedDistributions._peel_forward(nested)
    @test peeled === base
    @test ModifiedDistributions._apply_forward_ops(series, nested_ops) ==
          cumsum(0.5 .* series)
end

@testitem "Transformed batched vector observations" begin
    using Distributions

    inner = Gamma(2.0, 1.0)
    xs = [0.5, 1.0, 2.5]

    # Per-point results equal the scalar map, with a stable eltype. A vector
    # observation on a modifier is per-point (vector result), unlike the
    # Product{Weighted} joint-scalar convention.
    for d in (thin(inner, 0.3), cumulative(inner),
        series_transform(inner, s -> 2.0 .* s))
        for f in (logpdf, pdf, cdf, logcdf, ccdf, logccdf)
            batched = f(d, xs)
            @test batched ≈ map(x -> f(d, x), xs)
            @test batched isa Vector{Float64}
        end
    end
end

@testitem "Transformed delegates a whole batch to the inner distribution" begin
    using Distributions

    # A spy inner distribution counting scalar vs batched calls. Forward
    # transforms are transparent, so when the inner declares specialised
    # batched methods a vector observation must delegate to it as one
    # batched call per function.
    struct SpyDist <: ContinuousUnivariateDistribution
        dist::Gamma{Float64}
        nscalar::Base.RefValue{Int}
        nvector::Base.RefValue{Int}
    end
    SpyDist() = SpyDist(Gamma(2.0, 1.0), Ref(0), Ref(0))
    for f in (:pdf, :logpdf, :cdf, :logcdf, :ccdf, :logccdf)
        @eval function Distributions.$f(d::SpyDist, x::Real)
            d.nscalar[] += 1
            return Distributions.$f(d.dist, x)
        end
        @eval function Distributions.$f(
                d::SpyDist, x::AbstractVector{<:Real})
            d.nvector[] += 1
            return map(Base.Fix1(Distributions.$f, d.dist), x)
        end
    end
    function ModifiedDistributions._has_batched_method(
            ::typeof(Distributions.logpdf), ::SpyDist)
        return true
    end
    for f in (:pdf, :cdf, :logcdf, :ccdf, :logccdf)
        @eval function ModifiedDistributions._has_batched_method(
                ::typeof(Distributions.$f), ::SpyDist)
            return true
        end
    end

    spy = SpyDist()
    d = thin(spy, 0.3)
    xs = [0.5, 1.0, 2.5]
    for f in (logpdf, pdf, cdf, logcdf, ccdf, logccdf)
        f(d, xs)
    end
    @test spy.nscalar[] == 0
    @test spy.nvector[] == 6
end

@testitem "scalar rand delegates to the inner distribution" begin
    using Distributions, Random

    d = thin(Gamma(2.0, 1.0), 0.3)
    draw = rand(MersenneTwister(3), d)
    @test draw isa Real
    @test draw > 0
end
