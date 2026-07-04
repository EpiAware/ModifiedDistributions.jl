# Public API declarations for Julia 1.11+.
# The modifier wrapper types are public but not exported; users build them via
# the exported constructors (`affine`, `weight`, `thin`/`cumulative`,
# `modify`). The hazard-link types and `hazard_link` are public for link
# construction and dispatch.
public Affine
public Weighted
public Transformed
public Modified
public HazardLink
public LogLink
public IdentityLink
public LogitLink
public hazard_link
