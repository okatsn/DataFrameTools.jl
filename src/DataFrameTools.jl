module DataFrameTools

# Write your package code here.
using DataFrames, MAT, CSV, Dates
include("readtable.jl")
export readtable

using DataFrames
include("dfvstack.jl")
export dfvstack

include("filtern.jl")
export filtern!

# include("dfgadflysegplot.jl") # Deprecated
# export dfgadflysegplot # no need to using Gadfly

include("dfpreview.jl");
export preview, middle

include("manipulatearray.jl")
export convertdf2!
export checkparse
export reducetype!
export reducetype
export describeinstr
export islnan
export selectnames, selectname
export get1var
export chknnm
export isnnm
export ifstrparse

end
