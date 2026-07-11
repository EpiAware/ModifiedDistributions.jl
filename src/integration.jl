# Pluggable numerical integration for the general-link `Modified` path.
#
# The numeric cumulative-hazard integral routes through `integrate`, which
# dispatches on the solver type. The package ships one lightweight default
# solver, `GaussLegendre`, implemented directly with `FastGaussQuadrature`
# nodes (no heavy dependency). This is the same AD-safe fixed-node solver
# ConvolvedDistributions and CensoredDistributions ship; carrying our own
# copy keeps the numeric `modify` path self-contained (a single small leaf
# dependency, `FastGaussQuadrature`) instead of a hard dependency on a sibling
# package, which stays a weak dependency.

@doc "

Fixed-node Gauss-Legendre quadrature solver (the package default for the
general-link [`modify`](@ref) numeric path).

Integrates with a Gauss-Legendre rule of `n` nodes, evaluated as a bare
weighted dot product (see [`gl_integrate`](@ref)). The constant control flow
and the accumulator type being seeded from the integrand make this the AD-safe
default: every supported AD backend can differentiate through it, unlike
adaptive schemes whose node count depends on integrand values.

The reference nodes and weights are built once at construction and held on the
solver, so the differentiated hot path is a pure weighted sum with no shared
mutable state.

`n = 64` is accurate to about `1e-13` on the smooth, density-weighted
integrands used here.

# See also
- [`gl_integrate`](@ref): the underlying quadrature reduction.
- [`integrate`](@ref): the pluggable entry point dispatching on a solver.
"
struct GaussLegendre{R}
    "Number of Gauss-Legendre nodes."
    n::Int
    "The reference Gauss-Legendre rule (nodes/weights on `[-1, 1]`)."
    rule::R
end

# Fixed Gauss-Legendre rule carrying its own reference nodes/weights on
# `[-1, 1]`. Holding the nodes/weights directly (and calling the integrand
# inline in `_gl_reduce`) lets Julia specialise on the integrand's concrete
# return type, so `Dual`s and AD tangents propagate and the result type is
# inferred.
struct _GL{N, W}
    nodes::N
    weights::W
end

_GL(n::Int) = _GL(FastGaussQuadrature.gausslegendre(n)...)

# Number of nodes for the default solver.
const _DEFAULT_NODES = 64

# Default rule, built once at load.
const _DEFAULT_GL = _GL(_DEFAULT_NODES)

# Resolve the reference rule for `n` nodes. The default (64) is a precomputed
# constant; any other `n` builds its nodes/weights fresh. There is no shared
# mutable cache: the rule is built at solver-construction time and then held on
# the solver, so the differentiated hot path never resolves a rule.
function _gl_rule(n::Int)
    n == _DEFAULT_NODES && return _DEFAULT_GL
    return _GL(n)
end

# Build the solver with its reference rule resolved once, here at construction,
# so `integrate` only reads `solver.rule`.
GaussLegendre(; n::Int = _DEFAULT_NODES) = GaussLegendre(n, _gl_rule(n))

# Show a solver as its type and node count, never its node and weight arrays,
# so a leaf holding a solver prints compactly.
function Base.show(io::IO, gl::GaussLegendre)
    print(io, "GaussLegendre(", gl.n, ")")
    return nothing
end

# Reduce an integrand `g` over the reference domain `[-1, 1]` against the
# `rule`. Seeding `acc` with `weights[1] * g(nodes[1])` fixes the accumulator's
# element type from the integrand itself, so a component `Dual` flows into the
# result rather than being forced to `Float64`.
@inline function _gl_reduce(g::G, rule::_GL) where {G}
    n, w = rule.nodes, rule.weights
    @inbounds acc = w[1] * g(n[1])
    @inbounds for i in 2:length(n)
        acc += w[i] * g(n[i])
    end
    return acc
end

@doc "

Integrate a scalar function `f` over `[lo, hi]` by fixed-node Gauss-Legendre
quadrature.

The reference domain `[-1, 1]` is mapped onto `[lo, hi]` inside the integrand
and the result reduced as a weighted dot product, so the accumulator's element
type is taken from the integrand and AD `Dual`s and tangents propagate. Returns
a typed zero when `hi <= lo`.

# Arguments
- `f`: the scalar integrand.
- `lo`: lower integration bound.
- `hi`: upper integration bound.
- `rule`: Gauss-Legendre rule to use (default: the 64-node rule).

# Examples
```@example
using ModifiedDistributions

# Integrate x^2 over [0, 1] (exact value 1/3).
ModifiedDistributions.gl_integrate(x -> x^2, 0.0, 1.0)
```

# See also
- [`GaussLegendre`](@ref): the default solver wrapping this rule.
- [`integrate`](@ref): the pluggable entry point.
"
function gl_integrate(f::F, lo, hi, rule::_GL = _DEFAULT_GL) where {F}
    hi <= lo && return zero(f(lo))
    h = (hi - lo) / 2
    m = (lo + hi) / 2
    return h * _gl_reduce(s -> f(m + h * s), rule)
end

@doc "

Integrate a scalar function `f` over `[lower, upper]` using `solver`.

The pluggable integration entry point: the numeric cumulative-hazard integral
calls `integrate`, dispatching on the solver type. The default
[`GaussLegendre`](@ref) solver routes to [`gl_integrate`](@ref).

# Arguments
- `solver`: the integration backend ([`GaussLegendre`](@ref) by default).
- `f`: the scalar integrand.
- `lower`: lower integration bound.
- `upper`: upper integration bound.

# Examples
```@example
using ModifiedDistributions

solver = ModifiedDistributions.GaussLegendre(; n = 64)
ModifiedDistributions.integrate(solver, x -> x^2, 0.0, 1.0)
```

# See also
- [`GaussLegendre`](@ref): the default solver.
- [`gl_integrate`](@ref): the default quadrature reduction.
"
function integrate(solver::GaussLegendre, f::F, lower, upper) where {F}
    return gl_integrate(f, lower, upper, solver.rule)
end
