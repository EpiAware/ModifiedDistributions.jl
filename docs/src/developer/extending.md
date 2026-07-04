# [Writing a new modifier](@id extending)

A modifier is a wrapper type around exactly one univariate distribution that changes one behaviour and delegates the rest.
This page describes the pattern the built-in modifiers follow, using them as worked examples.

## The shape of a modifier

1. **A wrapper struct** subtyping `UnivariateDistribution`, holding the inner distribution plus the modifier's parameters.
   Validate parameters in an inner constructor — see `Affine`'s positive-scale check in [`src/Affine.jl`](https://github.com/EpiAware/ModifiedDistributions.jl/blob/main/src/Affine.jl).
2. **A lowercase constructor verb** (`affine`, `weight`, `thin`, `modify`) as the user-facing entry point.
   If an "absent" parameter is meaningful, add a `::Nothing` passthrough method returning the distribution unchanged, as `weight(d, nothing)` and `thin(d, nothing)` do.
3. **A `get_dist` method** exposing the inner distribution, one line:

   ```julia
   get_dist(d::MyWrapper) = d.dist
   ```

   This joins your wrapper to the unwrap protocol, so `get_dist_recursive` and downstream tooling work without knowing your type.

## Delegation

Most methods should delegate to the inner distribution.
For bulk delegation, `Transformed` uses an `@eval` loop worth copying:

```julia
for f in (:minimum, :maximum, :mean, :var, :std, :mode, :median,
    :skewness, :kurtosis, :entropy)
    @eval Distributions.$f(d::MyWrapper) = Distributions.$f(d.dist)
end
```

Then override only the methods your modifier actually changes (`logpdf` for a weight, the full change-of-variables set for an affine map).
Remember `Base.eltype` — without it, batch sampling `rand(rng, d, n)` falls back to `Vector{Any}` and errors.

## Forward-transform ops

A new forward op (alongside `ThinOp`/`CumulativeOp`) does not need a new wrapper type.
Implement `_apply_op(op, series)` and, if the op has a displayable parameter, `_op_params(op)`; then construct it with `transform(d, op)`.

## AD friendliness

Keep branches data-driven (on types and object identity), never on sampled parameter values, so gradients survive all backends.
Add a gradient scenario for your modifier to `test/ADFixtures/src/ADFixtures.jl`, mirroring the existing entries — the AD CI sweeps it across ForwardDiff, ReverseDiff, Enzyme and Mooncake automatically.

## Checklist

- [ ] Struct + validated inner constructor
- [ ] Constructor verb (+ `Nothing` passthrough if applicable)
- [ ] `get_dist` method
- [ ] Delegations + overridden behaviour
- [ ] `Base.eltype`
- [ ] Docstrings in the house style (`@doc` blocks, `# Examples`, `# See also`)
- [ ] Export the verb; mark the type `public` in `src/public.jl`
- [ ] Tests in `test/MyWrapper.jl` + an ADFixtures scenario
