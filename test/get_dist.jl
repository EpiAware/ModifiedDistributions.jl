@testitem "get_dist fallback for base distributions" begin
    using Distributions

    # Unwrapped distributions return themselves.
    for d in (Normal(0, 1), Exponential(2.0), Gamma(2.0, 3.0),
        LogNormal(1.5, 0.75), Uniform(0, 1), Poisson(5), Binomial(10, 0.3))
        @test get_dist(d) === d
        @test get_dist_recursive(d) === d
    end

    # Type stability of the fallback.
    d = Normal(0, 1)
    @inferred get_dist(d)
    @test typeof(get_dist(d)) === typeof(d)
end

@testitem "get_dist unwraps the modifier wrappers" begin
    using Distributions

    base = LogNormal(1.5, 0.75)

    # Affine
    ad = affine(base; scale = 2.0, shift = 1.0)
    @test get_dist(ad) === base
    @inferred get_dist(ad)

    # Weighted
    wd = weight(base, 2.5)
    @test get_dist(wd) === base
    @inferred get_dist(wd)

    # Transformed (thin / cumulative)
    td = thin(base, 0.3)
    @test get_dist(td) === base
    cd = cumulative(base)
    @test get_dist(cd) === base

    # Extracted distribution keeps its parameters and interface.
    @test params(get_dist(wd)) == params(base)
    @test mean(get_dist(ad)) == mean(base)
    @test pdf(get_dist(td), 2.0) == pdf(base, 2.0)
end

@testitem "get_dist does not unwrap foreign wrappers" begin
    using Distributions

    # No method for Truncated is owned here, so it returns unchanged.
    base = Normal(0, 1)
    td = truncated(base, -2, 2)
    @test get_dist(td) === td
    @test get_dist_recursive(td) === td
end

@testitem "get_dist_recursive with nested modifier wrappers" begin
    using Distributions

    base = Normal(5, 2)

    # Weighted{Affine{Normal}}
    wd = weight(affine(base; scale = 2.0, shift = 1.0), 3.0)
    @test get_dist_recursive(wd) === base
    @test get_dist_recursive(wd) isa Normal

    # Affine peels first, then the recursion reaches the base.
    @test get_dist(wd) isa ModifiedDistributions.Affine
    @test get_dist(get_dist(wd)) === base

    # thin{Weighted{LogNormal}}
    base_ln = LogNormal(1.0, 0.5)
    nested = thin(weight(base_ln, 1.5), 0.4)
    @test get_dist_recursive(nested) === base_ln

    # Single wrapper matches get_dist.
    single = weight(Gamma(2.0, 3.0), 2.5)
    @test get_dist_recursive(single) === get_dist(single)

    # Repeated calls are consistent.
    @test get_dist_recursive(wd) === get_dist_recursive(wd)
end

@testitem "get_dist_recursive type consistency" begin
    using Distributions

    base = Normal(0, 1)
    wd = weight(base, 2.0)
    @test typeof(get_dist_recursive(wd)) === typeof(base)

    nested = weight(affine(base; scale = 2.0), 1.5)
    @test typeof(get_dist_recursive(nested)) === typeof(base)
end

@testitem "recursive unwrap maps over product components" begin
    using Distributions

    wds = weight(Normal(2.0, 1.0), [2.0, 3.0])
    unwrapped = get_dist_recursive(wds)
    (components = unwrapped,)
    @test unwrapped isa AbstractVector
    @test all(c -> c isa Normal, unwrapped)
end
