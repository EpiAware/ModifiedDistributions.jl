@doc "

Extract the underlying distribution from a wrapped distribution type.

This protocol provides a consistent interface for extracting the core
distribution from the modifier wrappers in this package (and any downstream
wrapper that adds a method). For unwrapped distributions, it returns the
distribution unchanged.

# Arguments
- `d`: A distribution or wrapped distribution.

# Returns
The underlying distribution. For base distributions, returns `d` unchanged.

# Examples
```@example
using ModifiedDistributions, Distributions

# Base distribution - returns unchanged
d1 = Normal(0, 1)
get_dist(d1)

# Affine-transformed distribution
d2 = affine(LogNormal(1.5, 0.5); scale = 2.0)
get_dist(d2)
```
"
function get_dist(d)
    return d
end

@doc "

Extract the underlying distribution from an affine-transformed distribution.

Returns the inner distribution before the affine transform was applied.
"
function get_dist(d::Affine)
    return d.dist
end

@doc "

Extract the underlying distribution from a weighted distribution.

Returns the base distribution before weighting was applied.
"
function get_dist(d::Weighted)
    return d.dist
end

@doc "

Extract the underlying distribution from a forward-transformed distribution.

Returns the inner distribution before the forward-transform op was attached.
"
function get_dist(d::Transformed)
    return d.dist
end

@doc "

Extract the underlying distribution from a hazard-modified distribution.

Returns the base distribution before the hazard modification was applied.
"
function get_dist(d::Modified)
    return d.dist
end

@doc "

Recursively extract the underlying distribution from nested wrapper types.

This function keeps applying `get_dist` until it reaches a distribution that
doesn't have a specialised method, meaning no further unwrapping is possible.

# Arguments
- `d`: A distribution or nested wrapped distribution.

# Returns
The deeply underlying distribution after all unwrapping is complete.

# Examples
```@example
using ModifiedDistributions, Distributions

# Single wrapper - same as get_dist
wd = weight(LogNormal(1.5, 0.75), 2.0)
get_dist_recursive(wd)

# Nested wrappers
nested = weight(affine(Normal(0, 1); scale = 2.0), 3.0)
get_dist_recursive(nested)

# Base distribution - returns unchanged
get_dist_recursive(Normal(0, 1))
```

# Note
For a wrapper that unwraps to a vector of components, this function applies
recursive extraction to each component, potentially returning mixed types of
underlying distributions.
"
function get_dist_recursive(d)
    next = get_dist(d)
    # If get_dist returns the same object, we've reached the end.
    if next === d
        return d
    end
    # For a vector of components, recursively unwrap each.
    if next isa AbstractVector
        return [get_dist_recursive(component) for component in next]
    end
    # Otherwise, recursively unwrap the next level.
    return get_dist_recursive(next)
end
