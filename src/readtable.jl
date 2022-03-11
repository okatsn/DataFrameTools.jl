"""
`readtable(filepath)` read matlab mat or csv files, and returns a DataFrame
"""
function readtable(filepath)
    fname = basename(filepath);
	if occursin(r"(\.txt|\.csv)",fname)
		table_i = CSV.read(filepath, DataFrame);
	else
		dict_i = matopen(filepath) do io
			read(io)
		end # load xxx.mat and return a Dict
		table_i = DataFrame();
		for (k, v) in dict_i
			v2 = view(v, :); # a non-copied way of [v...]
			insertcols!(table_i, k => v2);
		end
	end 
    
    return table_i
end