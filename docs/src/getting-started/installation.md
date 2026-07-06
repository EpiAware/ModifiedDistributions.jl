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
[ConvolvedDistributions.jl](https://github.com/EpiAware/ConvolvedDistributions.jl).
Until those packages reach the General registry, install them by URL:

```julia
using Pkg
Pkg.add(url = "https://github.com/EpiAware/ConvolvedDistributions.jl")
Pkg.add(url = "https://github.com/EpiAware/ComposedDistributions.jl")
```

The [Getting started](@ref getting-started) overview tours each modifier with worked examples.
