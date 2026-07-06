@testitem "Composed extension: modifiers collapse a Sequential chain" begin
    using Distributions
    using ComposedDistributions

    # The extension loads once ComposedDistributions is present.
    @test Base.get_extension(ModifiedDistributions,
        :ModifiedDistributionsComposedDistributionsExt) !== nothing

    # A composed chain observes one scalar (the convolved total of its steps);
    # a modifier applied to the chain modifies that observed quantity. (A flat
    # NamedTuple lowers to Parallel, so build the chain with `sequential`.)
    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    obs = observed_distribution(seq)
    x = 3.0

    # weight: the observed total carries the likelihood weight.
    wd = weight(seq, 5.0)
    @test wd isa ModifiedDistributions.Weighted
    @test logpdf(wd, x) ≈ 5.0 * logpdf(obs, x)
    @test pdf(wd, x) ≈ pdf(obs, x)
    @test get_dist(wd) isa typeof(obs)

    # Missing-weight constructor: weight supplied at observation time.
    wm = weight(seq)
    @test ismissing(wm.weight)
    @test logpdf(wm, (value = x, weight = 2.0)) ≈ 2.0 * logpdf(obs, x)

    # Per-observation weights build a Product over the observed total.
    wv = weight(seq, [2.0, 3.0])
    @test wv isa Product
    @test logpdf(wv, [x, x + 0.5]) ≈
          2.0 * logpdf(obs, x) + 3.0 * logpdf(obs, x + 0.5)

    # nothing threads through unchanged, mirroring the univariate forms.
    @test weight(seq, nothing) === seq
    @test thin(seq, nothing) === seq
end

@testitem "Composed extension: forward transforms and affine on a chain" begin
    using Distributions
    using ComposedDistributions

    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    obs = observed_distribution(seq)
    x = 3.0

    # thin / cumulative / series_transform stay transparent to logpdf of the observed
    # total and carry their ops for a downstream series.
    th = thin(seq, 0.3)
    @test th isa ModifiedDistributions.Transformed
    @test th.op isa ModifiedDistributions.ThinOp
    @test logpdf(th, x) ≈ logpdf(obs, x)
    @test_throws ArgumentError thin(seq, 1.5)

    cu = cumulative(seq)
    @test cu.op isa ModifiedDistributions.CumulativeOp
    @test logpdf(cu, x) ≈ logpdf(obs, x)

    tr = series_transform(seq, s -> 2.0 .* s)
    @test tr isa ModifiedDistributions.Transformed
    @test logpdf(tr, x) ≈ logpdf(obs, x)

    # affine: change of variables on the observed total.
    ad = affine(seq; scale = 2.0, shift = 1.0)
    @test ad isa ModifiedDistributions.Affine
    @test logpdf(ad, 2.0 * x + 1.0) ≈ logpdf(obs, x) - log(2.0)
    @test mean(ad) ≈ 2.0 * mean(obs) + 1.0
end

@testitem "Composed extension: univariate composers need no methods" begin
    using Distributions
    using ComposedDistributions

    # A one_of node is already univariate, so the modifier constructors accept
    # it directly (no extension methods involved) and modify it in place.
    r = resolve(:death => (Gamma(1.5, 1.0), 0.3), :disch => Gamma(2.0, 1.5))
    x = 2.0

    wd = weight(r, 4.0)
    @test wd isa ModifiedDistributions.Weighted
    @test get_dist(wd) === r
    @test logpdf(wd, x) ≈ 4.0 * logpdf(r, x)

    th = thin(r, 0.5)
    @test get_dist(th) === r
    @test logpdf(th, x) == logpdf(r, x)
end

@testitem "Composed extension: modify collapses a Sequential chain" begin
    using Distributions
    using ComposedDistributions

    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    obs = observed_distribution(seq)
    x = 3.0

    # modify: the observed total carries the hazard modification.
    md = modify(seq, -log(2.0))
    @test md isa ModifiedDistributions.Modified
    @test logpdf(md, x) ≈ logpdf(modify(obs, -log(2.0)), x)
    @test ccdf(md, x) ≈ ccdf(modify(obs, -log(2.0)), x)

    # The link keyword threads through to the collapsed form.
    mi = modify(seq, 0.2; link = identity)
    @test mi isa ModifiedDistributions.Modified
    @test logpdf(mi, x) ≈ logpdf(modify(obs, 0.2; link = identity), x)

    # nothing threads through unchanged, mirroring weight/thin.
    @test modify(seq, nothing) === seq
end

@testitem "Composed extension: batched scoring through a modified chain" begin
    using Distributions
    using ComposedDistributions

    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    xs = [2.0, 3.0, 4.5]

    # A vector observation on a modified chain scores per point, delegating
    # the whole batch to the collapsed observed distribution in one call, and
    # matches the scalar map within quadrature tolerance.
    ad = affine(seq; scale = 2.0, shift = 1.0)
    batched = logpdf(ad, xs)
    @test batched isa AbstractVector
    @test length(batched) == 3
    @test isapprox(batched, map(x -> logpdf(ad, x), xs); rtol = 1e-6)
end
