@testset "dfvstack.jl" begin
    using DataFrames
    df1 = DataFrame("t" => 1:10, "f(t)" => randn(10))
    df2 = DataFrame("t" => 5:0.5:13, "f(t)" => randn(17))
    df3 = DataFrame("t" => 14:23, "f(t)" => randn(10))
    @test try dfvstack(["s1", "s2", "s3"] .=> [df1, df2, df3], "t", "f(t)"); true; catch; false; end
    dflong = dfvstack(["s1", "s2", "s3"] .=> [df1, df2, df3], "t", "f(t)")
    gd = groupby(dflong, "sheet")
    @test gd[1][!, :t] == df1[!, :t]
    @test gd[1][!, "f(t)"] == df1[!, "f(t)"]
    @test gd[2][!, :t] == df2[!, :t]
    @test gd[2][!, "f(t)"] == df2[!, "f(t)"]
    @test gd[3][!, :t] ==  df3[!, :t]
    @test gd[3][!, "f(t)"] == df3[!, "f(t)"]
end