module DataFrameTools

# Write your package code here.
using DataFrames, MAT, CSV
include("readtable.jl")
export readtable

using DataFrames
include("dfvstack.jl")
export dfvstack

include("filtern.jl")
export filtern!

include("dfgadflysegplot.jl")
export dfgadflysegplot # no need to using Gadfly

end

