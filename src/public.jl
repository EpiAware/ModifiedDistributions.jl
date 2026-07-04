# Public API declarations for Julia 1.11+.
# The modifier wrapper types are public but not exported; users build them via
# the exported constructors (`affine`, `weight`, `thin`/`cumulative`).
public Affine
public Weighted
public Transformed
