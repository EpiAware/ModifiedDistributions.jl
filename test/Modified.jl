@testitem "Modified constructor and link normalisation" begin
    using Distributions

    base = LogNormal(1.5, 0.5)

    # Default link is the log (proportional hazards) link.
    d = modify(base, 0.5)
    @test d isa ModifiedDistributions.Modified
    @test d.link === ModifiedDistributions.LogLink
    @test d.effect == 0.5

    # Bare functions and symbols normalise onto the named links.
    @test modify(base, 0.5; link = log).link ===
          ModifiedDistributions.LogLink
    @test modify(base, 0.5; link = identity).link ===
          ModifiedDistributions.IdentityLink
    @test modify(base, 0.5; link = :log).link ===
          ModifiedDistributions.LogLink
    @test modify(base, 0.5; link = :identity).link ===
          ModifiedDistributions.IdentityLink
    @test modify(
        base, 0.5; link = ModifiedDistributions.LogLink).link ===
          ModifiedDistributions.LogLink

    # Unknown link symbols throw.
    @test_throws ArgumentError modify(base, 0.5; link = :cloglog)

    # Non-continuous inner distributions are rejected.
    @test_throws ArgumentError modify(Poisson(3.0), 0.5)

    # Negative additive (identity link) effects are rejected.
    @test_throws ArgumentError modify(base, -0.1; link = identity)

    # General links need numeric integration and are not yet supported.
    @test_throws ArgumentError modify(base, 0.5; link = :logit)
    @test_throws ArgumentError modify(
        base, 0.5; link = ModifiedDistributions.LogitLink)
    cloglog = ModifiedDistributions.hazard_link(
        h -> log(-log1p(-h)), eta -> -expm1(-exp(eta)))
    @test cloglog isa ModifiedDistributions.HazardLink
    @test_throws ArgumentError modify(base, 0.5; link = cloglog)
end

@testitem "Modified support, params, get_dist and nothing passthrough" begin
    using Distributions

    base = LogNormal(1.5, 0.5)
    d = modify(base, 0.5)

    @test get_dist(d) === base
    @test get_dist_recursive(d) === base
    @test minimum(d) == minimum(base)
    @test maximum(d) == maximum(base)
    @test insupport(d, 1.0)
    @test !insupport(d, -1.0)
    @test params(d) == (params(base)..., 0.5)
    @test eltype(d) == Float64

    # `nothing` means "no modification": the base flows through unchanged.
    @test modify(base, nothing) === base
end

@testitem "Modified log link proportional-hazards identities" begin
    using Distributions

    bases = (LogNormal(1.5, 0.5), Gamma(2.0, 1.5), Weibull(1.5, 2.0))
    for base in bases, beta in (-0.7, 0.5, 1.2)

        theta = exp(beta)
        d = modify(base, beta)
        for x in (0.5, 1.0, 2.0, 4.0, 8.0)
            @test ccdf(d, x) ≈ ccdf(base, x)^theta
            @test logccdf(d, x) ≈ theta * logccdf(base, x)
            @test logpdf(d, x) ≈
                  beta + logpdf(base, x) +
                  (theta - 1) * logccdf(base, x)
            @test pdf(d, x) ≈ exp(logpdf(d, x))
            @test cdf(d, x) + ccdf(d, x) ≈ 1.0
            # atol guards the deep upper tail where logcdf is ~ -1e-12 and
            # the two routes differ only in floating-point cancellation.
            @test logcdf(d, x)≈log(cdf(d, x)) atol=1e-10
        end
    end
end

@testitem "Modified zero effect reproduces the base" begin
    using Distributions

    base = Gamma(2.0, 1.5)
    for link in (log, identity)
        d = modify(base, 0.0; link = link)
        @test d isa ModifiedDistributions.Modified
        for x in (0.5, 1.0, 2.5, 6.0)
            @test logpdf(d, x) ≈ logpdf(base, x)
            @test logccdf(d, x) ≈ logccdf(base, x)
            @test cdf(d, x) ≈ cdf(base, x)
        end
    end
end

@testitem "Modified identity link additive-hazards identities" begin
    using Distributions

    for base in (LogNormal(1.0, 0.5), Weibull(1.5, 2.0))
        for beta in (0.1, 0.3, 1.0)
            d = modify(base, beta; link = identity)
            for x in (0.5, 1.0, 2.0, 4.0)
                @test logccdf(d, x) ≈ logccdf(base, x) - beta * x
                h = exp(logpdf(base, x) - logccdf(base, x))
                @test logpdf(d, x) ≈
                      log(h + beta) + logccdf(base, x) - beta * x
                @test pdf(d, x) ≈ exp(logpdf(d, x))
                @test cdf(d, x) + ccdf(d, x) ≈ 1.0
            end
        end
    end
end

@testitem "Modified identity link accrues hazard from support minimum" begin
    using Distributions

    # A base whose support starts above zero: the additive hazard accrues
    # from the support minimum m, logccdf*(x) = logccdf(x) - beta * (x - m),
    # so survival is continuous at m and the density integrates to one.
    base = Uniform(1.0, 3.0)
    beta = 0.4
    d = modify(base, beta; link = identity)
    @test ccdf(d, 1.0 + 1e-10)≈1.0 atol=1e-8
    @test logccdf(d, 2.0) ≈ logccdf(base, 2.0) - beta * (2.0 - 1.0)
    @test cdf(d, 3.0) ≈ 1.0
    xs = range(1.0, 3.0; length = 21)
    @test issorted(cdf.(d, xs))
    for p in (0.05, 0.25, 0.5, 0.75, 0.95)
        @test cdf(d, quantile(d, p))≈p atol=1e-8
    end

    # The density integrates to one over the support.
    ts = range(1.0, 3.0; length = 200_000)
    h = step(ts)
    integral = sum(pdf(d, t) for t in ts) * h
    @test isapprox(integral, 1.0; atol = 1e-3)

    # Bases without a finite lower support bound are rejected.
    @test_throws ArgumentError modify(
        Normal(0.0, 1.0), 0.5; link = identity)

    # Regression: for a base with minimum zero the accrual reduces to
    # beta * x, anchoring the m = 0 specialisation.
    e = Exponential(2.0)
    de = modify(e, 0.3; link = identity)
    for x in (0.5, 1.0, 2.0)
        @test logccdf(de, x) ≈ logccdf(e, x) - 0.3 * x
    end
end

@testitem "Modified quantile and cdf round trip" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    cases = ((log, 0.8), (log, -0.5), (log, 0.0),
        (identity, 0.4), (identity, 0.0))
    for (link, beta) in cases
        d = modify(base, beta; link = link)
        for p in (0.05, 0.25, 0.5, 0.75, 0.95, 0.99)
            @test cdf(d, quantile(d, p)) ≈ p atol=1e-8
        end
    end
end

@testitem "Modified rand matches cdf empirically" begin
    using Distributions, Random, Statistics

    rng = MersenneTwister(42)
    d = modify(LogNormal(1.0, 0.5), 0.7)
    xs = rand(rng, d, 50_000)
    for q in (1.0, 2.0, 3.0, 5.0)
        @test isapprox(mean(xs .<= q), cdf(d, q); atol = 0.01)
    end

    di = modify(LogNormal(1.0, 0.5), 0.3; link = identity)
    ys = rand(rng, di, 20_000)
    for q in (1.0, 2.0, 4.0)
        @test isapprox(mean(ys .<= q), cdf(di, q); atol = 0.015)
    end
end
