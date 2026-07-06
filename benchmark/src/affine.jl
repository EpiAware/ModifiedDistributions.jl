# Affine modifier: change-of-variables through `Y = scale * X + shift`, so
# every operation adds an inverse map (and `logpdf` a log-Jacobian) over the
# baseline.

SUITE["Affine"] = BenchmarkGroup()
SUITE["Affine"]["LogNormal"] = BenchmarkGroup()

let
    d = affine(BASE; scale = 2.0, shift = 1.0)

    SUITE["Affine"]["LogNormal"]["construction"] = @benchmarkable affine(
        $BASE; scale = 2.0, shift = 1.0)
    SUITE["Affine"]["LogNormal"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Affine"]["LogNormal"]["pdf"] = @benchmarkable pdf.($d, $TEST_XS)
    SUITE["Affine"]["LogNormal"]["cdf"] = @benchmarkable cdf.($d, $TEST_XS)
    SUITE["Affine"]["LogNormal"]["ccdf"] = @benchmarkable ccdf.($d, $TEST_XS)
    SUITE["Affine"]["LogNormal"]["quantile"] = @benchmarkable quantile.(
        $d, $TEST_PS)
    SUITE["Affine"]["LogNormal"]["rand"] = @benchmarkable rand($d, 100)
end
