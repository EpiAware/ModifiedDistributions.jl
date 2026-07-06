@testitem "Convolved extension: loads and verbs need no new methods" begin
    using Distributions
    using ConvolvedDistributions

    # The extension loads once ConvolvedDistributions is present.
    @test Base.get_extension(ModifiedDistributions,
        :ModifiedDistributionsConvolvedDistributionsExt) !== nothing

    # Convolved / Difference are combined distributions, not modifiers, so
    # the modifier verbs need no new methods: both are univariate, the
    # constructors accept them directly, and `get_dist`'s default identity
    # is correct (there is nothing to unwrap).
    conv = convolve_distributions(Gamma(2.0, 1.0), LogNormal(0.5, 0.4))
    diff = difference(Gamma(2.0, 1.0), LogNormal(0.5, 0.4))
    x = 3.0

    for d in (conv, diff)
        @test get_dist(d) === d

        wd = weight(d, 4.0)
        @test wd isa ModifiedDistributions.Weighted
        @test get_dist(wd) === d
        @test logpdf(wd, x) ≈ 4.0 * logpdf(d, x)
        @test pdf(wd, x) ≈ pdf(d, x)

        th = thin(d, 0.5)
        @test th isa ModifiedDistributions.Transformed
        @test get_dist(th) === d
        @test logpdf(th, x) == logpdf(d, x)
    end
end

@testitem "Convolved extension: series handshake peels forward ops" begin
    using Distributions
    using ConvolvedDistributions

    delay = Gamma(2.0, 1.0)
    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]
    baseline = convolve_distributions(delay, series)

    # thin: the factor multiplies the unthinned baseline counts.
    thinned = convolve_distributions(thin(delay, 0.3), series)
    @test thinned ≈ 0.3 .* baseline

    # cumulative: the running sum of the baseline counts.
    cum = convolve_distributions(cumulative(delay), series)
    @test cum ≈ cumsum(baseline)

    # Nested wrappers apply their ops in order, innermost first:
    # accumulate, then thin.
    nested = thin(cumulative(delay), 0.3)
    @test convolve_distributions(nested, series) ≈ 0.3 .* cumsum(baseline)

    # A custom series_transform op applies through the same hook.
    shifted = series_transform(delay, s -> s .+ 1.0)
    @test convolve_distributions(shifted, series) ≈ baseline .+ 1.0

    # thin wrapping a Convolved total delay: the inner convolution's
    # discretised PMF drives the counts, then the thin factor applies.
    total = convolve_distributions(Gamma(2.0, 1.0), LogNormal(0.5, 0.4))
    total_counts = convolve_distributions(total, series)
    @test convolve_distributions(thin(total, 0.3), series) ≈
          0.3 .* total_counts

    # The kwarg mirrors the upstream vector method: a non-unit interval is
    # rejected by the inner call.
    @test_throws ArgumentError convolve_distributions(
        thin(delay, 0.3), series; interval = 2)
end

@testitem "Convolved extension: modifiers as convolution components" begin
    using Distributions
    using ConvolvedDistributions
    using Random

    # An affine-transformed Gamma as a component takes the numeric
    # quadrature path and returns finite, sensible values.
    ag = affine(Gamma(2.0, 1.0); scale = 2.0, shift = 1.0)
    d = convolve_distributions(ag, Normal(0.0, 1.0))
    c = cdf(d, 6.0)
    @test isfinite(c)
    @test 0 < c < 1
    @test cdf(d, 12.0) > c
    p = pdf(d, 6.0)
    @test isfinite(p)
    @test p > 0

    # Sensible: the CDF tracks a Monte Carlo estimate of P(X <= 6).
    draws = rand(MersenneTwister(42), d, 20_000)
    @test c ≈ mean(draws .<= 6.0) atol=0.02

    # affine(Normal) as an unbounded last component: the quadrature window
    # is picked by a quantile of the primal-reconstructed component, so
    # this returns finite values with no MethodError (the
    # `_primal_distribution` fix).
    an = affine(Normal(0.0, 1.0); scale = 2.0, shift = 1.0)
    d2 = convolve_distributions(Gamma(2.0, 1.0), an)
    c2 = cdf(d2, 4.0)
    @test isfinite(c2)
    @test 0 < c2 < 1
    @test isfinite(pdf(d2, 4.0))
end

@testitem "Convolved extension: _primal_distribution per modifier" begin
    using Distributions
    using ConvolvedDistributions: _primal_distribution
    using ModifiedDistributions: Affine, Modified
    using ForwardDiff: Dual

    g = Gamma(2.0, 1.0)

    # Affine rebuilds itself around the primal inner distribution.
    a = affine(g; scale = 2.0, shift = 1.0)
    pa = _primal_distribution(a)
    @test pa isa Affine
    @test pa.dist isa Gamma
    @test pa.scale == 2.0
    @test pa.shift == 1.0

    # Transformed and Weighted recurse to the inner distribution: the
    # forward op / likelihood weight never moves a quantile, so the primal
    # window component is the wrapped distribution itself.
    @test _primal_distribution(thin(g, 0.3)) isa Gamma
    @test _primal_distribution(weight(g, 2.0)) isa Gamma

    # Modified rebuilds with the primal base and effect, keeping the link.
    m = modify(g, 0.5)
    pm = _primal_distribution(m)
    @test pm isa Modified
    @test pm.effect == 0.5
    @test quantile(pm, 0.5) ≈ quantile(m, 0.5)

    # Nested wrappers recurse all the way down.
    na = thin(affine(g; scale = 2.0), 0.3)
    @test _primal_distribution(na) isa Affine

    # AD wrappers are stripped: a Dual-parameterised Affine reconstructs
    # with plain Float64 parameters everywhere.
    dg = Gamma(Dual(2.0, 1.0), Dual(1.0, 0.0))
    da = Affine(dg, Dual(2.0, 1.0), Dual(1.0, 0.0))
    pda = _primal_distribution(da)
    @test params(pda.dist) === (2.0, 1.0)
    @test pda.scale === 2.0
    @test pda.shift === 1.0

    dm = Modified(dg, Dual(0.5, 1.0), ModifiedDistributions.LogLink)
    pdm = _primal_distribution(dm)
    @test params(pdm.dist) === (2.0, 1.0)
    @test pdm.effect === 0.5
end

@testitem "Convolved extension: AD-safe survival family for Modified" begin
    using Distributions
    using ConvolvedDistributions: _cdf_ad_safe, _ccdf_ad_safe,
                                  _logcdf_ad_safe, _logccdf_ad_safe

    g = Gamma(2.0, 1.0)
    for m in (modify(g, 0.5), modify(g, 0.3; link = identity))
        for x in (0.5, 2.0, 5.0)
            @test _logccdf_ad_safe(m, x) ≈ logccdf(m, x)
            @test _ccdf_ad_safe(m, x) ≈ ccdf(m, x)
            @test _cdf_ad_safe(m, x) ≈ cdf(m, x)
            @test _logcdf_ad_safe(m, x) ≈ logcdf(m, x)
        end
        # At and below the support minimum the survival stays at one.
        @test _logccdf_ad_safe(m, 0.0) == 0.0
        @test _logccdf_ad_safe(m, -1.0) == 0.0
        @test _cdf_ad_safe(m, -1.0) == 0.0
    end
end

@testitem "Convolved extension: ForwardDiff gradients" begin
    using Distributions
    using ConvolvedDistributions
    import ForwardDiff

    # Central finite differences as an independent reference.
    function fdgrad(f, θ; h = 1e-6)
        map(eachindex(θ)) do i
            e = zeros(length(θ))
            e[i] = h
            (f(θ .+ e) - f(θ .- e)) / (2h)
        end
    end

    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]

    # Series handshake: gradient through the thinned convolved counts
    # w.r.t. the Gamma shape and scale.
    f1 = θ -> sum(convolve_distributions(
        thin(Gamma(θ[1], θ[2]), 0.3), series))
    g1 = ForwardDiff.gradient(f1, [2.0, 1.0])
    @test all(isfinite, g1)
    @test g1 ≈ fdgrad(f1, [2.0, 1.0]) rtol=1e-5

    # CDF of a Convolved with an affine component: gradient through the
    # inner LogNormal params and the affine scale and shift.
    f2 = θ -> cdf(
        convolve_distributions(
            affine(LogNormal(θ[1], θ[2]); scale = θ[3], shift = θ[4]),
            Gamma(2.0, 1.0)),
        8.0)
    g2 = ForwardDiff.gradient(f2, [1.0, 0.5, 1.5, 0.5])
    @test all(isfinite, g2)
    @test g2 ≈ fdgrad(f2, [1.0, 0.5, 1.5, 0.5]) rtol=1e-4

    # CDF of a Convolved with a Modified component: the kernel routes the
    # Modified survival through the base's AD-safe CDF family.
    f3 = θ -> cdf(
        convolve_distributions(
            modify(Gamma(θ[1], θ[2]), θ[3]), LogNormal(0.5, 0.4)),
        6.0)
    g3 = ForwardDiff.gradient(f3, [2.0, 1.0, 0.4])
    @test all(isfinite, g3)
    @test g3 ≈ fdgrad(f3, [2.0, 1.0, 0.4]) rtol=1e-4

    # Modified as the LAST component exercises the pdf path, whose
    # quadrature calls the raw `pdf(last_comp, t)` rather than an AD-safe
    # hook. ForwardDiff's operator-overloading Duals happen to flow
    # through the raw call (the Gamma log-survival inside the Modified
    # logpdf is pure Julia), so this passes here; reverse-mode backends
    # need registered rules and so still wait on the pending
    # ConvolvedDistributions `_pdf_ad_safe` hook before this case can
    # join the per-backend AD suite.
    f4 = θ -> pdf(
        convolve_distributions(
            LogNormal(0.5, 0.4), modify(Gamma(θ[1], θ[2]), θ[3])),
        6.0)
    g4 = ForwardDiff.gradient(f4, [2.0, 1.0, 0.4])
    @test all(isfinite, g4)
    @test g4 ≈ fdgrad(f4, [2.0, 1.0, 0.4]) rtol=1e-4
end

@testitem "batched-evaluation traits for Convolved" begin
    using Distributions
    using ConvolvedDistributions

    conv = convolve_distributions(Gamma(2.0, 1.0), LogNormal(0.3, 0.4))
    # The traits route whole-batch evaluation of a wrapped Convolved
    # through its single-solve quadrature methods.
    @test ModifiedDistributions._has_batched_logpdf(conv)
    @test ModifiedDistributions._has_batched_method(
        Distributions.logpdf, conv)
    @test ModifiedDistributions._has_batched_method(Distributions.pdf, conv)
    @test ModifiedDistributions._has_batched_method(Distributions.cdf, conv)
    @test !ModifiedDistributions._has_batched_method(
        Distributions.logccdf, conv)

    # Batched scoring through a modifier matches the scalar map.
    xs = [1.0, 2.5, 4.0]
    d = affine(conv; scale = 2.0)
    # The batched quadrature shares one grid across the batch, so values
    # differ from per-point solves at ~1e-4 relative.
    @test logpdf(d, xs) ≈ map(x -> logpdf(d, x), xs) rtol = 1e-3
end

@testitem "buried forward ops are rejected, outermost ops work" begin
    using Distributions
    using ConvolvedDistributions

    delay = Gamma(2.0, 1.0)
    series = [0.0, 5.0, 12.0, 20.0, 15.0]

    # A forward op wrapped inside another modifier cannot reach the series
    # convolution; silently dropping it produced wrong counts before the
    # guard (PR #41 review finding).
    @test_throws ArgumentError convolve_distributions(
        weight(cumulative(delay), 3.0), series)
    @test_throws ArgumentError convolve_distributions(
        affine(thin(delay, 0.3); scale = 2.0), series)

    # Outermost ops peel correctly even over a modified inner delay: the
    # weight only touches logpdf, so the convolved counts match the
    # unweighted inner delay's, accumulated.
    baseline = convolve_distributions(delay, series)
    counts = convolve_distributions(cumulative(weight(delay, 3.0)), series)
    (accumulated = counts, expected = cumsum(baseline))
    @test counts ≈ cumsum(baseline)
end
