# Integration: ComposedDistributions × ConvolvedDistributions × modifiers.
#
# The two extensions meet when a composed delay chain is convolved through a
# numeric count series and a modifier reshapes the result. A `Sequential`
# collapses to its observed total (a `Convolved`), a modifier on the chain
# wraps that total, and `convolve_series` routes the wrapper through the
# ModifiedDistributions × ConvolvedDistributions handshake, which discretises
# the inner continuous total and applies the modifier's op. These testitems
# are the durable evidence that the full stack works end to end.

@testitem "Integration: forward transforms on a composed chain convolve" begin
    using Distributions
    using ComposedDistributions
    using ConvolvedDistributions
    using ConvolvedDistributions: discretise_pmf

    # A two-step delay chain (onset->admit->death) collapses to one observed
    # total delay; discretising it and convolving the incidence series gives
    # the baseline expected downstream counts.
    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    observed = observed_distribution(seq)
    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]
    baseline = convolve_series(
        discretise_pmf(observed, length(series) - 1), series)

    # thin(seq, p): the ascertainment factor multiplies the baseline counts.
    # The chain collapses to its observed total, thin wraps that total, and
    # convolve_series peels the op after convolving the discretised total.
    thinned = convolve_series(thin(seq, 0.3), series)
    @test thinned ≈ 0.3 .* baseline

    # cumulative(seq): the running sum of the baseline counts.
    cum = convolve_series(cumulative(seq), series)
    @test cum ≈ cumsum(baseline)

    # series_transform(seq, op): an arbitrary op applies to the counts.
    shifted = convolve_series(series_transform(seq, s -> s .+ 1.0), series)
    @test shifted ≈ baseline .+ 1.0

    # Nested forward ops apply innermost first: accumulate, then thin.
    nested = convolve_series(thin(cumulative(seq), 0.3), series)
    @test nested ≈ 0.3 .* cumsum(baseline)
end

@testitem "Integration: affine and modify on a composed chain convolve" begin
    using Distributions
    using ComposedDistributions
    using ConvolvedDistributions
    using ConvolvedDistributions: discretise_pmf

    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    observed = observed_distribution(seq)
    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]

    # affine(seq; scale): time-scaling the chain's observed total. The
    # convolved counts match convolving the discretised affine-scaled total
    # directly, so the modifier convenience discretises the same object.
    scaled = convolve_series(affine(seq; scale = 2.0), series)
    expected_affine = convolve_series(
        discretise_pmf(affine(observed; scale = 2.0), length(series) - 1),
        series)
    @test scaled ≈ expected_affine
    # Scaling the delay pushes mass later, so the counts differ from a plain
    # convolution of the unscaled total.
    plain = convolve_series(
        discretise_pmf(observed, length(series) - 1), series)
    @test !isapprox(scaled, plain)

    # modify(seq, effect): a hazard modification of the observed total,
    # matching the discretised modified total convolved directly.
    modified = convolve_series(modify(seq, -log(2.0)), series)
    expected_modify = convolve_series(
        discretise_pmf(modify(observed, -log(2.0)), length(series) - 1),
        series)
    @test modified ≈ expected_modify
end

@testitem "Integration: bare composed total needs explicit discretisation" begin
    using Distributions
    using ComposedDistributions
    using ConvolvedDistributions
    using ConvolvedDistributions: discretise_pmf

    # A bare continuous observed total is NOT a modifier wrapper, so
    # convolve_series routes to ConvolvedDistributions' own discrete-only
    # method, which refuses to silently discretise a continuous delay. This
    # is by design: the caller discretises explicitly (or wraps in a
    # modifier, whose convenience path discretises for them).
    seq = sequential(:onset_admit => Gamma(2.0, 1.0),
        :admit_death => LogNormal(0.5, 0.4))
    observed = observed_distribution(seq)
    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]

    @test_throws ArgumentError convolve_series(observed, series)

    # The explicit route works and equals the modifier convenience path with
    # an identity op.
    baseline = convolve_series(
        discretise_pmf(observed, length(series) - 1), series)
    via_modifier = convolve_series(thin(seq, 1.0), series)
    @test via_modifier ≈ baseline
end

@testitem "Integration: Parallel convolves branch by branch" begin
    using Distributions
    using ComposedDistributions
    using ConvolvedDistributions
    using ConvolvedDistributions: discretise_pmf

    # A Parallel has several independent endpoints and no single observed
    # delay, so convolve_series on the whole Parallel is refused with
    # guidance. The sensible route convolves each modified branch endpoint
    # separately.
    par = parallel(:admit => Gamma(2.0, 1.0), :notif => LogNormal(0.5, 0.4))
    series = [0.0, 5.0, 12.0, 20.0, 15.0, 8.0, 3.0]

    @test_throws ArgumentError convolve_series(thin(par, 0.3), series)

    # thin maps over the branches; each branch endpoint convolves like any
    # thinned delay, giving 0.3 times its own baseline counts.
    tp = thin(par, 0.3)
    admit_baseline = convolve_series(
        discretise_pmf(Gamma(2.0, 1.0), length(series) - 1), series)
    notif_baseline = convolve_series(
        discretise_pmf(LogNormal(0.5, 0.4), length(series) - 1), series)
    @test convolve_series(event(tp, :admit), series) ≈ 0.3 .* admit_baseline
    @test convolve_series(event(tp, :notif), series) ≈ 0.3 .* notif_baseline
end
