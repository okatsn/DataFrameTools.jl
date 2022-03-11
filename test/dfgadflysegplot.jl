@testset "test `dfgadflysegplot.jl`" begin
	using DataFrames, Gadfly
	x = randn(50);
	y = rand(1:9999,50);
	df = DataFrame(:col1 => x, :col2 => y);
	(df2, colind) = forsegplot(df, [:col1, :col2]);
	@test isequal(df2[!,:x0], x[1:end-1])
	@test isequal(df2[!,:x1], x[2:end])
	@test isequal(df2[!,:y0], y[1:end-1])
	@test isequal(df2[!,:y1], y[2:end])
	
	plotwithouterror = true;
	try
		Gadfly.plot(df2, Geom.segment; colind...);
	catch 
		plotwithouterror = false;
	end
	@test plotwithouterror

end