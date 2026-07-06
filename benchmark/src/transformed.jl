# Transformed (forward-series) modifiers: `thin` and `cumulative` carry an op
# for a downstream count series and are transparent to every distribution
# method, so these rows should sit on the baseline (delegation overhead
# approximately zero).

SUITE["Transformed"] = BenchmarkGroup()
SUITE["Transformed"]["thin"] = BenchmarkGroup()
SUITE["Transformed"]["cumulative"] = BenchmarkGroup()

let
    d = thin(BASE, 0.3)

    SUITE["Transformed"]["thin"]["construction"] = @benchmarkable thin(
        $BASE, 0.3)
    SUITE["Transformed"]["thin"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Transformed"]["thin"]["cdf"] = @benchmarkable cdf.($d, $TEST_XS)
    SUITE["Transformed"]["thin"]["rand"] = @benchmarkable rand($d, 100)
end

let
    d = cumulative(BASE)

    SUITE["Transformed"]["cumulative"]["construction"] = @benchmarkable begin
        cumulative($BASE)
    end
    SUITE["Transformed"]["cumulative"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Transformed"]["cumulative"]["cdf"] = @benchmarkable cdf.(
        $d, $TEST_XS)
    SUITE["Transformed"]["cumulative"]["rand"] = @benchmarkable rand($d, 100)
end
