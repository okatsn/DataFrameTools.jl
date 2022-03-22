"""
`preview(df::DataFrame, n::Integer; show_row_number=true)`
gives preview of first, middle and last columns of total n rows.
"""
function preview(io::IO, df::DataFrame, n::Integer; show_row_number=true)
	nrow, ncol = size(df);
	if show_row_number
		rows = DataFrame("Row"=>rownumber.(eachrow(df)));
		df = hcat(rows,df);
	end

	hsplit = similar(df, 1);
	for col in names(df)
		hsplit[!,col] = ["..."];
	end
	
	nsub = Int64(floor(n/3));
	df_prev = [first(df, nsub); hsplit; middle(df, nsub-1); hsplit];
	hsofar = size(df_prev)[1];
	df_prev = [df_prev; last(df,n - hsofar)];
	# For `pretty_table()`'s option, see DataFrames.jl\src\abstractdataframe\show.jl
	DataFrames.pretty_table(io, df_prev; nosubheader=true, show_row_number=false);
	println(io, "($nrow rows × $ncol columns)");
	nothing
end

function preview(df::DataFrame, n::Integer; show_row_number=true)
	preview(stdout, df, n; show_row_number=show_row_number)
end

"""
`middle(df::DataFrame, n::Integer)`
Similar to `first(df, n)` or `last(df, n)`, but get the dataframe of middle n rows.
"""
function middle(df::DataFrame, n::Integer)
	height = size(df)[1];
	mid0 = Int64(floor(height/2-n/2));
	mid1 = mid0 + n - 1;
	return df[mid0:mid1,:]
end