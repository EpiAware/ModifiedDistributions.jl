@testitem "get_scale / get_shift read the affine pair" begin
    using ModifiedDistributions, Distributions

    d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
    @test ModifiedDistributions.get_scale(d) == 2.0
    @test ModifiedDistributions.get_shift(d) == 1.0
    @inferred ModifiedDistributions.get_scale(d)
    @inferred ModifiedDistributions.get_shift(d)

    # Defaults thread through the constructor.
    d0 = affine(Normal(0.0, 1.0))
    @test ModifiedDistributions.get_scale(d0) == 1.0
    @test ModifiedDistributions.get_shift(d0) == 0.0
end

@testitem "get_weight reads the likelihood weight" begin
    using ModifiedDistributions, Distributions

    d = weight(Normal(2.0, 1.0), 10.0)
    @test ModifiedDistributions.get_weight(d) == 10.0
    @inferred ModifiedDistributions.get_weight(d)

    # A missing constructor weight surfaces as `missing`.
    dm = weight(Normal(2.0, 1.0))
    @test ismissing(ModifiedDistributions.get_weight(dm))
end

@testitem "get_effect / get_link read the hazard modification" begin
    using ModifiedDistributions, Distributions

    d = modify(LogNormal(1.5, 0.5), -log(2.0); link = log)
    @test ModifiedDistributions.get_effect(d) == -log(2.0)
    @test ModifiedDistributions.get_link(d) === ModifiedDistributions.LogLink
    @inferred ModifiedDistributions.get_effect(d)
    @inferred ModifiedDistributions.get_link(d)

    di = modify(LogNormal(1.5, 0.5), 0.2; link = identity)
    @test ModifiedDistributions.get_effect(di) == 0.2
    @test ModifiedDistributions.get_link(di) ===
          ModifiedDistributions.IdentityLink
end

@testitem "get_op / get_factor read the forward op" begin
    using ModifiedDistributions, Distributions

    td = thin(LogNormal(1.5, 0.5), 0.3)
    op = ModifiedDistributions.get_op(td)
    @test op isa ModifiedDistributions.ThinOp
    @test ModifiedDistributions.get_factor(op) == 0.3
    @inferred ModifiedDistributions.get_op(td)
    @inferred ModifiedDistributions.get_factor(op)

    cd = cumulative(Gamma(2.0, 1.0))
    @test ModifiedDistributions.get_op(cd) isa ModifiedDistributions.CumulativeOp

    # The generic escape hatch carries its callable op verbatim.
    f = s -> 2.0 .* s
    gd = series_transform(Gamma(2.0, 1.0), f)
    @test ModifiedDistributions.get_op(gd) === f
end

@testitem "accessors round-trip the modifier data" begin
    using ModifiedDistributions, Distributions

    # Reconstructing a leaf from its accessors reproduces the original, the
    # downstream rebuild pattern the accessors exist to support.
    base = LogNormal(1.5, 0.5)

    a = affine(base; scale = 2.0, shift = 1.0)
    a2 = affine(get_dist(a); scale = ModifiedDistributions.get_scale(a),
        shift = ModifiedDistributions.get_shift(a))
    @test logpdf(a2, 3.0) == logpdf(a, 3.0)

    m = modify(base, 0.4; link = identity)
    m2 = modify(get_dist(m), ModifiedDistributions.get_effect(m);
        link = ModifiedDistributions.get_link(m))
    @test logpdf(m2, 3.0) == logpdf(m, 3.0)
end
