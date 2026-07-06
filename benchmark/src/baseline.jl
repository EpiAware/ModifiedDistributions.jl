# Bare base LogNormal: the floor every modifier's overhead is read against.
# Each modifier group below wraps this same base and benchmarks the same
# operations over the same points.

SUITE["Baseline"] = BenchmarkGroup()
SUITE["Baseline"]["LogNormal"] = BenchmarkGroup()

let
    d = BASE

    SUITE["Baseline"]["LogNormal"]["construction"] = @benchmarkable LogNormal(
        1.5, 0.5)
    SUITE["Baseline"]["LogNormal"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Baseline"]["LogNormal"]["pdf"] = @benchmarkable pdf.($d, $TEST_XS)
    SUITE["Baseline"]["LogNormal"]["cdf"] = @benchmarkable cdf.($d, $TEST_XS)
    SUITE["Baseline"]["LogNormal"]["ccdf"] = @benchmarkable ccdf.($d, $TEST_XS)
    SUITE["Baseline"]["LogNormal"]["quantile"] = @benchmarkable quantile.(
        $d, $TEST_PS)
    SUITE["Baseline"]["LogNormal"]["rand"] = @benchmarkable rand($d, 100)
end
