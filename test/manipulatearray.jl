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

    @test ifstrparse("123", Float64) == 123.0
    @test ismissing(ifstrparse(missing, Float64))
    @test isnothing(ifstrparse(nothing, Float64))
    @test isnan(ifstrparse(NaN, Float64))
end
