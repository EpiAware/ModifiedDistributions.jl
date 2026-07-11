# # [Convolving modified distributions](@id convolved-modifiers)
#
# ## Introduction
#
# ConvolvedDistributions.jl does two related jobs: it sums independent
# delays into a single total-delay distribution, and it convolves a numeric
# count series with a discretised daily delay PMF to give expected
# downstream counts.
# Loading it alongside ModifiedDistributions activates a package extension
# that lets the modifiers ride both jobs: forward-series transforms
# ([`thin`](@ref), [`cumulative`](@ref), [`series_transform`](@ref)) act on
# the convolved counts, and modified distributions serve as convolution
# components.
#
# ### What are we going to do in this exercise
#
# 1. Build a two-stage total delay, discretise it, and convolve an infection
#    series with it.
# 2. Thin the convolved series with [`thin`](@ref) (ascertainment).
# 3. Accumulate it with [`cumulative`](@ref) (cumulative incidence).
# 4. Time-scale a convolved delay with [`affine`](@ref).
# 5. See that a series op attached between two fused delays is ignored at
#    the distribution level.
#
# ### What might I need to know before starting
#
# This tutorial builds on the [Getting started](@ref getting-started)
# overview and the [A modifier pipeline](@ref modifier-pipeline) tutorial,
# and uses Distributions.jl, ConvolvedDistributions.jl and
# ModifiedDistributions.jl, with CairoMakie and AlgebraOfGraphics for the
# figure.

# ## Packages used
#
# CairoMakie and AlgebraOfGraphics are used for plotting only.

using ModifiedDistributions, ConvolvedDistributions, Distributions
using CairoMakie, AlgebraOfGraphics

CairoMakie.activate!(type = "png", px_per_unit = 2)
set_theme!(theme_latexfonts(); fontsize = 14)

# ## A convolved total delay and an infection series
#
# An observed delay is often the sum of stages: here infection-to-onset
# plus onset-to-report.
# `convolved` fuses the two into one total-delay distribution, and its
# mean is the sum of the stage means.

onset = Gamma(2.0, 1.0)
report = LogNormal(0.5, 0.4)
total = convolved(onset, report)
(total_mean = mean(total), stage_sum = mean(onset) + mean(report))

# To convolve a numeric count series with the delay, first discretise the
# continuous total to a daily PMF with [`discretise_pmf`](@ref):
# `convolve_series` deliberately refuses to discretise a continuous delay
# implicitly, since the discretisation scheme is a modelling choice.
# Wrapping the daily masses in a `DiscreteNonParametric` gives a discrete
# delay the forward-op handshake below can carry.

infections = [0.0, 10.0, 40.0, 90.0, 120.0, 100.0, 60.0, 30.0, 12.0, 4.0]
maxlag = length(infections) - 1
masses = collect(discretise_pmf(total, maxlag).masses)
delay = DiscreteNonParametric(collect(0:maxlag), masses ./ sum(masses))

# Convolving the discrete delay with an expected-infections curve gives the
# expected reported counts each day.

reported = convolve_series(delay, infections)
reported

# ## Thinning the convolved counts (ascertainment)
#
# Only a fraction of events is usually observed.
# [`thin`](@ref) attaches that ascertainment fraction to the delay, and the
# extension applies it to the convolved counts: every day below is `0.3`
# times the unthinned baseline.

ascertained = convolve_series(thin(delay, 0.3), infections)
(day4_thinned = ascertained[4], day4_check = 0.3 * reported[4])

# Plotting the baseline against the thinned series shows the op acting on
# the whole curve at once.

days = collect(0:(length(infections) - 1))
series_curves = (
    day = vcat(days, days),
    count = vcat(reported, ascertained),
    series = vcat(fill("all reported", length(days)),
        fill("30% ascertained", length(days)))
)
draw(
    data(series_curves) *
    mapping(:day => "Day", :count => "Expected count",
        color = :series => "Series") *
    visual(Lines, linewidth = 2);
    figure = (size = (600, 350),)
)

# ## Cumulative incidence
#
# [`cumulative`](@ref) accumulates the convolved counts into a running
# total, so the final day below equals the sum of the whole daily series.

cumulative_counts = convolve_series(cumulative(delay), infections)
(final_cumulative = cumulative_counts[end], daily_sum = sum(reported))

# The wrappers nest, applying innermost first: thinning then accumulating
# gives cumulative ascertained incidence.

cum_ascertained = convolve_series(
    thin(cumulative(delay), 0.3), infections)
(final = cum_ascertained[end], check = 0.3 * sum(reported))

# ## Time-scaling a convolved delay
#
# [`affine`](@ref) wraps the total delay just as it wraps any univariate
# distribution, so a change of time unit (or a stretch of the delay) is a
# scale on the fused total.
# Doubling the delay doubles its mean.

stretched = affine(total; scale = 2.0)
(total_mean = mean(total), stretched_mean = mean(stretched))

# Discretising the stretched total the same way and convolving pushes the
# convolved counts later: the stretched delay peaks a couple of days after
# the baseline.

stretched_masses = collect(discretise_pmf(stretched, maxlag).masses)
stretched_delay = DiscreteNonParametric(
    collect(0:maxlag), stretched_masses ./ sum(stretched_masses))
reported_stretched = convolve_series(stretched_delay, infections)
(peak_day_base = days[argmax(reported)],
    peak_day_stretched = days[argmax(reported_stretched)])

# ## A series op between two fused delays is ignored at the distribution level
#
# A forward op belongs to the wrapper it is attached to, and it only fires
# when THAT wrapper is handed a series.
# If a thinned stage is fused into a distribution-level convolution, the
# total delay's density is untouched: `thin` is transparent to every
# distribution method, so the fused CDF with and without the op agree
# exactly.

fused_plain = convolved(onset, report)
fused_thinned_stage = convolved(thin(onset, 0.3), report)
(cdf_plain = cdf(fused_plain, 4.0),
    cdf_with_op_inside = cdf(fused_thinned_stage, 4.0))

# The printed CDFs are identical: the op sits inert between the two fused
# delays.
# To thin the OUTPUT of the fused delay, attach the op to the fused total
# itself (as in the ascertainment section above), where the series
# handshake can see it.

# ## Summary
#
# - `convolve_series(delay, series)` turns an infection series into
#   expected downstream counts; the delay must be discrete, so a continuous
#   total is discretised first with [`discretise_pmf`](@ref). The extension
#   then lets [`thin`](@ref), [`cumulative`](@ref) and
#   [`series_transform`](@ref) act on those counts.
# - Wrappers nest and apply innermost first.
# - [`affine`](@ref) time-scales a fused total delay like any other
#   distribution, and modified distributions can sit inside a convolution.
# - A series op fused between two delays is ignored at the distribution
#   level; attach it to the object that receives the series.
