# Numeric cumulative-hazard path for `Modified` (ModifiedDistributionsQuadGKExt,
# #77b). The correctness anchor is that a CONSTANT callable effect, or a general
# link that is numerically the log/identity link, must reproduce the analytic
# closed forms through the quadrature path.

@testitem "QuadGK extension: loads with QuadGK" begin
    using QuadGK
    @test Base.get_extension(ModifiedDistributions,
        :ModifiedDistributionsQuadGKExt) !== nothing
end

@testitem "QuadGK numeric path: constant callable ≡ log-link closed form" begin
    using Distributions
    using QuadGK

    base = Gamma(2.0, 1.5)
    β = 0.4
    closed = modify(base, β; link = log)          # analytic _LogModified
    numeric = modify(base, _ -> β; link = log)     # callable → numeric path

    for x in (0.5, 1.0, 2.5, 6.0)
        @test logccdf(numeric, x) ≈ logccdf(closed, x) rtol=1e-6
        @test logpdf(numeric, x) ≈ logpdf(closed, x) rtol=1e-6
        @test cdf(numeric, x) ≈ cdf(closed, x) rtol=1e-6
        @test ccdf(numeric, x) ≈ ccdf(closed, x) rtol=1e-6
    end
end

@testitem "QuadGK numeric path: constant callable ≡ identity closed form" begin
    using Distributions
    using QuadGK

    base = Gamma(2.0, 1.5)
    for β in (0.3, -0.2)                            # +ve and clamped -ve
        closed = modify(base, β; link = identity)  # analytic _IdentityModified
        numeric = modify(base, _ -> β; link = identity)

        for x in (0.5, 1.0, 2.5, 6.0)
            @test logccdf(numeric, x) ≈ logccdf(closed, x) rtol=1e-5
            @test logpdf(numeric, x) ≈ logpdf(closed, x) rtol=1e-5
        end
    end
end

@testitem "QuadGK numeric path: scalar general link (numeric branch)" begin
    using Distributions
    using QuadGK

    base = LogNormal(0.6, 0.5)
    β = -0.3
    # Distinct-typed closures for the log link: `hazard_link(log, exp)` is
    # type-identical to `LogLink` and would dispatch to the CLOSED FORM, so use
    # anonymous functions to force the scalar-general-link NUMERIC branch. The
    # maths is the log link, so it must still reproduce the closed form.
    ratelink = ModifiedDistributions.hazard_link(h -> log(h), z -> exp(z))
    numeric = modify(base, β; link = ratelink)
    closed = modify(base, β; link = log)

    @test numeric isa ModifiedDistributions.Modified
    # The numeric branch is genuinely exercised: the link is not `LogLink`.
    @test typeof(ratelink) !== typeof(ModifiedDistributions.LogLink)
    for x in (0.5, 1.0, 2.0, 4.0)
        @test logccdf(numeric, x) ≈ logccdf(closed, x) rtol=1e-6
        @test logpdf(numeric, x) ≈ logpdf(closed, x) rtol=1e-6
    end
end

@testitem "QuadGK numeric path: clamped callable matches closed form far out" begin
    using Distributions
    using QuadGK

    # A negative additive effect clamps the hazard, so the active band is
    # bounded and the law is defective (survival plateaus). Querying far past
    # the active band is the case where a bare quadgk silently returns 0; the
    # clamp-knot subdivision must reproduce the exact closed form there.
    base = LogNormal(1.5, 0.5)
    β = -0.4
    numeric = modify(base, _ -> β; link = identity)  # numeric, clamped
    closed = modify(base, β; link = identity)         # exact closed form

    for x in (2.0, 10.0, 50.0, 200.0, 500.0)
        @test logccdf(numeric, x)≈logccdf(closed, x) rtol=1e-4 atol=1e-6
        @test cdf(numeric, x)≈cdf(closed, x) rtol=1e-4 atol=1e-8
    end
    # The plateau (defective mass) is well below one, not collapsed to zero.
    @test 0.0 < cdf(numeric, 1.0e4) < 1.0
end

@testitem "QuadGK numeric path: defective law quantile throws" begin
    using Distributions
    using QuadGK

    d = modify(LogNormal(1.5, 0.5), _ -> -0.4; link = identity)
    total = cdf(d, 1.0e4)
    @test total < 1
    # A quantile above the total mass is undefined and must throw, not return
    # Inf.
    @test_throws ArgumentError quantile(d, min(total + 0.3, 0.999))
    # A quantile within the mass still resolves.
    q = quantile(d, total / 2)
    @test cdf(d, q) ≈ total / 2 rtol=1e-3
end

@testitem "QuadGK numeric path: base with nonzero support minimum" begin
    using Distributions
    using QuadGK

    base = Uniform(1.0, 3.0)              # support minimum m = 1
    numeric = modify(base, _ -> 0.5; link = log)
    closed = modify(base, 0.5; link = log)
    for x in (1.5, 2.0, 2.5)
        @test logccdf(numeric, x) ≈ logccdf(closed, x) rtol=1e-6
        @test logpdf(numeric, x) ≈ logpdf(closed, x) rtol=1e-6
    end
end

@testitem "QuadGK numeric path: time-varying effect is a proper law" begin
    using Distributions
    using QuadGK

    base = Gamma(3.0, 1.0)
    d = modify(base, t -> 0.15 * t; link = log)    # ramping proportional hazard

    # A proper density integrates to one, and the cdf is monotone in [0, 1].
    total, _ = quadgk(x -> pdf(d, x), 0.0, 60.0)
    @test total ≈ 1.0 rtol=1e-4

    xs = 0.5:0.5:8.0
    cdfs = cdf.(Ref(d), xs)
    @test all(0 .<= cdfs .<= 1)
    @test issorted(cdfs)
    @test all(ccdf(d, x) ≈ 1 - cdf(d, x) for x in xs)

    # quantile inverts the cdf; a uniform draw round-trips.
    q = quantile(d, 0.7)
    @test cdf(d, q) ≈ 0.7 rtol=1e-4
end

@testitem "QuadGK numeric path: ForwardDiff through the quadrature" begin
    using Distributions
    using QuadGK
    using ForwardDiff

    base = Gamma(2.0, 1.5)
    x = 2.0

    # d/dβ of the numeric proportional-hazard logccdf must match the closed
    # form: logccdf*(x) = exp(β) logccdf(base, x), so the derivative is
    # exp(β) logccdf(base, x).
    g(β) = logccdf(modify(base, _ -> β; link = log), x)
    β0 = 0.3
    @test ForwardDiff.derivative(g, β0) ≈
          exp(β0) * logccdf(base, x) rtol=1e-5

    # Differentiating with respect to a BASE parameter through the quadrature
    # must match the same derivative through the closed form.
    gnum(μ) = logccdf(modify(LogNormal(μ, 0.5), _ -> 0.3; link = log), x)
    gclosed(μ) = logccdf(modify(LogNormal(μ, 0.5), 0.3; link = log), x)
    @test ForwardDiff.derivative(gnum, 0.4) ≈
          ForwardDiff.derivative(gclosed, 0.4) rtol=1e-5
end
