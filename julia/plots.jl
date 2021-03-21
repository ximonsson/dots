using StatsPlots, Plots.PlotMeasures, MLJ

include("themes.jl")

# default theme.
theme(:x33m0n)


# use plotly backend
gr()


""" destination directory to save plots to """
PLOTDIR = get(ENV, "JULIA_PLOTDIR", "$(ENV["HOME"])/dev/julia/plots")


# just so I remember this cool fill color
PLOT_HEATMAP_FILLCOLOR = :gist_heat


"""
Simple macro that runs the plot function and stores it to a file because we are working over SSH.
"""
macro plt(cmd, output = "foo.html")
	return :( $cmd; savefig("$PLOTDIR/" * $output); )
end

"""
Plot a confusion matrix.

TODO make a recipe out of this instead. Time to learn something new.
"""
function plt_confmat(
	M::AbstractArray{<:Real,2},
	labels;
	textcolor = :white,
	annosize = 14,
	normalize = true,
	flip = true,
	kwargs...
)
	flip && (M = M[end:-1:1, :])
	normalize && (M = M ./ sum(M, dims = 2))

	function lbl(v)
		l = round(v, digits = 2)
		l = if l == 0
			""
		else
			string(l)
		end

		textcolor = if v > .75
			:black
		else
			:white
		end

		text(l, annosize, textcolor)
	end

	# i find it weird that i need to transpose the matrix back and forth
	M = M |> transpose
	anno = [
		(x.I .- .5 ..., lbl(M[x]))
		for x in eachindex(view(M, 1:size(M, 1), 1:size(M, 2)))
	] |> x -> reshape(x, M |> eachindex |> length) |> reverse
	M = M |> transpose

	StatsPlots.heatmap(
		labels,
		labels |> reverse,
		M,
		xlabel = "predicted value",
		ylabel = "true value",
		c = get(kwargs, :c, PLOT_HEATMAP_FILLCOLOR),
		size = (900, 800),
		annotations = anno;
		kwargs...
	)
end

# TODO fix labels
plt_confmat(cm::MLJ.MLJBase.ConfusionMatrixObject; kwargs...) = plt_confmat(cm.mat; kwargs...)

function plt_marginalhist(x, y, args...; title = "", kwargs...)
	p = marginalhist(x, y, top_margin = 10px, right_margin = 10px, lw = 0, args...; kwargs...)
	#Plots.title!(p[1], title)
	return p
end
