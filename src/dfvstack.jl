"""
Imagine we have several dataframes, each have columns "t" and "f(t)", and we try to get a long dataframe of columns "t", "f(t)" and "sheet" which is specified by `sheetnames`; in this case, `dfvstack(name_df_pairs, t_name, ft_name)` can help!

# Example
```julia
julia> name_df_pairs = sheetnames .=> dfs

Dict{Any, Any} with 3 entries:
  "s763.mat" => 4001×4 DataFrame…
  "s761.mat" => 1499×4 DataFrame…
  "s915.mat" => 824×4 DataFrame…

julia> t_name = "t"; 
julia> ft_name = "f(t)"
julia> longdf = dfvstack(name_df_pairs, t_name, ft_name)
```
"""
function dfvstack(name_df_pairs, t_name, ft_name; newcol=:sheet)
    
    dfs = []
    for (k, dfi0) in name_df_pairs
        dfi = copy(dfi0)
        select!(dfi, t_name, ft_name)
        insertcols!(dfi, newcol => k)
        push!(dfs, dfi)
    end
    return vcat(dfs...)
end