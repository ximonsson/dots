using Parquet, DataFrames, Dates

"""
	ldpq(path::AbstractString, p::Function = x -> x; keep = missing, types = Dict(), timestamps = [])

Function to help loading Parquet files.

- `p` is a function that can be used to filter.
- `keep` is an argument that is compatible with `DataFrames.select(::AbstractDataFrame, ...)`
- `timestamps` tells us what columns are timestamps because these are not converted between pandas and julia well as pandas uses microseconds.

Don't expect the `types` mapping to work.
"""
function ldpq(path::AbstractString, p::Function = x -> x; keep = missing, types = Dict(), timestamps = [])
	# the map_logical_types is not working as it should i think,
	# so we will do the converting here manually
	f = Parquet.File(path, map_logical_types = types)

	@debug "schema" Parquet.schema(f)

	# convert pandas timestamp in microseconds to DateTime
	timestamp(x) = x .* 1e-6 .|> unix2datetime
	timestamp(::Missing) = missing

	function fn(c)
		df = DataFrame(c, copycols = false) |> p

		!ismissing(keep) && select!(df, keep)

		# DateTime columns
		for c in timestamps
			df[!, c] = df[!, c] .|> timestamp
		end

		df
	end

	reduce(vcat, BatchedColumnsCursor(f) .|> fn)
end
