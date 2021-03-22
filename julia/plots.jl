using StatsPlots, Plots.PlotMeasures, MLJ.MLJBase, Plots

include("themes.jl")

# default theme.
theme(:x33m0n)


""" plotting backend """
JULIA_PLOTBACKEND = get(ENV, "JULIA_PLOTBACKEND", "gr")

""" default output file - depends on the backend """
const DEFAULT_PLOT_OUTPUT = if JULIA_PLOTBACKEND == "gr"
	gr()
	"foo.png"
elseif JULIA_PLOTBACKEND == "plotly"
	plotly()
	"foo.html"
else
	@error "Not sure what backend this is" JULIA_PLOTBACKEND
end

""" destination directory to save plots to """
PLOTDIR = get(ENV, "JULIA_PLOTDIR", "$(ENV["HOME"])/dev/julia/plots")

""" just so I remember this cool fill color """
PLOT_HEATMAP_FILLCOLOR = :gist_heat


"""
Simple macro that runs the plot function and stores it to a file because we are working over SSH.
"""
macro plt(cmd, output = DEFAULT_PLOT_OUTPUT)
	return :( $cmd; savefig("$PLOTDIR/" * $output); )
end

""" shorthand for marginal histograms that look weird from the start. """
function plt_marginalhist(x, y, args...; title = "", kwargs...)
	p = marginalhist(x, y, top_margin = 10px, right_margin = 10px, lw = 0, args...; kwargs...)
	#Plots.title!(p[1], title)
	return p
end


"""
	confmatplot(M::Array{Real,2}; classes = nothing, flip = true, normalize = true, textcolor = nothing, annosize = 10)

Plot a confusion matrix.
"""
@userplot ConfMatPlot

@recipe function f(
	p::ConfMatPlot;
	classes = nothing,
	flip = true,
	normalize = true,
	textcolor = nothing,
	annosize = 10,
)
	M = p.args[1]

	M = flip ? M[end:-1:1, :] : M

	if normalize
		M = M ./ sum(M, dims = 2)
	end

	# function to create the annotation text
	# tries to adapt the color and hides 0 values
	function lbl(v)
		l = round(v, digits = 2)
		l = l == 0 ? "" : string(l)

		# TODO
		# come up a way of doing this based on the color so it can be used
		# for non-normalized confusion matrices also

		textcolor = if isnothing(textcolor) && normalize
			textcolor = v > .75 ? :black : :white
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

	ticks = isnothing(classes) ? (1:size(M, 1)) : classes

	@series begin
		seriescolor --> PLOT_HEATMAP_FILLCOLOR
		xguide --> "predicted"
		yguide --> "truth"
		clims --> (0., 1.)

		annotations := anno
		x := ticks
		y := (flip ? reverse(ticks) : ticks)
		z := Surface(M)
		seriestype := :heatmap

		()
	end
end

"""
this one does not work because of bug in recipes i think
"""
@recipe function f(cm::MLJBase.ConfusionMatrixObject; classes = nothing)
	seriestype := :confmatplot
	cm.labels, cm.labels, cm.mat
end
