# PACKAGE-OWNED — scaffold writes this once and never overwrites it.
#
# QA configuration values the managed `quality.jl` testset reads. Fill in the
# package-specific inputs the shared helpers need; the standard testset logic
# stays in `quality.jl` (managed). Edit freely.

using ModifiedDistributions

const QA_CONFIG = (
    # The module under test.
    mod = ModifiedDistributions,

    # Path to the isolated JET environment (see test/jet/Project.toml).
    jet_env = joinpath(@__DIR__, "..", "jet"),

    # Per-check Aqua relaxations, e.g. (; ambiguities = false). Empty = all on.
    aqua = (;),

    # ExplicitImports `ignore`: symbols an extension legitimately imports
    # non-publicly. The ConvolvedDistributions extension wires internal
    # machinery on both sides by design: this package's forward-op peeling
    # and batched-evaluation traits, and ConvolvedDistributions' quadrature
    # window / ad-safe families (the same pattern as its own
    # SurvivalDistributions extension).
    ei_ignore = (:_IdentityModified, :_LogModified, :_ContinuousModified,
        :_apply_forward_ops, :_has_batched_method, :_log1mexp, :_peel_forward,
        :_numeric_logccdf, :_numeric_logpdf,
        :_cdf_ad_safe, :_ccdf_ad_safe, :_logcdf_ad_safe,
        :_logccdf_ad_safe, :_primal, :_primal_distribution),

    # Docstring `crossref_ignore`: upstream names docstrings link to via
    # `[`name`](@ref)`, e.g. (:pdf, :cdf, :logpdf).
    crossref_ignore = (),

    # Extra docstring-format options, e.g.
    # (; exported_only_examples = true, require_field_docs = true).
    docstring = (;),

    # README section-structure check. `path` is the package root (its
    # README.md). Override `required`/`order` to extend or relax the standard
    # section set, e.g.
    #   (; required = vcat(STANDARD_README_SECTIONS, [("Benchmarks",)]))
    # Empty `(;)` uses the standard structure in standard order.
    readme = (; path = joinpath(@__DIR__, "..", "..")),

    # Package extensions to ambiguity-check. Each entry:
    #   (; name = :MyPkgSomeTriggerExt,
    #      triggers = ("SomeTrigger",),       # packages to load first
    #      prefixes = ("MyPkg", "SomeTrigger"),
    #      expect_phantoms = false,    # true if a third party adds phantoms
    #      broken = false)             # true to quarantine a known ambiguity
    extensions = (
        (; name = :ModifiedDistributionsComposedDistributionsExt,
            triggers = ("ComposedDistributions",),
            prefixes = ("ModifiedDistributions", "ComposedDistributions")),
        (; name = :ModifiedDistributionsConvolvedDistributionsExt,
            triggers = ("ConvolvedDistributions",),
            prefixes = ("ModifiedDistributions", "ConvolvedDistributions")))
)
