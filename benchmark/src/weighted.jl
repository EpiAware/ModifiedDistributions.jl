# Weighted modifier: the weight only touches `logpdf` (`w * logpdf(dist, x)`),
# so that is the hot path — scalar per-observation calls and the vectorised
# `Product{<:Weighted}` form used for aggregated count data.

SUITE["Weighted"] = BenchmarkGroup()
SUITE["Weighted"]["scalar"] = BenchmarkGroup()
SUITE["Weighted"]["Product"] = BenchmarkGroup()

let
    d = weight(BASE, 10.0)

    SUITE["Weighted"]["scalar"]["construction"] = @benchmarkable weight(
        $BASE, 10.0)
    SUITE["Weighted"]["scalar"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
end

let
    ws = collect(range(1.0, 10.0, length = 100))
    d = weight(BASE, ws)

    SUITE["Weighted"]["Product"]["construction"] = @benchmarkable weight(
        $BASE, $ws)
    SUITE["Weighted"]["Product"]["logpdf"] = @benchmarkable logpdf(
        $d, $TEST_XS)
end
