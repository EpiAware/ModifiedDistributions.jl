# # [Weighted likelihoods](@id weighted-likelihoods)
#
# ## Introduction
#
# [`weight`](@ref) scales the `logpdf` contribution of an observation without
# touching any other distribution method.
# The wrapped distribution still samples, integrates and reports summary
# statistics from the base; only the log-density is multiplied by the weight.
# This is the standard trick for aggregated or count data, where one recorded
# value stands in for many identical observations.
#
# ### What are we going to do in this exercise
#
# 1. Meet the three ways to supply a weight.
# 2. See why a zero or missing weight returns `-Inf` rather than `NaN`.
# 3. Compute a weighted log-likelihood surface for aggregated count data with
#    plain Julia, and read the grid maximum off it.
#
# ### What might I need to know before starting
#
# This tutorial builds on the [Getting started](@ref getting-started) overview.
# It uses only Distributions.jl and ModifiedDistributions.jl, so there is no
# fitting package to install.

# ## Packages used

using ModifiedDistributions, Distributions

# ## The three weight call shapes
#
# ### A fixed constructor weight
#
# `weight(d, w)` fixes the weight when the distribution is built.
# The weighted `logpdf` is exactly `w` times the base `logpdf`, so a value seen
# `w` times contributes as if it appeared `w` times in the sum.

base = Normal(2.0, 1.0)
wd = weight(base, 25)          # an observation recorded 25 times
logpdf(wd, 3.5) ≈ 25 * logpdf(base, 3.5)

# Everything other than `logpdf` delegates to the base distribution, so the
# weight leaves sampling, `cdf`, quantiles and moments untouched.

(mean(wd), cdf(wd, 3.5)) == (mean(base), cdf(base, 3.5))

# ### A weight supplied at observation time
#
# `weight(d)` stores a `missing` constructor weight, so the weight arrives with
# each observation as a `(value = x, weight = w)` named tuple.

wd_obs = weight(base)
logpdf(wd_obs, (value = 3.5, weight = 25)) ≈ 25 * logpdf(base, 3.5)

# When both a constructor weight and an observation weight are present they
# multiply.
# A distribution fixed at weight `2` and an observation weight `3` together
# contribute six times the base log-density.

logpdf(weight(base, 2), (value = 3.5, weight = 3)) ≈ 6 * logpdf(base, 3.5)

# ### Vectorised `Product` forms
#
# Passing a vector of weights builds a `Product` of weighted components, one per
# observation.
# Evaluating its `logpdf` on a vector of values sums the per-component weighted
# log-densities.

counts = [3, 1, 4]
values = [1.9, 2.1, 2.3]
wds = weight(base, counts)
logpdf(wds, values) ≈ sum(counts .* logpdf.(base, values))

# The observation-time form vectorises the same way.
# Building the `Product` with missing weights and supplying a
# `(values = ..., weights = ...)` named tuple applies the weights per element.

wds_obs = weight(fill(base, 3))
logpdf(wds_obs, (values = values, weights = counts)) ≈
sum(counts .* logpdf.(base, values))

# ## Why zero and missing weights give `-Inf`
#
# A weight multiplies a log-density, and `0 * logpdf` is `NaN` whenever the
# base `logpdf` is `-Inf` (an out-of-support value).
# A single `NaN` poisons a sum and derails a sampler or optimiser, so `weight`
# short-circuits a zero or missing weight straight to `-Inf`, which is the
# correct log-density of an observation that carries no mass.

logpdf(weight(base, 0), 3.5)

# The same short-circuit applies to a zero observation weight.

logpdf(weight(base), (value = 3.5, weight = 0))

# Keeping the branch at `-Inf` rather than `NaN` also keeps automatic
# differentiation well defined, since the poisoned `0 * -Inf` product never
# reaches the gradient.

# ## A weighted log-likelihood surface for aggregated counts
#
# Aggregated count data records each distinct value once alongside the number of
# times it was seen.
# Here a delay is measured to the nearest day and tallied.

observed = [2.0, 3.0, 4.0, 5.0, 6.0]
tally = [4, 11, 18, 9, 3]        # counts for each observed value

# The likelihood of a candidate `Normal(μ, σ)` for the disaggregated data is
# the weighted sum of per-value log-densities, which the `Product` form
# computes in one call.

function grid_loglik(μ, σ)
    d = weight(Normal(μ, σ), tally)
    return logpdf(d, observed)
end

# Sweeping `μ` over a grid at a fixed `σ` traces the profile log-likelihood.
# No fitting package is needed: the grid maximum is the maximum-likelihood `μ`
# on the grid.

μ_grid = range(3.0, 5.0; length = 21)
σ_fixed = 1.2
surface = [grid_loglik(μ, σ_fixed) for μ in μ_grid]

# The best grid point sits where the surface peaks.

best = argmax(surface)
(μ_hat = μ_grid[best], loglik = surface[best])

# The grid estimate matches the count-weighted sample mean, the closed-form
# maximiser for a Normal mean, up to the grid spacing.

weighted_mean = sum(tally .* observed) / sum(tally)

# A short table of the surface near its peak shows the curvature the maximiser
# sits in.

for (μ, ll) in zip(μ_grid, surface)
    3.6 <= μ <= 4.4 || continue
    println(rpad(round(μ; digits = 2), 6), round(ll; digits = 3))
end

# ## Summary
#
# - `weight(d, w)`, `weight(d)` with `(value =, weight =)`, and the vectorised
#   `Product` forms cover fixed, observation-time and per-element weights.
# - A zero or missing weight returns `-Inf`, keeping the log-density and its
#   gradient well defined.
# - A weighted `Product` turns aggregated counts into a single `logpdf` call,
#   enough to trace a log-likelihood surface and read off a grid estimate with
#   plain Julia.
