@testset "testing `filtern!()`: " begin 
	using DataFrames
	lenrow = 30; 
	lencol = 8;
	maxeach = floor(lenrow*(lencol-1)/10) |> x -> convert(Int, x); 
			# floor(lencol/4) |> x -> convert(Int, x);
	all_colid = collect(1:lencol);
	all_rowid = collect(1:lenrow)
	collist = ["col$i" for i in 1:lencol-1];

	pair_list = []; 
	push!(pair_list, "absrow" => all_rowid);
	for colname in collist 
		veci = Vector{Union{Float64, Missing, Nothing}}(undef, lenrow);
		veci[:] = randn(lenrow);
		push!(pair_list, colname => veci)
	end 
	testDataFrame = DataFrame(pair_list); 

	"""
	get random indices `(is, js)` for dataframe.
	"""
	function get_randind2(rrange, crange, numsamp)
	# numsamp = rand(0:5);
	idr = rand(rrange, numsamp); 
	idc = rand(crange, numsamp); 
	return [ (idr, idc[i]) for (i, idr) in enumerate(idr)]
	end



	function replace_by!(df, listidridc, sth)
		for ind2 in listidridc
			df[ind2...] = sth;
		end
	end

	function rand_replace_all!(df)
		rrange = 1:lenrow;
		crange = 2:lencol;
		ismissing_id = get_randind2(rrange, crange, rand(1:maxeach));
		isnothing_id = get_randind2(rrange, crange, rand(1:maxeach));
		isnan_id = get_randind2(rrange, crange, rand(1:maxeach));
		replace_by!(df, isnan_id, NaN)
		replace_by!(df, isnothing_id, nothing)
		replace_by!(df, ismissing_id, missing)
		
		fnx(id) = [v[1] for v in id];
		
		rowid_remain = collect(rrange); 
		rowid_remain = setdiff!(rowid_remain, fnx(ismissing_id));
		rowid_remain = setdiff!(rowid_remain, fnx(isnothing_id));
		rowid_remain = setdiff!(rowid_remain, fnx(isnan_id));
		
		
		return rowid_remain
	end


# test begin:

	df = copy(testDataFrame);
	rowid_remain = rand_replace_all!(df);
	for colname in collist
		filtern!(colname, df)
	end
	@test df[!,"absrow"] == rowid_remain
end



