# Modified (hazard) modifier on both analytic links. The log link
# (proportional hazards) has closed forms throughout, including `quantile`;
# the identity link (additive hazards) has closed-form densities but inverts
# its cdf by monotone bisection, which `quantile` (and `rand`, quantile
# inversion of a uniform draw) exercises here.

SUITE["Modified"] = BenchmarkGroup()
SUITE["Modified"]["LogLink"] = BenchmarkGroup()
SUITE["Modified"]["IdentityLink"] = BenchmarkGroup()

let
    d = modify(BASE, -log(2.0); link = log)

    SUITE["Modified"]["LogLink"]["construction"] = @benchmarkable modify(
        $BASE, -log(2.0); link = log)
    SUITE["Modified"]["LogLink"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Modified"]["LogLink"]["pdf"] = @benchmarkable pdf.($d, $TEST_XS)
    SUITE["Modified"]["LogLink"]["cdf"] = @benchmarkable cdf.($d, $TEST_XS)
    SUITE["Modified"]["LogLink"]["ccdf"] = @benchmarkable ccdf.($d, $TEST_XS)
    SUITE["Modified"]["LogLink"]["quantile"] = @benchmarkable quantile.(
        $d, $TEST_PS)
    SUITE["Modified"]["LogLink"]["rand"] = @benchmarkable rand($d, 100)
end

let
    d = modify(BASE, 0.2; link = identity)

    SUITE["Modified"]["IdentityLink"]["construction"] = @benchmarkable modify(
        $BASE, 0.2; link = identity)
    SUITE["Modified"]["IdentityLink"]["logpdf"] = @benchmarkable logpdf.(
        $d, $TEST_XS)
    SUITE["Modified"]["IdentityLink"]["pdf"] = @benchmarkable pdf.(
        $d, $TEST_XS)
    SUITE["Modified"]["IdentityLink"]["cdf"] = @benchmarkable cdf.(
        $d, $TEST_XS)
    SUITE["Modified"]["IdentityLink"]["ccdf"] = @benchmarkable ccdf.(
        $d, $TEST_XS)
    SUITE["Modified"]["IdentityLink"]["quantile"] = @benchmarkable quantile.(
        $d, $TEST_PS)
    SUITE["Modified"]["IdentityLink"]["rand"] = @benchmarkable rand($d, 100)
end
