module DataFrameTools

# Write your package code here.
using DataFrames, MAT, CSV
include("readtable.jl")
export readtable

using DataFrames
include("dfvstack.jl")
export dfvstack
end
