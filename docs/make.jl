using YaoBlocksBraket
using Documenter

DocMeta.setdocmeta!(YaoBlocksBraket, :DocTestSetup, :(using YaoBlocksBraket); recursive=true)

makedocs(;
    modules=[YaoBlocksBraket],
    authors="Ruihao Li, Elliot Golias",
    repo="https://github.com/ruihao-li/YaoBlocksBraket.jl/blob/{commit}{path}#{line}",
    sitename="YaoBlocksBraket.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ruihao-li.github.io/YaoBlocksBraket.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ruihao-li/YaoBlocksBraket.jl",
    devbranch="main",
)
