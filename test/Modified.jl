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

    # A discrete base with a scalar effect is rejected: the discrete path needs
    # a per-bin vector effect.
    @test_throws ArgumentError modify(Poisson(3.0), 0.5)

    # A per-bin vector effect on a continuous base is rejected.
    @test_throws ArgumentError modify(base, [0.1, 0.2, 0.3])

    # A continuous base needs a scalar `Real` or a callable effect; any other
    # type (here a tuple) is rejected clearly at construction.
    @test_throws ArgumentError modify(base, (0.1, 0.2))

    # Negative additive (identity link) effects are now accepted: the clamped
    # closed-form additive-hazard path handles them in core (no quadrature).
    dneg = modify(base, -0.1; link = identity)
    @test dneg isa ModifiedDistributions.Modified
    @test ModifiedDistributions.get_effect(dneg) == -0.1

    # A callable effect on a continuous base constructs (its evaluation is the
    # numeric quadrature path, #77b); get_effect returns the callable.
    fx = t -> 0.1 * t
    dcall = modify(base, fx)
    @test dcall isa ModifiedDistributions.Modified
    @test ModifiedDistributions.get_effect(dcall) === fx

    # General links on a CONTINUOUS base now construct too: they take the
    # numeric cumulative-hazard path (evaluated by the QuadGK extension, #77b).
    @test modify(base, 0.5; link = :logit) isa ModifiedDistributions.Modified
    @test modify(base, 0.5; link = ModifiedDistributions.LogitLink) isa
          ModifiedDistributions.Modified
    cloglog = ModifiedDistributions.hazard_link(
        h -> log(-log1p(-h)), eta -> -expm1(-exp(eta)))
    @test cloglog isa ModifiedDistributions.HazardLink
    @test modify(base, 0.5; link = cloglog) isa ModifiedDistributions.Modified

    # A discrete base accepts a per-bin vector effect under ANY link (the
    # per-bin reconstruction is link-agnostic and needs no numeric integration).
    disc = DiscreteNonParametric(collect(0:4), fill(0.2, 5))
    for lk in (:logit, log, identity, cloglog)
        @test modify(disc, fill(0.1, 5); link = lk) isa
              ModifiedDistributions.Modified
    end

    # A per-bin vector on a discrete base makes the Modified a discrete
    # univariate distribution (value support propagates from the base).
    @test modify(disc, fill(0.1, 5)) isa UnivariateDistribution{Discrete}
    @test modify(base, 0.5) isa UnivariateDistribution{Continuous}
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

@testitem "Modified callable effect evaluates via the numeric path (#77b)" begin
    using Distributions
    using QuadGK

    base = LogNormal(1.5, 0.5)

    # A callable effect on a continuous base is a time-varying hazard whose
    # cumulative-hazard integral has no closed form, so it takes the numeric
    # path (evaluated by the QuadGK extension, #77b). Construction succeeds;
    # get_effect returns the callable; params drops it (a callable carries no
    # numeric parameters).
    for link in (log, identity)
        d = modify(base, t -> 0.1 * t; link = link)
        @test d isa ModifiedDistributions.Modified
        @test ModifiedDistributions.get_effect(d)(2.0) ≈ 0.2
        @test params(d) == params(base)
        # Below the support survival is one; in-support evaluation is finite and
        # coherent (survival in [0, 1], density non-negative, cdf = 1 - ccdf).
        @test logccdf(d, 0.0) == 0.0
        @test isfinite(logpdf(d, 2.0))
        @test 0.0 <= ccdf(d, 2.0) <= 1.0
        @test cdf(d, 2.0) ≈ 1 - ccdf(d, 2.0)
        @test pdf(d, 2.0) >= 0.0
    end
end

@testitem "Modified negative additive effect stays a valid clamped law" begin
    using Distributions

    # An additive-hazard model is only valid where h(t) + β >= 0. For a negative
    # β the raw hazard can go below zero near the origin, so the modified hazard
    # is clamped to max(h + β, 0). logpdf, logccdf and cdf must use that clamped
    # hazard and stay mutually consistent and monotone.
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
    end

    # The closed-form clamped cumulative hazard matches a fine brute-force
    # trapezoidal integral of max(h(u) + β, 0), so the survival is exact.
    function brute_cumhazard(base, beta, x; n = 400_000)
        m = minimum(base)
        x <= m && return 0.0
        us = range(m, x; length = n)
        du = step(us)
        acc = 0.0
        for u in us
            logS = logccdf(base, u)
            h = isfinite(logS) ? exp(logpdf(base, u) - logS) : Inf
            acc += max(h + beta, 0.0) * du
        end
        return acc
    end
    for (b, beta) in ((LogNormal(1.5, 0.5), -0.2), (Weibull(2.0, 3.0), -0.3))
        d = modify(b, beta; link = identity)
        for x in (1.0, 2.0, 4.0, 6.0)
            @test -logccdf(d, x) ≈ brute_cumhazard(b, beta, x) atol=3e-3
        end
    end
end

@testitem "Modified identity closed form cdf stays monotone far past the active clamp band (#82)" begin
    using Distributions

    # The clamp-knot scan used to run over [m, x], so a far-out x coarsened its
    # step past the (bounded) band where the hazard clears the clamp level,
    # the scan found no crossings, the cumulative hazard came back as zero and
    # cdf collapsed. The scan is now capped at a deep base quantile
    # independent of x, so the active band is always resolved.
    d = modify(LogNormal(1.5, 0.5), -0.4; link = identity)
    c500 = cdf(d, 500.0)
    @test c500 ≈ 0.042346 atol=1e-5
    @test cdf(d, 1.0e4) ≈ c500 atol=1e-8
    @test cdf(d, 1.0e6) ≈ c500 atol=1e-8
    @test cdf(d, 1.0e4) >= c500 - 1e-10
    @test cdf(d, 1.0e6) >= c500 - 1e-10
end

@testitem "Modified negative additive defective law quantile throws" begin
    using Distributions

    # A LogNormal hazard peaks then decays, so a strong negative additive effect
    # clamps most of the hazard away and leaves the law sub-stochastic: its cdf
    # converges below one, so a high-probability quantile is undefined and must
    # throw rather than return a garbage bracket.
    d = modify(LogNormal(1.5, 0.5), -0.4; link = identity)
    total = cdf(d, 500.0)
    @test 0.0 < total < 1.0
    @test_throws ArgumentError quantile(d, 0.99)
    @test_throws ArgumentError quantile(d, min(total + 0.2, 0.999))

    # Below the total mass the quantile is well defined and round-trips against
    # the same clamped cdf.
    plo = total / 2
    @test cdf(d, quantile(d, plo)) ≈ plo atol=1e-6

    # A proper (non-defective) negative-additive law round-trips at all p.
    dp = modify(Weibull(2.0, 3.0), -0.1; link = identity)
    for p in (0.1, 0.25, 0.5, 0.75, 0.9)
        @test cdf(dp, quantile(dp, p)) ≈ p atol=1e-6
    end
end

@testitem "Modified discrete per-bin reporting-hazard reconstruction" begin
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

    # The reconstruction sums to one for ANY link (the final-bin hazard is
    # pinned to one, so the reconstructed masses telescope to one), and the cdf
    # accumulates the pmf and is complementary. This holds even for links whose
    # inverse is not bounded to [0, 1].
    for link in (:logit, log, identity,
        ModifiedDistributions.hazard_link(h -> h, e -> e))
        mm = modify(ic, effects; link = link)
        @test sum(pdf(mm, Float64(b)) for b in 0:(n - 1)) ≈ 1.0
        @test cdf(mm, 4.0) + ccdf(mm, 4.0) ≈ 1.0
        @test cdf(mm, 4.0) ≈ sum(pdf(mm, Float64(b)) for b in 0:4)
        # Outside the grid: pdf zero, cdf saturates.
        @test pdf(mm, -1.0) == 0.0
        @test cdf(mm, -1.0) == 0.0
        @test cdf(mm, Float64(n)) ≈ 1.0
    end

    # The logit link keeps each bin's hazard in (0, 1), so its reconstruction is
    # a genuine probability vector (all masses non-negative); logpdf/logccdf are
    # then the logs of the (positive) pmf and survival. A general link (identity
    # or a linear custom link) can push a bin's hazard outside [0, 1] and yield a
    # formally-normalised but improper reconstruction, so this proper-mass check
    # is logit-specific.
    ml = modify(ic, effects; link = :logit)
    for b in 0:(n - 1)
        @test pdf(ml, Float64(b)) >= 0
    end
    @test logpdf(ml, 2.0) ≈ log(pdf(ml, 2.0))
    @test logccdf(ml, 3.0) ≈ log(ccdf(ml, 3.0))

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
    @test count(==(0.0), samples) / 20000 ≈ mpmf[1] atol=1e-2
end

@testitem "Modified reporting-hazard vector helpers round-trip" begin
    using Distributions

    # delay_hazard and hazard_to_pmf are inverse maps; the final-bin hazard is
    # pinned to one so the reconstructed PMF sums to one.
    pmf = [0.2, 0.3, 0.3, 0.2]
    h = ModifiedDistributions.delay_hazard(pmf)
    @test h[end] == 1.0
    @test ModifiedDistributions.hazard_to_pmf(h) ≈ pmf
    @test sum(ModifiedDistributions.hazard_to_pmf(h)) ≈ 1.0

    # A zero effect leaves the PMF unchanged (up to the max-delay constraint).
    @test ModifiedDistributions.apply_hazard_effects(pmf, zeros(4)) ≈ pmf

    # Mismatched lengths throw.
    @test_throws DimensionMismatch ModifiedDistributions.apply_hazard_effects(
        pmf, [0.1, 0.2])
end

@testitem "Modified effect surface: scalar vs callable vs vector" begin
    using Distributions

    base = LogNormal(1.5, 0.5)
    disc = DiscreteNonParametric(collect(0:4), fill(0.2, 5))

    # A constant callable would (once the numeric path lands) match the scalar
    # effect; here we assert the type surface: each effect kind constructs on the
    # right base under both closed-form links, and value support propagates.
    @test modify(base, 0.5; link = log) isa UnivariateDistribution{Continuous}
    @test modify(base, 0.5; link = identity) isa
          UnivariateDistribution{Continuous}
    @test modify(base, t -> 0.5; link = log) isa
          UnivariateDistribution{Continuous}
    @test modify(disc, fill(0.2, 5); link = log) isa
          UnivariateDistribution{Discrete}
    @test modify(disc, fill(0.2, 5); link = identity) isa
          UnivariateDistribution{Discrete}

    # The scalar closed-form paths are unchanged by the widening.
    dlog = modify(base, 0.5; link = log)
    @test logccdf(dlog, 2.0) ≈ exp(0.5) * logccdf(base, 2.0)
    did = modify(base, 0.3; link = identity)
    @test logccdf(did, 2.0) ≈ logccdf(base, 2.0) - 0.3 * 2.0
end

@testitem "Modified ForwardDiff gradients (callable/vector and negative additive)" begin
    using Distributions
    using ForwardDiff

    # Negative additive effect: the clamped closed form differentiates through
    # the effect β. The moving clamp knots carry no gradient (at a knot the
    # integrand is zero), so the gradient matches a central finite difference.
    fdcheck(f, x; h = 1e-6) = (f(x + h) - f(x - h)) / (2h)
    for b in (LogNormal(1.5, 0.5), Weibull(2.0, 3.0)), beta in (-0.1, -0.3, 0.2)

        g_lp = ForwardDiff.derivative(
            bb -> logpdf(modify(b, bb; link = identity), 3.0), beta)
        g_cdf = ForwardDiff.derivative(
            bb -> cdf(modify(b, bb; link = identity), 3.0), beta)
        @test isfinite(g_lp)
        @test isfinite(g_cdf)
    end
    g_ad = ForwardDiff.derivative(
        bb -> cdf(modify(Weibull(2.0, 3.0), bb; link = identity), 3.0), -0.1)
    g_fd = fdcheck(
        bb -> cdf(modify(Weibull(2.0, 3.0), bb; link = identity), 3.0), -0.1)
    @test g_ad≈g_fd atol=1e-3 rtol=1e-2

    # Per-bin vector effect on a discrete base: the whole PMF-hazard-PMF map is
    # AD-safe arithmetic, so the gradient wrt the effect vector is finite and
    # matches finite differences. (The final-bin effect carries a zero gradient
    # since its hazard is pinned to one.)
    ic = DiscreteNonParametric(collect(0:4), fill(0.2, 5))
    obs = [0.0, 1.0, 2.0, 3.0, 4.0]
    f(θ) = sum(x -> logpdf(modify(ic, θ; link = :logit), x), obs)
    θ0 = [0.1, 0.2, -0.1, 0.3, 0.0]
    g = ForwardDiff.gradient(f, θ0)
    @test all(isfinite, g)
    g_fdv = [fdcheck(t -> (θ = copy(θ0); θ[i] = t; f(θ)), θ0[i]) for i in 1:5]
    @test g ≈ g_fdv atol=1e-4
end

@testitem "Modified total_mass and is_defective: proper laws are never defective" begin
    using Distributions

    # Proportional hazards (log link): S* = S^θ, θ = exp(β) > 0, always decays
    # to zero. Never defective regardless of the sign of β.
    for beta in (-0.5, 0.0, 0.7)
        d = modify(LogNormal(1.5, 0.5), beta; link = log)
        @test total_mass(d) == 1.0
        @test !is_defective(d)
    end

    # Additive hazards (identity link) with a non-negative effect only adds
    # hazard. Never defective.
    for beta in (0.0, 0.3, 1.2)
        d = modify(Weibull(2.0, 3.0), beta; link = identity)
        @test total_mass(d) == 1.0
        @test !is_defective(d)
    end

    # Discrete per-bin reporting hazard: the final-bin hazard is pinned to
    # one, so the reconstructed PMF always sums to one. Never defective.
    grid = collect(0:4)
    base = DiscreteNonParametric(grid, fill(0.2, 5))
    for beta in (fill(0.3, 5), fill(-0.9, 5))
        d = modify(base, beta; link = :logit)
        @test total_mass(d) == 1.0
        @test !is_defective(d)
    end
end

@testitem "Modified total_mass and is_defective: negative additive clamp" begin
    using Distributions

    # A strong negative additive effect on a LogNormal (peaked, then decaying
    # hazard) clamps most of the hazard away and leaves the law sub-stochastic:
    # matches the plateaued cdf already exercised by the quantile-throws test.
    d = modify(LogNormal(1.5, 0.5), -0.4; link = identity)
    @test total_mass(d) ≈ 0.042346 atol=1e-5
    @test is_defective(d)

    # The complementary ccdf reports the same deficit consistently: as x grows
    # the residual survival converges to 1 - total_mass(d).
    @test ccdf(d, 1.0e6) ≈ 1 - total_mass(d) atol=1e-8
    @test cdf(d, 1.0e6) ≈ total_mass(d) atol=1e-8

    # A mild negative effect on a monotone-decreasing (Exponential) hazard
    # never clamps away all the mass permanently: still proper.
    dp = modify(Weibull(2.0, 3.0), -0.1; link = identity)
    @test total_mass(dp) ≈ 1.0 atol=1e-6
    @test !is_defective(dp)

    # A base with a finite upper support bound is evaluated exactly at that
    # bound rather than by numeric cap search.
    trunc_base = truncated(LogNormal(1.5, 0.5); upper = 10.0)
    dt = modify(trunc_base, -0.4; link = identity)
    @test total_mass(dt) ≈ cdf(dt, 10.0)
end

@testitem "piecewise_effect validation (#105)" begin
    using ModifiedDistributions, Distributions

    # One more multiplier than breaks is required.
    @test_throws ArgumentError piecewise_effect(;
        breaks = [1.0], multipliers = [1.0])
    @test_throws ArgumentError piecewise_effect(;
        breaks = [1.0, 3.0], multipliers = [1.0])

    # Breakpoints must be strictly increasing.
    @test_throws ArgumentError piecewise_effect(;
        breaks = [1.0, 1.0], multipliers = [1.0, 2.0, 0.5])
    @test_throws ArgumentError piecewise_effect(;
        breaks = [3.0, 1.0], multipliers = [1.0, 2.0, 0.5])

    # Multipliers must be non-negative.
    @test_throws ArgumentError piecewise_effect(;
        breaks = [1.0, 3.0], multipliers = [1.0, -2.0, 0.5])

    pe = piecewise_effect(; breaks = [1.0, 3.0], multipliers = [1.0, 2.0, 0.5])
    @test pe isa ModifiedDistributions.PiecewiseEffect
    @test pe.breaks == [1.0, 3.0]
    @test pe.multipliers == [1.0, 2.0, 0.5]

    # A single global multiplier (no breaks) is a valid degenerate case.
    pe0 = piecewise_effect(; breaks = Float64[], multipliers = [2.0])
    @test pe0.breaks == Float64[]
end

@testitem "modify with a PiecewiseEffect only pairs with the log link (#105)" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    pe = piecewise_effect(; breaks = [1.0, 3.0], multipliers = [1.0, 2.0, 0.5])
    d = modify(base, pe; link = ModifiedDistributions.LogLink)
    @test d isa ModifiedDistributions.Modified
    @test d isa UnivariateDistribution{Continuous}

    @test_throws ArgumentError modify(
        base, pe; link = ModifiedDistributions.IdentityLink)
    @test_throws ArgumentError modify(base, pe; link = :logit)
    @test_throws ArgumentError modify(base, pe; link = identity)
end

@testitem "piecewise-modified closed form matches a brute-force cumulative hazard (#105)" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    breaks = [1.0, 3.0]
    multipliers = [1.0, 2.0, 0.5]
    d = modify(base, piecewise_effect(; breaks, multipliers);
        link = ModifiedDistributions.LogLink)

    function brute_cumhazard(base, breaks, multipliers, x; n = 400_000)
        m = minimum(base)
        x <= m && return 0.0
        us = range(m, x; length = n)
        du = step(us)
        acc = 0.0
        for u in us
            logS = logccdf(base, u)
            h = isfinite(logS) ? exp(logpdf(base, u) - logS) : Inf
            idx = searchsortedlast(breaks, u) + 1
            acc += multipliers[idx] * h * du
        end
        return acc
    end

    for x in (0.5, 1.0, 1.5, 2.5, 3.0, 5.0)
        @test -logccdf(d, x) ≈ brute_cumhazard(base, breaks, multipliers, x) atol=3e-3
    end
end

@testitem "piecewise-modified segment boundary is right-continuous (#105)" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    # Hazard off before t=1, on (multiplier 1) from t=1 onward -- matching
    # the issue's own `t < 1.0 ? 0.0 : log(2.0)` convention (the breakpoint
    # value itself uses the UPPER segment's multiplier).
    d = modify(base, piecewise_effect(; breaks = [1.0], multipliers = [0.0, 1.0]);
        link = ModifiedDistributions.LogLink)

    # Survival is continuous at the breakpoint (only the HAZARD jumps): no
    # time has yet passed inside the new segment exactly at t=1.0.
    @test ccdf(d, 0.999) ≈ 1.0
    @test ccdf(d, 1.0) ≈ 1.0
    # But the density already reflects the upper segment's multiplier there,
    # and survival strictly decreases immediately afterward.
    @test pdf(d, 1.0) > 0
    @test ccdf(d, 1.0 + 1.0e-6) < 1.0
end

@testitem "piecewise-modified pdf/cdf/ccdf are consistent, monotone and proper (#105)" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    d = modify(base,
        piecewise_effect(; breaks = [1.0, 3.0], multipliers = [1.0, 2.0, 0.5]);
        link = ModifiedDistributions.LogLink)
    grid = collect(0.0:0.25:8.0)
    cdfs = cdf.(Ref(d), grid)
    @test all(c -> -1e-10 <= c <= 1 + 1e-10, cdfs)
    @test all(diff(cdfs) .>= -1e-10)
    for x in grid
        @test cdf(d, x) + ccdf(d, x) ≈ 1
        @test pdf(d, x) >= -1e-12
    end

    # A nonzero trailing multiplier keeps the law proper (the base's own
    # hazard integral still diverges past the last break).
    @test total_mass(d) ≈ 1.0 atol=1e-6
    @test !is_defective(d)
end

@testitem "piecewise-modified quantile/rand round-trip for a proper law (#105)" begin
    using Distributions, Random

    base = Weibull(1.5, 2.0)
    d = modify(base,
        piecewise_effect(; breaks = [1.0, 3.0], multipliers = [1.0, 2.0, 0.5]);
        link = ModifiedDistributions.LogLink)
    for p in (0.1, 0.25, 0.5, 0.75, 0.9)
        @test cdf(d, quantile(d, p)) ≈ p atol=1e-6
    end
    rng = MersenneTwister(1)
    draws = [rand(rng, d) for _ in 1:1000]
    @test all(isfinite, draws)
end

@testitem "gate produces a defective law reading through total_mass/is_defective (#105)" begin
    using Distributions

    base = Weibull(1.5, 2.0)
    g = gate(base, 1.0, 3.0)
    @test g isa ModifiedDistributions.Modified
    @test is_defective(g)

    # Survival is one before the window opens.
    @test ccdf(g, 0.999) ≈ 1.0

    # Inside the window it matches the base's own hazard restarted from
    # opens' cumulative hazard, the closed form the issue describes.
    expected_mid = exp(-(-logccdf(base, 2.0) - (-logccdf(base, 1.0))))
    @test ccdf(g, 2.0) ≈ expected_mid

    # Flat thereafter: the residual "never occurred" mass.
    residual = ccdf(g, 3.0)
    @test ccdf(g, 10.0) ≈ residual atol=1e-10
    @test ccdf(g, 1.0e6) ≈ residual atol=1e-8
    @test total_mass(g) ≈ 1 - residual atol=1e-10

    # A quantile beyond the total mass is undefined and throws.
    @test_throws ArgumentError quantile(g, min(total_mass(g) + 0.05, 0.999))
    # Below the total mass it round-trips against the same defective cdf.
    plo = total_mass(g) / 2
    @test cdf(g, quantile(g, plo)) ≈ plo atol=1e-6

    @test_throws ArgumentError gate(base, 3.0, 1.0)
    @test_throws ArgumentError gate(base, 1.0, 1.0)
end

@testitem "piecewise-modified ForwardDiff gradients (multipliers and breaks) (#105)" begin
    using Distributions
    using ForwardDiff

    base = Weibull(1.5, 2.0)

    g_mult = ForwardDiff.gradient(
        m -> logpdf(
            modify(base, piecewise_effect(; breaks = [1.0, 3.0], multipliers = m);
                link = ModifiedDistributions.LogLink),
            2.0),
        [1.0, 2.0, 0.5])
    @test all(isfinite, g_mult)

    fdcheck(f, x; h = 1e-6) = (f(x + h) - f(x - h)) / (2h)
    f_break(b) = logpdf(
        modify(base,
            piecewise_effect(; breaks = [b, 3.0], multipliers = [1.0, 2.0, 0.5]);
            link = ModifiedDistributions.LogLink),
        2.0)
    g_ad = ForwardDiff.derivative(f_break, 1.0)
    g_fd = fdcheck(f_break, 1.0)
    @test isfinite(g_ad)
    @test g_ad≈g_fd atol=1e-4 rtol=1e-3

    # gate's residual mass differentiates through the window bounds too.
    g_gate = ForwardDiff.derivative(
        opens -> total_mass(gate(base, opens, 3.0)), 1.0)
    @test isfinite(g_gate)
end
