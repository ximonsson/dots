using StatsPlots, Plots.PlotMeasures, MLJ

include("themes.jl")

# default theme.
theme(:x33m0n)


# use plotly backend
plotly()


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
"""
function plt_confmat(cm::AbstractArray{<:Real,2}; normalize = true, kwargs...)
	normalize && (cm = cm ./ sum(cm, dims = 1))

	labels = [
		(x.I..., text(string(round(cm[x], digits = 2)), 8, :white))
		for x in eachindex(view(cm, 1:size(cm, 1), 1:size(cm, 2)))
	]
	labels = reshape(labels, cm |> eachindex |> length)

	cm = cm |> transpose

	heatmap(
		cm,
		xlabel = "predicted value",
		ylabel = "true value",
		c = :gist_heat,
		size = (900, 800),
		annotations = labels;
		kwargs...
	)
end

plt_confmat(cm::MLJ.MLJBase.ConfusionMatrixObject; kwargs...) = plt_confmat(cm.mat; kwargs...)

function plt_marginalhist(x, y, args...; title = "", kwargs...)
	p = marginalhist(x, y, top_margin = 10px, right_margin = 10px, lw = 0, args...; kwargs...)
	#Plots.title!(p[1], title)
	return p
end
