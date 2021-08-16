using Documenter, CursoANLE

DocMeta.setdocmeta!(CursoANLE, :DocTestSetup,
                   :(using CursoANLE); recursive=true)

# generate Literate documentation
#include("generate.jl")

makedocs(
    format = Documenter.HTML(prettyurls = haskey(ENV, "GITHUB_ACTIONS"),  # disable for local builds
                             collapselevel = 1,
                             assets = ["assets/juliareach.css"]),
    doctest = false,
    strict = false,
    pages = [
        "Contenidos" => "index.md",
        "Métodos Numéricos para Ecuaciones No Lineales" => Any["Métodos Incrementales" => "man/metodos_incrementales.md",
                                                               "Métodos Iterativos" => "man/metodos_iterativos.md",
                                                               "Métodos de Longitud de Arco" => "man/metodos_de_longitud_de_arco.md"],
    #    "API" => "lib/api.md",
        "Referencias" => "referencias.md"
    ],
    sitename = "Curso ANLE (2021)"
)

deploydocs(
    repo = "github.com/mforets/CursoANLE.jl.git",
    push_preview = true,
)
