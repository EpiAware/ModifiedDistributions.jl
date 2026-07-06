# # [A modifier pipeline](@id modifier-pipeline)
#
# ## Introduction
#
# The modifiers in this package each wrap one distribution and change one
# behaviour, and they stack.
# This tutorial walks a delay distribution through the four verbs in turn:
# an affine reparameterisation, the forward-series transforms
# [`thin`](@ref) and [`cumulative`](@ref), the generic [`transform`](@ref)
# escape hatch, and a hazard [`modify`](@ref) with both supported links.
# It closes with [`get_dist`](@ref) / [`get_dist_recursive`](@ref) unwrapping a
# nested stack.
#
# ### What are we going to do in this exercise
#
# 1. Reparameterise a distribution with [`affine`](@ref).
# 2. Attach [`thin`](@ref) and [`cumulative`](@ref) to a daily-count series and
#    check they leave the distribution itself untouched.
# 3. Use the generic [`transform`](@ref) for an arbitrary series map.
# 4. Modify a hazard through the `log` and `identity` links.
# 5. Peel a nested stack back to its base distribution.
#
# ### What might I need to know before starting
#
# This tutorial builds on the [Getting started](@ref getting-started) overview
# and uses only Distributions.jl and ModifiedDistributions.jl.

# ## Packages used

using ModifiedDistributions, Distributions

# ## Affine reparameterisation
#
# [`affine`](@ref) gives the exact change-of-variables distribution of
# `Y = scale * X + shift`.
# It reparameterises any univariate distribution uniformly, including families
# where Distributions.jl has no closed-form affine constructor.

base = LogNormal(1.5, 0.5)
scaled = affine(base; scale = 2.0, shift = 1.0)
(mean(scaled), 2.0 * mean(base) + 1.0)

# The full distribution interface follows the transform, including a
# tail-accurate `ccdf` computed by change of variables rather than `1 - cdf`.

x = 6.0
ccdf(scaled, x) ≈ ccdf(base, (x - 1.0) / 2.0)

# ## Forward-series transforms on a daily-count series
#
# [`thin`](@ref) and [`cumulative`](@ref) do not change the distribution.
# They carry a deterministic operation intended for a count series that a
# downstream convolution layer produces, for example an expected incidence
# curve.
# The distribution methods stay transparent: `logpdf`, `rand` and the rest
# delegate straight to the base.

delay = Gamma(2.0, 1.0)
td = thin(delay, 0.3)          # ascertain 30% of the series
logpdf(td, 2.0) == logpdf(delay, 2.0)

# Sampling is likewise unchanged, because the forward op never touches the
# distribution.

using Random
(rand(Random.MersenneTwister(1), td), rand(Random.MersenneTwister(1), delay))

# The op materialises only when a series is passed through it.
# The internal forward seam a convolution layer calls peels the ops off the
# wrapper and applies them in order; here we drive it directly on a synthetic
# daily count to show what the op does.

daily = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]
_, thin_ops = ModifiedDistributions._peel_forward(td)
thinned = ModifiedDistributions._apply_forward_ops(daily, thin_ops)

# Thinning scales every day by the ascertainment probability.

thinned ≈ 0.3 .* daily

# [`cumulative`](@ref) accumulates the series into a running total, turning a
# daily count into a cumulative one.

cd = cumulative(delay)
_, cum_ops = ModifiedDistributions._peel_forward(cd)
ModifiedDistributions._apply_forward_ops(daily, cum_ops) == cumsum(daily)

# ## The generic transform escape hatch
#
# [`transform`](@ref) accepts any callable `series -> series`, for the cases
# `thin` and `cumulative` do not cover.
# It stays transparent to the distribution in exactly the same way.

shift_op = transform(delay, s -> s .+ 1.0)
_, shift_ops = ModifiedDistributions._peel_forward(shift_op)
(logpdf(shift_op, 2.0) == logpdf(delay, 2.0),
    ModifiedDistributions._apply_forward_ops(daily, shift_ops) == daily .+ 1.0)

# ## Hazard modification through a link
#
# [`modify`](@ref) changes a continuous distribution's hazard through a link.
# The default `log` link gives proportional hazards: with effect `β` and
# `θ = exp(β)`, the survival function is raised to the power `θ`.

hazard_base = Weibull(1.5, 2.0)
β = 0.5
prop = modify(hazard_base, β; link = log)
ccdf(prop, 1.0) ≈ ccdf(hazard_base, 1.0)^exp(β)

# The identity link gives additive hazards for a non-negative effect.
# A constant extra hazard `β` accrues from the support minimum, so the modified
# survival is the base survival times `exp(-β (t - m))`.

add = modify(hazard_base, 0.4; link = identity)
m = minimum(hazard_base)
t = 1.0
ccdf(add, t) ≈ ccdf(hazard_base, t) * exp(-0.4 * (t - m))

# Both paths are closed form, so the modified distribution samples and
# integrates like any other.

(mean(rand(prop, 10_000)), cdf(add, 2.0))

# ## Unwrapping a nested stack
#
# The modifiers nest, and the [`get_dist`](@ref) protocol peels them back off.
# `get_dist` removes one layer; [`get_dist_recursive`](@ref) keeps going until
# it reaches a distribution with no more wrappers.

stack = weight(thin(affine(base; scale = 2.0), 0.3), 5.0)
get_dist(stack)          # one layer off: the Transformed wrapper

# Recursive unwrapping returns the base distribution at the bottom of the stack.

get_dist_recursive(stack) === base

# ## Summary
#
# - [`affine`](@ref) reparameterises any univariate distribution by exact change
#   of variables.
# - [`thin`](@ref), [`cumulative`](@ref) and [`transform`](@ref) stay
#   transparent to every distribution method and act only on a downstream
#   series.
# - [`modify`](@ref) scales a survival curve (`log` link) or adds a constant
#   hazard (`identity` link) in closed form.
# - [`get_dist`](@ref) / [`get_dist_recursive`](@ref) recover the wrapped
#   distribution from any depth of nesting.
