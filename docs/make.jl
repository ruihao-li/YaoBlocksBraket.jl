using YaoBlocksBraket
using Documenter

makedocs(;
    modules=[YaoBlocksBraket],
    authors="Ruihao Li",
    repo="https://github.com/ruihao-li/YaoBlocksBraket.jl/blob/{commit}{path}#{line}",
    sitename="YaoBlocksBraket.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ruihao-li.github.io/YaoBlocksBraket.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Quickstart" => "index.md", 
        "API References" => "refs.md"
    ],
)

deploydocs(;
    repo="github.com/ruihao-li/YaoBlocksBraket.jl.git",
    devbranch="main",
)
