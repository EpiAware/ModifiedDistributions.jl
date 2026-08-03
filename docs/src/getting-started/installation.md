# [Installation](@id installation)

`ModifiedDistributions` is available in the Julia General Registry.
Install it by running the following in the Julia REPL:

```julia
using Pkg; Pkg.add("ModifiedDistributions")
```

Load it alongside Distributions.jl:

```julia
using ModifiedDistributions, Distributions
```

The composed-chain and convolution tutorials additionally use
[ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl) and
[ConvolvedDistributions.jl](https://github.com/EpiAware/ConvolvedDistributions.jl),
both of which are in the General Registry:

```julia
using Pkg
Pkg.add("ConvolvedDistributions")
Pkg.add("ComposedDistributions")
```

Loading either alongside this package activates the matching extension, so
the modifier verbs work across a composed chain or a convolved series with no
further setup.

The [Getting started](@ref getting-started) overview tours each modifier with worked examples.
