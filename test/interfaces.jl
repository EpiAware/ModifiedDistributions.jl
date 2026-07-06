# Interface conformance over the modifier fixture registry.
#
# Every public modifier type appears in `modifier_fixtures()` at least once
# (each constructor form gets its own fixture), and the completeness meta-test
# below fails if a concrete `AbstractModifiedDistribution` subtype ships
# without joining the registry. Mirrors the fixture-registry pattern of
# CensoredDistributions' `test/interfaces.jl`.

@testsnippet ModifierFixtures begin
    using Distributions

    # One fixture per public constructor form: `d` the modifier and `x` an
    # in-support point to score. New modifiers must add a fixture here (the
    # completeness meta-test enforces it).
    function modifier_fixtures()
        base = LogNormal(1.5, 0.5)
        return (
            (; name = "affine",
                d = affine(base; scale = 2.0, shift = 1.0), x = 5.0),
            (; name = "weight (constructor weight)",
                d = weight(base, 2.5), x = 2.0),
            (; name = "weight (missing weight)",
                d = weight(base), x = 2.0),
            (; name = "thin", d = thin(base, 0.3), x = 2.0),
            (; name = "cumulative", d = cumulative(base), x = 2.0),
            (; name = "map_series (generic op)",
                d = ModifiedDistributions.map_series(base, s -> 0.5 .* s),
                x = 2.0),
            (; name = "modify (log link)",
                d = modify(base, -log(2.0); link = log), x = 2.0),
            (; name = "modify (identity link)",
                d = modify(base, 0.2; link = identity), x = 2.0)
        )
    end
end

@testitem "modified interface conformance" setup=[ModifierFixtures] begin
    using ModifiedDistributions.TestUtils: test_modified_interface

    # Run the one leaf-modifier checklist over the full fixture registry.
    # Each fixture's `@testset` records its own asserts.
    for fix in modifier_fixtures()
        test_modified_interface(fix.d; name = fix.name, x = fix.x)
    end
end

@testitem "fixture registry completeness" setup=[ModifierFixtures] begin
    # Completeness meta-test: walk the package's public names, collect the
    # concrete subtypes of `AbstractModifiedDistribution`, and assert each has
    # at least one fixture. A new public modifier added without a fixture in
    # `modifier_fixtures()` fails here.
    fixtures = modifier_fixtures()
    modifier_types = Any[]
    for n in names(ModifiedDistributions)
        isdefined(ModifiedDistributions, n) || continue
        T = getproperty(ModifiedDistributions, n)
        T isa Type || continue
        isabstracttype(T) && continue
        if T <: ModifiedDistributions.AbstractModifiedDistribution
            push!(modifier_types, T)
        end
    end
    # The four built-in wrappers must all be found on the public surface.
    @test length(modifier_types) >= 4
    for T in modifier_types
        @test any(fix -> fix.d isa T, fixtures)
    end
end

@testitem "roundtrip injection hook" begin
    using Distributions
    using ModifiedDistributions.TestUtils: test_modified_interface

    # The `roundtrip` keyword injects a `(free, rewrap)` pair, standing in
    # for ComposedDistributions' `free_leaf` / `rewrap_leaf` verbs. A weight
    # leaf frees to its inner distribution and rewraps with the same weight.
    d = weight(LogNormal(1.5, 0.5), 3.0)
    free = get_dist
    rewrap = (wd, inner) -> weight(inner, wd.weight)
    ts = test_modified_interface(d; x = 2.0, roundtrip = (free, rewrap))
    @test ts isa Test.AbstractTestSet
end
