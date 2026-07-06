# # [Modifiers across composed chains](@id composed-chains)
#
# ## Introduction
#
# [ComposedDistributions.jl](https://github.com/EpiAware/ComposedDistributions.jl)
# builds chains of distributions: a `Sequential` links a series of steps, and
# the whole chain observes one scalar quantity, the convolved total of its
# steps.
# When ComposedDistributions is loaded alongside ModifiedDistributions a package
# extension lets the modifier verbs apply to a chain directly.
# A unary modifier on a chain modifies that observed scalar: the chain collapses
# to its convolved total first, then the modifier wraps the resulting univariate
# distribution.
#
# ### What are we going to do in this exercise
#
# 1. Build a `Sequential` chain and collapse it with `observed_distribution`.
# 2. Apply [`weight`](@ref), [`affine`](@ref) and [`thin`](@ref) to the chain
#    and check the modifier lands on the chain's observed scalar.
# 3. Note the seam between this forward extension and the reverse seam upstream.
#
# ### What might I need to know before starting
#
# This tutorial builds on the [Getting started](@ref getting-started) overview
# and the [modifier pipeline](@ref modifier-pipeline) tutorial.
# It additionally needs ComposedDistributions.jl, which is pinned in the docs
# environment.

# ## Packages used
#
# Loading ComposedDistributions activates the extension; no extra import is
# needed to reach the modifier methods for a chain.

using ModifiedDistributions, Distributions
using ComposedDistributions

# ## A sequential chain and its observed scalar
#
# A `Sequential` chain of two delays represents, say, onset to admission and
# admission to death.
# Its realisation is a vector of step values, so a chain is a multivariate
# distribution.

chain = sequential(:onset_admit => Gamma(2.0, 1.0),
    :admit_death => LogNormal(0.5, 0.4))
event_names(chain)

# A downstream observation sees one quantity: the total elapsed time from origin
# to the terminal event, the convolution of the steps.
# `observed_distribution` lowers the chain to that univariate scalar (we show
# its type — printing the full object dumps its quadrature internals).

observed = observed_distribution(chain)
typeof(observed)

# ## A modifier lands on the observed scalar
#
# [`weight`](@ref) on the chain weights the observed total.
# The extension collapses the chain to `observed` and weights that, so the
# weighted `logpdf` matches weighting the observed scalar directly.

wd = weight(chain, 3.0)
logpdf(wd, 5.0) ≈ 3.0 * logpdf(observed, 5.0)

# Unwrapping the weighted chain with [`get_dist`](@ref) recovers a univariate
# distribution, the observed scalar, rather than the multivariate chain, and it
# behaves like the collapsed total.

unwrapped = get_dist(wd)
(unwrapped isa UnivariateDistribution,
    logpdf(unwrapped, 5.0) == logpdf(observed, 5.0))

# [`affine`](@ref) reparameterises the observed total the same way.

ad = affine(chain; scale = 2.0, shift = 1.0)
logpdf(ad, 10.0) ≈ logpdf(affine(observed; scale = 2.0, shift = 1.0), 10.0)

# [`thin`](@ref) attaches a forward-series op to the chain's observed total and
# stays transparent to `logpdf`, exactly as it does for a plain distribution.

td = thin(chain, 0.3)
logpdf(td, 5.0) == logpdf(observed, 5.0)

# The observation-time weight forms carry over too, since they are defined on
# the collapsed scalar.

wd_obs = weight(chain)
logpdf(wd_obs, (value = 5.0, weight = 3.0)) ≈ 3.0 * logpdf(observed, 5.0)

# ## The seam
#
# This extension is the forward direction: a modifier applied to a whole chain
# modifies the scalar the chain observes.
# The reverse direction, a modified leaf sitting inside a composed tree, is
# handled by a seam upstream in ComposedDistributions
# (`free_leaf` / `rewrap_leaf` and shared tags), so a chain built from already
# modified steps composes correctly there.
# The two seams meet at the boundary between the two packages: this package owns
# the modifier verbs, ComposedDistributions owns the chain types, and each
# extension lives with the package that depends on both, so neither commits type
# piracy.
# A `Parallel` has several independent endpoints and so no single observed
# scalar, so the modifier verbs are not defined for it.
#
# ## Summary
#
# - `observed_distribution` collapses a `Sequential` chain to the univariate
#   total it observes.
# - [`weight`](@ref), [`affine`](@ref) and [`thin`](@ref) on a chain modify that
#   observed scalar, matching the modifier applied to the collapsed
#   distribution.
# - The forward extension here pairs with a reverse seam upstream, so modifiers
#   compose with chains from either side.
