var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = DataFrameTools","category":"page"},{"location":"#DataFrameTools","page":"Home","title":"DataFrameTools","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for DataFrameTools.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [DataFrameTools]","category":"page"},{"location":"#DataFrameTools.checkparse-Tuple{DataFrames.DataFrame, Any}","page":"Home","title":"DataFrameTools.checkparse","text":"checkparse(df::DataFrame, TYPE) check if all elements column variables can be parsed to a specific data TYPE. It returns a dictionary with the column names of df as its keys, and a vector of DataType and anything that cannot be parsed to TYPE.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.chknnm-Tuple{Any}","page":"Home","title":"DataFrameTools.chknnm","text":"chknnm(df) check if DataFrame df contains missing values or NaN.     Use this before input df into machine.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.convertdf2!-Tuple{Any, Any}","page":"Home","title":"DataFrameTools.convertdf2!","text":"convertdf2!(df, TYPE) convert all elements in df to the type of TYPE, ignoring missing, NaN and nothing.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.describeinstr-Tuple{Any}","page":"Home","title":"DataFrameTools.describeinstr","text":"Given either missing, NaN and Number, returns \"Missing\", \"Not a Number\" and \"Number\".\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.dfvstack-Tuple{Any, Any, Any}","page":"Home","title":"DataFrameTools.dfvstack","text":"Imagine we have several dataframes, each have columns \"t\" and \"f(t)\", and we try to get a long dataframe of columns \"t\", \"f(t)\" and \"sheet\" which is specified by sheetnames; in this case, dfvstack(name_df_pairs, t_name, ft_name) can help!\n\nExample\n\njulia> name_df_pairs = sheetnames .=> dfs\n\nDict{Any, Any} with 3 entries:\n  \"s763.mat\" => 4001×4 DataFrame…\n  \"s761.mat\" => 1499×4 DataFrame…\n  \"s915.mat\" => 824×4 DataFrame…\n\njulia> t_name = \"t\"; \njulia> ft_name = \"f(t)\"\njulia> longdf = dfvstack(name_df_pairs, t_name, ft_name)\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.dropmissingcol-Tuple{Any}","page":"Home","title":"DataFrameTools.dropmissingcol","text":"dropmissingcol(df) drops columns which are all missing.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.filtern!-Tuple{Any, Any, Any}","page":"Home","title":"DataFrameTools.filtern!","text":"filtern(col1, col2, df) automatically drop rows where either of col1 and col2  contains NaN, missing or nothing by default. \n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.filtern!-Tuple{Any, Any}","page":"Home","title":"DataFrameTools.filtern!","text":"filtern works based on filter that drops rows where the corresponding specific column col1 contains NaN, missing or nothing by default.\n\nfiltern is similar to dropmissing but you can drop anything by specifying functions using kwarg chkfun, e.g. filtern(...; chkfun=(ismissing, x -> x>1)).\n\nfiltern(col1, df) is the shorthand of filter(cols => fun, df::AbstractDataFrame) where fun is for examing whether the column contains NaN, missing or nothing.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.get1var-Tuple{DataFrames.DataFrame, Union{Regex, InvertedIndices.InvertedIndex}}","page":"Home","title":"DataFrameTools.get1var","text":"get1var(df::DataFrame, expr::Regex) indexes df on the only one column that matches expr. If more than one columns are matched, it raises an error.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.get1var-Tuple{DataFrames.DataFrame}","page":"Home","title":"DataFrameTools.get1var","text":"get1var(df::DataFrame) returns the only one column of df as a Vector. If there are more than one column, it raises an error.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.get1var-Tuple{Vector}","page":"Home","title":"DataFrameTools.get1var","text":"get1var(v::Vector) get the only variable in the vector v which should have exactly one element; an error will be raised if length(v) != 1.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.ifstrparse-Tuple{Any, Any}","page":"Home","title":"DataFrameTools.ifstrparse","text":"ifstrparse(x, TYPE): if x is AbstractString, then parse it to the variable of TYPE, ignoring missing, NaN and nothing (ignoring those that isnnm(x) returns true).\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.isableparse-Tuple{Any, Any}","page":"Home","title":"DataFrameTools.isableparse","text":"isableparse(x, TYPE) use try...catch to check if x can be parsed to of TYPE. If not, return x; else, return TYPE. If x::TYPE it also returns TYPE evenif it can't be parsed to the type of itself.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.islnan-Tuple{AbstractString}","page":"Home","title":"DataFrameTools.islnan","text":"Return true if it is literally not a number. For example, all(islnan.([\"#VALUE!\", \"nan\", \"NaN\", \"Nan\", nothing])) is true.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.islnan-Tuple{Any}","page":"Home","title":"DataFrameTools.islnan","text":"For x being the type other than the types listed above, islnan(x) falls back to isnnm(x).\n\nSee isnnm.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.isnnm-Tuple{Missing}","page":"Home","title":"DataFrameTools.isnnm","text":"Check if x is missing, nothing or NaN. Different from isnan, for x being either of Nothing, Missing, DateTime, and AbstractString, islnan(x) returns true for Nothing and Missing, and returns false for the rest.\n\nThe difference between islnan and isnnm is that, isnnm check only NaN for Not-a-Number. If you input something like \"#VALUE!\", \"NaN\", it returns false (NOT missing, nothing or NaN).\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.middle-Tuple{DataFrames.DataFrame, Integer}","page":"Home","title":"DataFrameTools.middle","text":"middle(df::DataFrame, n::Integer) Similar to first(df, n) or last(df, n), but get the dataframe of middle n rows.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.preview-Tuple{IO, DataFrames.DataFrame, Integer}","page":"Home","title":"DataFrameTools.preview","text":"preview(df::DataFrame, n::Integer; show_row_number=true) gives preview of first, middle and last columns of total n rows.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.readtable-Tuple{Any}","page":"Home","title":"DataFrameTools.readtable","text":"readtable(filepath) read matlab mat or csv files, and returns a DataFrame\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.reducetype-Tuple{AbstractArray}","page":"Home","title":"DataFrameTools.reducetype","text":"reducetype(v::AbstractArray) returns the array of type Union{uniqueTYPE}, where uniqueTYPE = v .|> typeof |> unique.\n\nFor more about manipulating datatype, also see nonmissingtype in missing.jl and Base.typesplit in promotion.jl\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.selectname-Tuple{DataFrames.DataFrame, Any}","page":"Home","title":"DataFrameTools.selectname","text":"selectname(df::DataFrame, arg) returns a vector of column names that match arg of the dataframe df. arg can be Regex, AbstractString, or InvertedIndex.\n\n\n\n\n\n","category":"method"},{"location":"#DataFrameTools.selectnames-Tuple{Any, Vararg{Any}}","page":"Home","title":"DataFrameTools.selectnames","text":"selectnames(dfnames, args...) select an array of names that contains arg::String or pattern that matches arg::Regex.\n\nExample\n\njulia> selectnames([\"Soil_water_content_10cm, water_level_#1, water_level_#2\"], r\"water_lev\")\n\n[water_level_#1, water_level_#2\"]\n\n\n\n\n\n","category":"method"}]
}
