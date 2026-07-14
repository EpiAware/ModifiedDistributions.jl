# # [Lowering modifiers to dynamical systems](@id lowering)
#
# ## Introduction
#
# [LoweredDistributions.jl](https://github.com/EpiAware/LoweredDistributions.jl)
# lowers a distribution to a backend-agnostic dynamical-systems representation:
# `lower(dist)` returns an `AbstractLowering`, either a `CTMC` (a
# continuous-time Markov chain generator) or an `AbstractChainTrick` phase-type
# (`ErlangChain`, `Coxian`, `PhaseType`).
# From there a backend extension can build a Catalyst reaction network, an ODE,
# a Petri net, or a jump process.
# When LoweredDistributions is loaded alongside ModifiedDistributions a package
# extension defines `lower` for the modifier leaves.
#
# The bridge is **partial by mathematical necessity**.
# A modifier carries either *dynamics*, which lower, or *observation*, which is
# refused rather than silently approximated (the same contract as
# LoweredDistributions' throw-on-non-integer-Erlang).
#
# - Lowers: an [`affine`](@ref) rescaling (`shift = 0`) divides every rate; a
#   [`modify`](@ref) hazard modification on a constant-hazard `Exponential`
#   leaf stays an `Exponential`.
# - Refused: an [`affine`](@ref) shift (a deterministic delay is not
#   phase-type), a [`weight`](@ref) (a likelihood weight has no dynamics), a
#   forward transform ([`thin`](@ref)/[`cumulative`](@ref)/[`series_transform`](@ref)),
#   and a [`modify`](@ref) on a non-`Exponential` leaf or under a non-analytic
#   link.
#
# ### What are we going to do in this exercise
#
# 1. Lower a plain `Exponential` and `Gamma` leaf to set the scene.
# 2. Lower the modifiers that carry dynamics ([`affine`](@ref) rescaling and
#    [`modify`](@ref) on an `Exponential`).
# 3. See the explicit refusals for the observation-only modifiers.
# 4. Lower a modifier applied to a `ComposedDistributions` chain.
#
# ### What might I need to know before starting
#
# This tutorial builds on the [Getting started](@ref getting-started) overview
# and the [modifier pipeline](@ref modifier-pipeline) tutorial.
# It additionally needs LoweredDistributions.jl and ComposedDistributions.jl,
# both pinned in the docs environment.

# ## Packages used
#
# Loading LoweredDistributions activates the lowering extension; loading
# ComposedDistributions activates the composed-chain extension.

using ModifiedDistributions, Distributions
using LoweredDistributions
using ComposedDistributions

# ## Lowering a plain leaf
#
# An `Exponential` is memoryless, so it lowers to a two-state CTMC: an `on`
# state leaving to `absorbed` at the exponential's rate.

lower(Exponential(2.0))

# An integer-shape `Gamma` (an Erlang) lowers to a linear chain of exponential
# sub-compartments, the linear-chain trick.

lower(Gamma(3.0, 1.5))

# ## An affine rescaling divides every rate
#
# A phase-type is closed under positive time-scaling: stretching every holding
# time by `scale` divides every transition rate by `scale`.
# So `affine(d; scale)` with `shift = 0` lowers exactly.
# Scaling an `Exponential(2)` by three is an `Exponential(6)`, and the lowered
# generators match.

rescaled = affine(Exponential(2.0); scale = 3.0)
lower(rescaled)

# The rescaled generator is the plain `Exponential(6)` generator: the rate has
# been divided by the scale (`0.5 / 3 = 1/6`).

lower(rescaled).Q ≈ lower(Exponential(6.0)).Q

# The same holds for a `Gamma` chain: each per-stage rate is divided by the
# scale.

lower(affine(Gamma(3.0, 1.5); scale = 2.0))

# ## A hazard modification on an Exponential leaf
#
# A hazard modification is exact rate-scaling only when the base hazard is
# constant, i.e. on an `Exponential`.
# Under the log link (proportional hazards) the rate is multiplied by
# `exp(effect)`, so halving the hazard of an `Exponential(2)` (rate `0.5`)
# gives rate `0.25`, an `Exponential(4)`.

prop = modify(Exponential(2.0), -log(2.0); link = log)
lower(prop)

# Under the identity link (additive hazards) the constant `effect` is added to
# the rate; `Exponential(2)` (rate `0.5`) with `effect = 0.5` gives rate `1.0`,
# an `Exponential(1)`.

add = modify(Exponential(2.0), 0.5; link = identity)
lower(add).Q ≈ lower(Exponential(1.0)).Q

# ## The refusals
#
# The observation-only modifiers throw an explicit `ArgumentError` rather than
# lower to a wrong dynamical system.
# We catch and print each message; in real code these propagate as errors.
#
# An affine *shift* adds a deterministic delay, which no finite Markov chain
# reproduces.

try
    lower(affine(Exponential(2.0); shift = 1.0))
catch e
    println(e.msg)
end

# A [`weight`](@ref) is a likelihood weight with no dynamics content.

try
    lower(weight(Exponential(2.0), 3.0))
catch e
    println(e.msg)
end

# A [`thin`](@ref) *does* have a dynamical reading — a competing-risk split, a
# fraction `p` into the event chain and `1 - p` into a NoEvent absorbing sink —
# but LoweredDistributions' wave-1 API exposes no such sink, so it is refused
# until that lands rather than dropping the competing risk.

try
    lower(thin(Exponential(2.0), 0.3))
catch e
    println(e.msg)
end

# A [`cumulative`](@ref) is a running sum on a count series, with no
# rate-structure image.

try
    lower(cumulative(Exponential(2.0)))
catch e
    println(e.msg)
end

# A [`modify`](@ref) on a non-`Exponential` leaf has a time-varying hazard, so
# the modified object is not phase-type.

try
    lower(modify(Gamma(2.0, 1.0), 0.3; link = log))
catch e
    println(e.msg)
end

# ## Lowering across a composed chain
#
# A `ComposedDistributions` `Sequential` chain observes one scalar, the
# convolved total of its steps, exposed by `observed_distribution`.
# That total is a distribution like any other, so it lowers: with no exact
# closed form it takes the adaptive two-moment [`phase_type`](@ref) fit.

chain = sequential(:onset_admit => Gamma(2.0, 1.0),
    :admit_death => Exponential(1.5))
observed = observed_distribution(chain)
lower(observed)

# The modifier bridge composes with the chain.
# Applying [`affine`](@ref) to the chain collapses it to its observed total and
# wraps that in an `Affine` (the composed-chain extension), and lowering that
# rescales the fitted phase-type: doubling the chain doubles the observed mean,
# so the fitted rates halve.

scaled_chain = affine(chain; scale = 2.0)
lower(scaled_chain)

# The rescaled fit is the observed total's fit with every rate divided by the
# scale, so its mean is doubled — the modifier bridge and the composed-chain
# bridge stack cleanly.

(chain = mean(observed), affine_2x = 2.0 * mean(observed))

# ## Summary
#
# - `lower` maps a distribution to a `CTMC` or a phase-type dynamical-systems
#   representation.
# - The modifiers that carry dynamics lower: an [`affine`](@ref) rescaling
#   divides every rate, and a [`modify`](@ref) on a constant-hazard
#   `Exponential` stays an `Exponential`.
# - The observation-only modifiers ([`affine`](@ref) shift, [`weight`](@ref),
#   [`thin`](@ref)/[`cumulative`](@ref)/[`series_transform`](@ref), and
#   [`modify`](@ref) off a constant-hazard leaf) are refused with an explicit
#   error rather than silently mis-lowered.
# - The bridge composes with `ComposedDistributions`: a modifier applied to a
#   chain lowers through the chain's observed total.
