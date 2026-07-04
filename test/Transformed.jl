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

    # thin and cumulative are specialisations of the generic transform.
    g = transform(Gamma(2.0, 1.0), s -> 2.0 .* s)
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
