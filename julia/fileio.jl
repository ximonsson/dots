using Parquet, DataFrames, Dates

"""
	ldpq(path::AbstractString; keep = missing, types = Dict(), timestamps = [])

Function to help loading Parquet files.

Don't expect the `types` mapping to work.
"""
function ldpq(path::AbstractString; keep = missing, types = Dict(), timestamps = [])
	# the map_logical_types is not working as it should i think,
	# so we will do the converting here manually
	f = Parquet.File(path, map_logical_types = types)

	@debug "schema" Parquet.schema(f)

	fn = if ismissing(keep)
		x -> DataFrame(x, copycols = false)
	else
		x -> select(DataFrame(x, copycols = false), keep)
	end

	df = reduce(vcat, BatchedColumnsCursor(f) .|> fn)

	@debug "converting columns"

	# convert pandas timestamp in microseconds to DateTime
	timestamp(x) = x .* 1e-6 .|> unix2datetime
	# DateTime columns
	for c in timestamps
		df[!, c] = df[!, c] .|> x -> ismissing(x) ? missing : timestamp(x)
	end

	df
end
