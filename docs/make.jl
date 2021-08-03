ENV["GKSwstype"] = "100"  # set 'GR environment' to 'no output' (for Travis CI)
using Documenter, AnalisisModalEstructural

DocMeta.setdocmeta!(AnalisisModalEstructural, :DocTestSetup,
                   :(using AnalisisModalEstructural); recursive=true)

# generate Literate documentation
#include("generate.jl")

makedocs(
    format = Documenter.HTML(prettyurls = haskey(ENV, "GITHUB_ACTIONS"),  # disable for local builds
                             collapselevel = 1,
                             assets = ["assets/juliareach.css"]),
    sitename = "AnalisisModalEstructural.jl",
    doctest = false,
    strict = false,
    pages = [
        "Introducción" => "index.md",
        "Casos de estudio" => Any["Edificio JOY" => "man/joy.md",
                                  "Ménsula" => "man/mensula.md"],
        "Metodología" => Any["Lectura de archivos" => "man/lectura.md",
                             "Análisis espectral" => "man/espectral.md"],
        "API" => "lib/api.md",
        "Referencias" => "referencias.md"
    ]
)

# Deploy built documentation from Travis.
#deploydocs(
#    repo = "github.com/ONSAS/AnalisisModalEstructural.jl.git",
#    push_preview = true,
#)
