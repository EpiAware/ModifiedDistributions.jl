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

    # Logit and custom links are now accepted on a continuous base (they route
    # through the numeric cumulative-hazard path).
    @test modify(base, 0.5; link = :logit).link ===
          ModifiedDistributions.LogitLink
    @test modify(base, 0.5; link = ModifiedDistributions.LogitLink).link ===
          ModifiedDistributions.LogitLink

    # Unknown link symbols throw.
    @test_throws ArgumentError modify(base, 0.5; link = :cloglog)

    # A discrete base with a scalar effect is rejected: the discrete path needs
    # a per-bin vector effect.
    @test_throws ArgumentError modify(Poisson(3.0), 0.5)

    # A per-bin vector effect on a continuous base is rejected.
    @test_throws ArgumentError modify(base, [0.1, 0.2, 0.3])

    # Negative additive (identity link) effects are now accepted (numeric
    # clamped-hazard path).
    dneg = modify(base, -0.1; link = identity)
    @test dneg isa ModifiedDistributions.Modified

    # A custom callable link is accepted and wraps into a HazardLink.
    cloglog = ModifiedDistributions.hazard_link(
        h -> log(-log1p(-h)), eta -> -expm1(-exp(eta)))
    @test cloglog isa ModifiedDistributions.HazardLink
    @test modify(base, 0.5; link = cloglog).link === cloglog

    # A callable effect carries no numeric params, so params drops it.
    @test params(modify(base, t -> 0.1 * t)) == params(base)
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

@testitem "Modified batched vector observations" begin
    using Distributions

    xs = [0.5, 1.5, 3.0]

    # Per-point results equal the scalar map on both analytic paths, with a
    # stable eltype. A vector observation on a modifier is per-point (vector
    # result), unlike the Product{Weighted} joint-scalar convention.
    for d in (modify(LogNormal(1.5, 0.5), -log(2.0)),
        modify(Exponential(1.0), 0.2; link = identity))
        for f in (logpdf, pdf, cdf, logcdf, ccdf, logccdf)
            batched = f(d, xs)
            @test batched ≈ map(x -> f(d, x), xs)
            @test batched isa Vector{Float64}
        end
    end
end

@testitem "Modified numeric path matches the closed forms" begin
    using Distributions

    base = LogNormal(1.5, 0.5)

    # A genuinely distinct closure for log/exp forces the numeric quadrature
    # path; it must match the closed form to quadrature tolerance.
    beta = -0.4
    dlog = modify(base, beta; link = log)
    dlog_num = modify(base, beta;
        link = ModifiedDistributions.hazard_link(h -> log(h), e -> exp(e)))
    for x in (0.5, 2.0, 5.0, 10.0)
        @test logccdf(dlog, x)≈logccdf(dlog_num, x) atol=1e-8
        @test logpdf(dlog, x)≈logpdf(dlog_num, x) atol=1e-8
    end

    # The identity closed form (positive effect) versus a numeric identity link.
    beta2 = 0.15
    did = modify(base, beta2; link = identity)
    did_num = modify(base, beta2;
        link = ModifiedDistributions.hazard_link(h -> 1.0 * h, e -> 1.0 * e))
    for x in (0.5, 2.0, 5.0)
        @test logccdf(did, x)≈logccdf(did_num, x) atol=1e-8
        @test logpdf(did, x)≈logpdf(did_num, x) atol=1e-8
    end
end

@testitem "Modified logit link accepted on a continuous base" begin
    using Distributions

    base = LogNormal(1.5, 0.5)
    d = modify(base, 0.3; link = :logit)

    # cdf / ccdf complementary and monotone; a proper density integrating to one.
    grid = range(0.1, 20.0; length = 40)
    cs = cdf.(Ref(d), grid)
    @test all(diff(cs) .>= -1e-9)
    for x in (0.5, 2.0, 5.0)
        @test cdf(d, x) + ccdf(d, x) ≈ 1.0
        @test pdf(d, x) >= 0
    end

    # cdf(quantile(p)) round-trips.
    for p in (0.1, 0.25, 0.5, 0.75, 0.9)
        @test cdf(d, quantile(d, p))≈p atol=1e-6
    end

    # The density integrates to one (fixed-node quadrature).
    total = ModifiedDistributions.gl_integrate(
        x -> pdf(d, x), 1e-6, 200.0, ModifiedDistributions._GL(400))
    @test total≈1.0 atol=1e-4
end

@testitem "Modified negative additive effect stays a valid CDF" begin
    using Distributions
    using ForwardDiff

    # An additive-hazard model is only valid where h(t) + β >= 0. For a negative
    # β on a base with h(0) = 0 the raw hazard goes negative near the origin, so
    # the modified hazard is clamped to max(h + β, 0): logpdf, logccdf and cdf
    # must all use that clamped hazard and stay mutually consistent and monotone.
    bases = (LogNormal(1.5, 0.5), Weibull(2.0, 3.0))
    betas = (-0.1, -0.4, 0.2)
    grid = collect(0.0:0.25:12.0)

    for b in bases, beta in betas

        d = modify(b, beta; link = identity)
        cdfs = cdf.(Ref(d), grid)
        @test all(c -> -1e-10 <= c <= 1 + 1e-10, cdfs)
        @test all(diff(cdfs) .>= -1e-10)
        for x in grid
            @test cdf(d, x) + ccdf(d, x) ≈ 1
            @test pdf(d, x) >= -1e-12
        end
        # AD through the effect is finite (ForwardDiff over logpdf and cdf).
        g_lp = ForwardDiff.derivative(
            bb -> logpdf(modify(b, bb; link = identity), 3.0), beta)
        g_cdf = ForwardDiff.derivative(
            bb -> cdf(modify(b, bb; link = identity), 3.0), beta)
        @test isfinite(g_lp)
        @test isfinite(g_cdf)
    end
end

@testitem "Modified callable effect on the numeric path" begin
    using Distributions

    base = LogNormal(1.5, 0.5)
    # A constant callable effect matches the scalar logit modify to tolerance.
    dc = modify(base, t -> 0.3; link = :logit)
    ds = modify(base, 0.3; link = :logit)
    for x in (0.5, 2.0, 5.0)
        @test logpdf(dc, x)≈logpdf(ds, x) atol=1e-10
    end

    # A time-varying effect gives a proper, finite density.
    dv = modify(base, t -> 0.1 * t; link = :logit)
    total = ModifiedDistributions.gl_integrate(
        x -> pdf(dv, x), 1e-6, 200.0, ModifiedDistributions._GL(400))
    @test total≈1.0 atol=1e-3
end

@testitem "Modified discrete per-bin reconstruction" begin
    using Distributions

    # A discretised, truncated LogNormal delay as a plain discrete distribution
    # over the integer grid 0:(n-1).
    n = 11
    trunc = truncated(LogNormal(1.5, 0.5); upper = Float64(n) - 0.5)
    raw = [pdf(trunc, Float64(g)) for g in 0:(n - 1)]
    probs = raw ./ sum(raw)
    ic = DiscreteNonParametric(collect(0:(n - 1)), probs)
    base_pmf = [pdf(ic, Float64(g)) for g in 0:(n - 1)]
    effects = collect(range(-0.5, 0.5; length = n))

    # The logit-link discrete path equals `apply_hazard_effects` lifted onto the
    # distribution.
    m = modify(ic, effects; link = :logit)
    mpmf = [pdf(m, Float64(b)) for b in 0:(n - 1)]
    ref = ModifiedDistributions.apply_hazard_effects(base_pmf, effects)
    @test mpmf ≈ ref
    @test sum(mpmf) ≈ 1.0

    # A proper distribution for any link, with complementary/accumulating cdf.
    for link in (:logit, log, identity,
        ModifiedDistributions.hazard_link(h -> h, e -> e))
        mm = modify(ic, effects; link = link)
        @test sum(pdf(mm, Float64(b)) for b in 0:(n - 1)) ≈ 1.0
        @test cdf(mm, 4.0) + ccdf(mm, 4.0) ≈ 1.0
        @test cdf(mm, 4.0) ≈ sum(pdf(mm, Float64(b)) for b in 0:4)
    end

    # Zero effect reconstructs the baseline hazard with the final-bin
    # maximum-delay constraint; the first n-1 bins match the raw masses.
    m0 = modify(ic, zeros(n); link = :logit)
    m0pmf = [pdf(m0, Float64(b)) for b in 0:(n - 1)]
    @test m0pmf[1:(n - 1)] ≈ base_pmf[1:(n - 1)]
    @test sum(m0pmf) ≈ 1.0

    # rand returns grid points and roughly tracks the PMF.
    using Random
    rng = MersenneTwister(1)
    samples = [rand(rng, m) for _ in 1:20000]
    @test all(s -> s in 0.0:1.0:Float64(n - 1), samples)
    @test count(==(0.0), samples) / 20000≈mpmf[1] atol=5e-3
end

@testitem "Modified discrete per-bin AD through the effect" begin
    using Distributions
    using ForwardDiff

    ic = DiscreteNonParametric(collect(0:4), fill(0.2, 5))
    obs = [0.0, 1.0, 2.0, 3.0, 4.0]

    # Gradient wrt the per-bin effect vector (the final-bin effect carries a
    # zero gradient since its hazard is pinned to one).
    f(θ) = sum(x -> logpdf(modify(ic, θ; link = :logit), x), obs)
    g = ForwardDiff.gradient(f, [0.1, 0.2, -0.1, 0.3, 0.0])
    @test all(isfinite, g)
end

@testitem "Modified composes over thinned/weighted continuous bases (#46)" begin
    using Distributions

    base = LogNormal(1.5, 0.5)

    # Transformed and Weighted propagate the inner value support, so a
    # continuous base stays continuous through them and `modify` accepts the
    # nesting regardless of order (previously the erased support wrongly made
    # `modify(thin(...), effect)` reject the inner as non-continuous).
    @test thin(base, 0.3) isa
          ModifiedDistributions.AbstractModifiedDistribution
    @test weight(base, 2.0) isa
          ModifiedDistributions.AbstractModifiedDistribution
    @test thin(base, 0.3) isa UnivariateDistribution{Continuous}
    @test weight(base, 2.0) isa UnivariateDistribution{Continuous}

    # modify over a series-transformed continuous base constructs and hits the
    # analytic proportional-hazards path (a `_LogModified`), evaluating exactly
    # as modifying the bare base (the forward transforms are transparent to
    # every distribution method).
    for inner in (thin(base, 0.3), cumulative(base),
        series_transform(base, s -> 2 .* s))
        m = modify(inner, 0.5)
        @test m isa ModifiedDistributions.Modified
        for x in (0.5, 1.0, 2.0, 4.0)
            @test logccdf(m, x) ≈ exp(0.5) * logccdf(base, x)
            @test logpdf(m, x) ≈ logpdf(modify(base, 0.5), x)
            @test cdf(m, x) + ccdf(m, x) ≈ 1.0
        end
    end

    # A weighted base is transparent to the survival (weight only scales
    # `logpdf`), so the modified survival still matches the bare base and the
    # cdf stays a proper cdf.
    mw = modify(weight(base, 2.0), 0.5)
    for x in (0.5, 1.0, 2.0, 4.0)
        @test logccdf(mw, x) ≈ exp(0.5) * logccdf(base, x)
        @test cdf(mw, x) + ccdf(mw, x) ≈ 1.0
    end

    # The identity and numeric links also compose over the nesting.
    mi = modify(thin(base, 0.3), 0.2; link = identity)
    @test logccdf(mi, 2.0) ≈ logccdf(base, 2.0) - 0.2 * 2.0
    ml = modify(thin(base, 0.3), 0.3; link = :logit)
    @test cdf(ml, 2.0) ≈ cdf(modify(base, 0.3; link = :logit), 2.0)

    # A discrete base under a modifier keeps its discrete support and takes the
    # per-bin vector path.
    disc = DiscreteNonParametric(collect(0:4), fill(0.2, 5))
    @test thin(disc, 0.5) isa UnivariateDistribution{Discrete}
    md = modify(thin(disc, 0.5), fill(0.1, 5); link = :logit)
    @test sum(pdf(md, Float64(b)) for b in 0:4) ≈ 1.0
end

@testitem "Modified numeric path AD (ForwardDiff)" begin
    using Distributions
    using ForwardDiff

    obs = [0.5, 1.2, 2.5, 3.8]
    # LogNormal / Weibull have ForwardDiff-safe survival, so the numeric logit
    # path differentiates through the base params and the scalar effect. A Gamma
    # base needs ConvolvedDistributions' AD-safe gamma survival for the numeric
    # path and stays upstream.
    fln(θ) = sum(
        x -> logpdf(modify(LogNormal(θ[1], θ[2]), θ[3]; link = :logit), x), obs)
    gln = ForwardDiff.gradient(fln, [1.5, 0.5, 0.3])
    @test all(isfinite, gln)

    fw(θ) = sum(
        x -> logpdf(modify(Weibull(θ[1], θ[2]), θ[3]; link = :logit), x), obs)
    gw = ForwardDiff.gradient(fw, [1.5, 2.0, 0.3])
    @test all(isfinite, gw)
end
