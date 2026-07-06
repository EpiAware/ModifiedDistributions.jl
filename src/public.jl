# Public API declarations for Julia 1.11+.
#
# Policy: the constructor verbs (`affine`, `weight`, `thin`/`cumulative`,
# `modify`) are exported; the wrapper types, the generic `map_series` verb and
# the link machinery below are public but not exported. This follows
# CensoredDistributions.jl's sparse-surface precedent
# (CensoredDistributions#739/#717): they are needed for dispatch, escape-hatch
# construction and documentation, not for the common cases, so they stay off
# the export list.

# The generic forward-series verb behind `thin`/`cumulative`: public but not
# exported. `thin`/`cumulative` cover the common cases; the bare `map_series`
# name is a rarely-needed escape hatch and stays off the export list so it does
# not collide when a package is loaded alongside packages that export a generic
# `transform`/`map` (e.g. DataFrames.jl). Reach it as
# `ModifiedDistributions.map_series` (see ModifiedDistributions#35).
public map_series

# The abstract modifier supertype (public but not exported): the dispatch
# surface downstream packages subtype and key methods off, matching the
# CensoredDistributions abstract hierarchy ahead of the planned migration
# (CensoredDistributions#343) so the swap stays mechanical. CD's `TimeChange`
# and `Shared` leaves stay upstream until that migration lands.
public AbstractModifiedDistribution

# The wrapper types, public so downstream code can dispatch on them
# (e.g. `get_dist(d::ModifiedDistributions.Affine)` extensions).
public Affine
public Weighted
public Transformed
public Modified
# The hazard-link machinery: `HazardLink` for dispatch, the named link
# constants for explicit `link =` arguments, and `hazard_link` to wrap a
# custom link pair. Qualified access (`ModifiedDistributions.LogLink`) is
# intended; the bare functions `log`/`identity` and the symbols
# `:log`/`:identity` cover the common cases without any qualification.
public HazardLink
public LogLink
public IdentityLink
public LogitLink
public hazard_link

# `TestUtils.test_modified_interface(d)` lets a downstream author verify a
# new modifier leaf against the interface contract.
public TestUtils
