# PACKAGE-OWNED — scaffold writes this once and never overwrites it.
#
# Package-specific configuration read by the managed `make.jl`. It drives the
# Literate.jl tutorial pipeline and the README/index link rewrites, and lists
# the linkcheck URLs to ignore. The defaults below build a site with no
# tutorials, so a fresh package needs no edits here; fill these in as the docs
# grow. CensoredDistributions.jl's `docs/make.jl` is a worked example of the
# values these consts take.

# Tutorial source `.jl` files (Literate scripts) under `TUTORIALS_SUBDIR`.
#
# Light tutorials emit `@example` blocks that Documenter runs in-process; keep
# cheap tutorials here.
const LIGHT_TUTORIALS = [
    "weighted-likelihoods.jl",
    "modifier-pipeline.jl",
    "composed-chains.jl"
]

# Heavy tutorials (live MCMC fits, multi-backend AD, plotting) are each
# executed once in a fresh subprocess so native/memory state cannot accumulate.
const HEAVY_TUTORIALS = String[]

# Where the tutorial `.jl` sources and rendered `.md` pages live, relative to
# `docs/src`.
const TUTORIALS_SUBDIR = joinpath("getting-started", "tutorials")

# Fast-build stubs (`--skip-notebooks`): `"file.md" => "# Heading"` pairs. The
# heading should preserve the tutorial's `@id` (e.g.
# `"# [Title](@id my-anchor)"`) so cross-references from other pages still
# resolve in a fast build.
const TUTORIAL_STUBS = Pair{String, String}[]

# Regexes for URLs to skip during the (full-build) linkcheck, e.g. a page
# published by a separate workflow that is not yet live.
# - The stable/dev docs URLs 404 until the site first deploys; drop the
#   ignore once the docs are live.
# - GitHub Discussions is not yet enabled on the repo (needs an admin);
#   drop the ignore once it is.
# - The benchmark workflow link 404s until this PR merges to main (the
#   file only exists on this PR's branch so far); drop the ignore once
#   merged.
const LINKCHECK_IGNORE = [
    r"^https://epiaware\.org/ModifiedDistributions\.jl",
    r"^https://github\.com/EpiAware/ModifiedDistributions\.jl/discussions",
    r"^https://github\.com/EpiAware/ModifiedDistributions\.jl/blob/main/\.github/workflows/benchmark\.yaml"
]

# README -> index.md link rewrites: `from => to` pairs applied line by line,
# e.g. rewriting an absolute docs URL to an in-site `@ref` so links stay within
# the built version.
const INDEX_REWRITES = Pair{String, String}[]

# Whether README ```julia blocks become runnable `@example readme` blocks on the
# generated home page. Keep `true` when the README's examples are real, runnable
# code; set `false` when they are illustrative (placeholder names) and must not
# execute.
const README_EXECUTE = true

# README headings whose whole section (heading + body, up to the next heading
# of the same or a higher level) is dropped when generating the home page. The
# managed badge block is always stripped via its `<!-- badges:start/end -->`
# markers; this list is the package-owned hook for omitting any OTHER named
# section from the home page (the managed build hardcodes none). Leave empty to
# keep the whole README — content tables and all.
const INDEX_STRIP_SECTIONS = String[]

# Whether the build generates the benchmark page (`src/benchmarks.md`): the
# package-owned `docs/benchmarks.md` prose hook plus the rendered performance
# history (the timeline published to the repo's `benchmarks` branch). Defaults
# to the `benchmarks` flag the package was scaffolded with; `false` drops the
# page and `make.jl` also omits its `pages.jl` nav entry.
const BENCHMARK_PAGE = true
