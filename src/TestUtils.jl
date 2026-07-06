# TestUtils: a public interface-conformance harness for modifier leaves.
#
# `ModifiedDistributions.TestUtils.test_modified_interface(d)` runs one
# interface checklist over a modifier leaf, so a downstream author writing a
# new modifier can drop it into their own `@testset` to verify conformance.
# The package itself runs it over the fixture registry in
# `test/interfaces.jl`.
#
# The harness is deliberately dependency-light: it uses `Test` (a stdlib) and
# the package's own public surface. It returns the `@testset` result so a
# caller can assert on it.
#
# Deviation from CensoredDistributions' integration/composed-stack harness:
# the `free_leaf` / `rewrap_leaf` round-trip check is not built in, because
# those verbs are owned by ComposedDistributions.jl and live in its package
# extension. The optional `roundtrip` keyword lets CensoredDistributions /
# ComposedDistributions inject the round-trip check when they are loaded.

"""
    ModifiedDistributions.TestUtils

Public interface-conformance harness for the modifier leaves.

`TestUtils.test_modified_interface(d)` runs one interface checklist over a
modifier leaf, so a downstream author writing a new
`AbstractModifiedDistribution` subtype can drop it into their own `@testset`
to verify conformance against the package's leaf contract.
`test_modified_interface` is exported from this submodule.

# Examples
```@example
using ModifiedDistributions, Distributions
using ModifiedDistributions.TestUtils: test_modified_interface

test_modified_interface(affine(LogNormal(1.5, 0.5); scale = 2.0); x = 3.0)
```
"""
module TestUtils

using Test: @testset, @test
using Distributions: Distributions, logpdf, params, insupport

using ..ModifiedDistributions: AbstractModifiedDistribution, get_dist

export test_modified_interface

@doc """

Assert a modified distribution satisfies the `AbstractModifiedDistribution`
contract.

`test_modified_interface(d)` checks `d` subtypes
`AbstractModifiedDistribution` and exposes the leaf-modifier interface:
`get_dist` returns the inner
`Distribution` (not `d` itself), `params` is a `Tuple`, `show` is non-empty,
`logpdf` at the in-support point `x` is a `Real`, and `insupport` /
`minimum` / `maximum` do not throw. Returns the `@testset` object.

The `free_leaf` / `rewrap_leaf` round-trip is not checked here: those verbs
are owned by ComposedDistributions.jl and live in its package extension. Pass
`roundtrip = (free_leaf, rewrap_leaf)` to inject the round-trip check
(`rewrap(d, free(d))` must rebuild an equivalent leaf) when a package
providing them is loaded.

# Arguments
- `d`: the modifier leaf to check.

# Keyword Arguments
- `name`: the `@testset` label (defaults to the type name of `d`).
- `x`: an in-support point at which to score `logpdf` (default `1.0`).
- `roundtrip`: `nothing` (default) or a `(free, rewrap)` function pair to
  run the leaf round-trip check.
""" function test_modified_interface end

function test_modified_interface(
        d; name::AbstractString = string(nameof(typeof(d))), x::Real = 1.0,
        roundtrip::Union{Nothing, Tuple} = nothing)
    return @testset "modified interface: $name" begin
        @test d isa AbstractModifiedDistribution
        # Inner accessor: the wrapped base, never the wrapper itself.
        inner = get_dist(d)
        @test inner isa Distributions.Distribution
        @test inner !== d
        # The universal distribution interface.
        @test params(d) isa Tuple
        @test !isempty(sprint(show, d))
        @test logpdf(d, x) isa Real
        # Support machinery does not throw.
        @test insupport(d, x) isa Bool
        @test minimum(d) <= maximum(d)
        # Injected leaf round-trip (ComposedDistributions-owned verbs).
        if roundtrip !== nothing
            free, rewrap = roundtrip
            leaf = free(d)
            @test leaf isa Distributions.Distribution
            rebuilt = rewrap(d, leaf)
            @test rebuilt isa AbstractModifiedDistribution
            @test logpdf(rebuilt, x) ≈ logpdf(d, x)
        end
    end
end

end # module TestUtils
