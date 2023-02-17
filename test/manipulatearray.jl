using Dates
@testset "manipulatearray.jl" begin
    stringnans = [
        "NaN",
        "nan",
        "Nan",
        "#VALUE!",
    ]
    for literalnan in stringnans
        @test islnan(literalnan)
        @test !isnnm(literalnan)
    end

    nnms = [
            NaN,
        missing,
        nothing
    ]

    for nnm in nnms
        @test islnan(nnm)
        @test isnnm(nnm)
    end

    for isn in (islnan, isnnm)
        @test !isn(DateTime(2022,1,1))
        @test !isn("A string.")
    end

end

@testset "ifstrparse" begin
    @test ifstrparse("123", Float64) == 123.0
    @test ismissing(ifstrparse(missing, Float64))
    @test isnothing(ifstrparse(nothing, Float64))
    @test isnan(ifstrparse(NaN, Float64))
end

@testset "reducetype" begin
    v = [1,2,2.0,"str"] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Float64, Int64, String})

    v = [2.0,"str"] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Float64, String})

    v = ["str", missing] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Missing, String})

    v = ["str", missing, NaN] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Missing, String, Float64})

    v = ["str", 3.2, missing, NaN] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Missing, String, Float64})

    v = [9.7, 3.2, missing, NaN] # a vector of any
    @test isequal(eltype(reducetype(v)), Union{Missing, Float64})

end
