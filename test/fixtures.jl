# Shared fixtures for the modifier test suite (#100 gap 7).
#
# `LogNormal(1.5, 0.5)` was reconstructed as a literal dozens of times across
# `test/Modified.jl`, `test/Weighted.jl`, `test/Affine.jl` and
# `test/interfaces.jl`. TestItemRunner collects every `@testsnippet` across
# the whole test tree into one package-wide registry keyed by name (see
# `run_testitem` in TestItemRunner.jl), so a snippet defined in this file is
# reachable from a `@testitem` in any other file via `setup=[BaseDistFixture]`
# — it need not live alongside the `@testitem`s that use it. Each testitem
# gets its own fresh module, so the snippet is (re-)included once per
# testitem run; there is no cross-testitem state to leak.
@testsnippet BaseDistFixture begin
    using Distributions

    # A fresh `LogNormal(1.5, 0.5)` each call. Returning a new value rather
    # than a shared constant keeps `===` identity checks against a second,
    # independently constructed instance meaningful (LogNormal is an isbits
    # struct, so `===` already compares by value, but a function reads as
    # "the fixture distribution" rather than "the one shared object").
    base_dist() = LogNormal(1.5, 0.5)
end
