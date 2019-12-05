using Documenter, StackOverflow

makedocs(sitename="StackOverflow.jl")

deploydocs(
    repo = "github.com/logankilpatrick/StackOverflow.jl.git",
    target = "build"
)
