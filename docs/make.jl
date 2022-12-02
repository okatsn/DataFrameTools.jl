using DataFrameTools
using Documenter

DocMeta.setdocmeta!(DataFrameTools, :DocTestSetup, :(using DataFrameTools); recursive=true)

makedocs(;
    modules=[DataFrameTools],
    authors="okatsn <okatsn@gmail.com> and contributors",
    repo="https://github.com/okatsn/DataFrameTools.jl/blob/{commit}{path}#{line}",
    sitename="DataFrameTools.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://okatsn.github.io/DataFrameTools.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/okatsn/DataFrameTools.jl",
    devbranch="main",
)
