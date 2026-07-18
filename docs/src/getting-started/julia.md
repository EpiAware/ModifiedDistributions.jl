# [Getting started with Julia](@id julia)

For installing Julia, setting up an editor, working with Julia environments, a
productive REPL, and common setup problems, see
[Using Julia](https://epiaware.org/using-julia) on the EpiAware site.
That guide is written once for the whole ecosystem, so it is not repeated
here.

This page covers only what is specific to ModifiedDistributions.jl.

## Working with ModifiedDistributions.jl

### Installing and using the package

```julia-repl
julia> ]
(@v1.11) pkg> add ModifiedDistributions
julia> using ModifiedDistributions

# Start using the package
julia> using Distributions
julia> affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
julia> weight(Normal(2.0, 1.0), 10.0)
```

### Working with the tutorials

The [tutorials](@ref getting-started) are Literate.jl scripts that can be run
directly in the REPL or as standalone Julia scripts.
See the [FAQ](@ref faq) for instructions on running them.

## Next steps

- Work through the [Getting started](@ref getting-started) overview to learn
  ModifiedDistributions.jl.
- Explore the [API documentation](@ref public-api).
- Ready to contribute? The [Contributing guide](@ref contributing) and
  [Developer FAQ](@ref developer-faq) cover the development workflow —
  running tests, switching environments, and troubleshooting — with the
  package's actual `task`-based commands, not the generic advice above.
