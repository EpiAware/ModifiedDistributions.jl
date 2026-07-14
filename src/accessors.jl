# Public field accessors for the modifier payloads.
#
# `get_dist` (get_dist.jl) exposes the inner distribution every modifier
# wraps; these expose the modification data each leaf carries — the affine
# pair, the likelihood weight, the hazard effect/link, and the forward op. A
# downstream package (notably ComposedDistributions' modifier extension, which
# peels and rebuilds leaves) reads these instead of reaching struct fields, so
# a field rename here does not silently break it (#61). The `get_` prefix
# mirrors `get_dist`; the names avoid the constructor verbs (`affine`,
# `weight`, `thin`, `cumulative`, `modify`). Public but not exported, matching
# the wrapper types (see public.jl).

@doc "

Return the multiplicative scale of an [`Affine`](@ref) distribution.

The positive factor `scale` in `Y = scale * X + shift`.

# Arguments
- `d`: an [`Affine`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
get_scale(d)
```

# See also
- [`get_shift`](@ref): the additive shift.
"
get_scale(d::Affine) = d.scale

@doc "

Return the additive shift of an [`Affine`](@ref) distribution.

The offset `shift` in `Y = scale * X + shift`.

# Arguments
- `d`: an [`Affine`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = affine(LogNormal(1.5, 0.5); scale = 2.0, shift = 1.0)
get_shift(d)
```

# See also
- [`get_scale`](@ref): the multiplicative scale.
"
get_shift(d::Affine) = d.shift

@doc "

Return the likelihood weight of a [`Weighted`](@ref) distribution.

The weight the wrapper applies to `logpdf`. It is a real value, or `missing`
when the weight is supplied at observation time (see [`weight`](@ref)).

# Arguments
- `d`: a [`Weighted`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = weight(Normal(2.0, 1.0), 10.0)
get_weight(d)
```
"
get_weight(d::Weighted) = d.weight

@doc "

Return the hazard effect of a [`Modified`](@ref) distribution.

The scalar hazard modification on the link scale (see [`modify`](@ref)).

# Arguments
- `d`: a [`Modified`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = modify(LogNormal(1.5, 0.5), -log(2.0); link = log)
get_effect(d)
```

# See also
- [`get_link`](@ref): the hazard link.
"
get_effect(d::Modified) = d.effect

@doc "

Return the hazard link of a [`Modified`](@ref) distribution.

The [`HazardLink`](@ref) pairing the link `g` with its inverse (see
[`modify`](@ref)).

# Arguments
- `d`: a [`Modified`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = modify(LogNormal(1.5, 0.5), 0.2; link = identity)
get_link(d)
```

# See also
- [`get_effect`](@ref): the hazard effect.
"
get_link(d::Modified) = d.link

@doc "

Return the forward op of a [`Transformed`](@ref) distribution.

The op applied to a downstream count series — a [`ThinOp`](@ref), a
[`CumulativeOp`](@ref), or any callable `series -> series` (see
[`series_transform`](@ref)).

# Arguments
- `d`: a [`Transformed`](@ref) distribution.

# Examples
```@example
using ModifiedDistributions, Distributions

d = thin(LogNormal(1.5, 0.5), 0.3)
get_op(d)
```

# See also
- [`get_factor`](@ref): the factor of a [`ThinOp`](@ref).
"
get_op(d::Transformed) = d.op

@doc "

Return the multiplicative factor of a [`ThinOp`](@ref).

The fixed factor a [`thin`](@ref) op multiplies into a count series. Combine
with [`get_op`](@ref) to read a [`Transformed`](@ref)'s thinning factor without
reaching struct fields.

# Arguments
- `op`: a [`ThinOp`](@ref).

# Examples
```@example
using ModifiedDistributions, Distributions

d = thin(LogNormal(1.5, 0.5), 0.3)
get_factor(get_op(d))
```

# See also
- [`get_op`](@ref): the forward op of a [`Transformed`](@ref).
"
get_factor(op::ThinOp) = op.factor
