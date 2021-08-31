using MLJ.MLJBase, Plots, StatsBase, KernelDensity

include("themes.jl")

# default theme.
theme(:x33m0n)


""" plotting backend """
JULIA_PLOTBACKEND = get(ENV, "JULIA_PLOTBACKEND", "gr")

""" default output file - depends on the backend """
DEFAULT_PLOT_OUTPUT = if JULIA_PLOTBACKEND == "gr"
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

"""
	xhistogram(::Array{Real,1})

X(imon)Histogram. I don't like the usual implementation of histograms. This is a nice line version.
"""
@userplot XHistogram

@recipe function f(p::XHistogram; normalize = nothing)
	y = p.args[1]

	# in case there are missing values in y we filter them out silently
	if eltype(y) <: Union{Missing,<:Real}
		y = convert(Vector{Float64}, filter(!ismissing, y))
	end

	bins --> 10
	label --> nothing

	nbins = plotattributes[:bins]
	H = if typeof(nbins) <: Union{UnitRange{<:Real},AbstractArray{<:Real}}
		StatsBase.fit(StatsBase.Histogram, y, nbins)
	else
		StatsBase.fit(StatsBase.Histogram, y, nbins = nbins)
	end

	!isnothing(normalize) && (H = StatsBase.normalize(H, mode = normalize))

	xs = (H.edges |> first |> collect)[1:end-1]

	@series begin
		seriestype --> :bar
		x := xs
		y := H.weights

		if plotattributes[:seriestype] == :line
			linewidth --> 1
			fillrange --> 0
			fillalpha --> .3
		elseif plotattributes[:seriestype] == :bar
			linewidth --> 0
		end

		()
	end
end

@recipe function f(::Type{Val{:xhistogram}}, x, y, z;)
	# TODO
end

"""
	confmatplot(M::Array{Real,2}; normalize = true, textcolor = nothing, annosize = 10)

Plot a confusion matrix.
"""
@userplot ConfMatPlot

@recipe function f(p::ConfMatPlot; normalize = true, textcolor = nothing, annosize = 10, hidezero = true)
	M = p.args[1]
	M = M[end:-1:1, :]

	if normalize
		M = M ./ sum(M, dims = 2)
	end

	lum(c) = 0.2126c.r + 0.7152c.g + 0.0722c.b

	# labels - create dummy one in case does not exist
	L = get(plotattributes, :label, [])
	if isempty(L)
		L = ["y$i" for i = 1:size(M, 1)]
	end
	L = L |> vec

	# function to create the annotation text
	# tries to adapt the color and hides 0 values
	function lbl(v)
		l = round(v, digits = 2)
		l = l == 0 && hidezero ? "" : string(l)

		# calculate text color
		txtc = if isnothing(textcolor)
			v = !normalize ? v / maximum(M) : v
			(cgrad(PLOT_HEATMAP_FILLCOLOR)[v] |> lum) < .8 ? :white : :black
		else
			textcolor
		end

		text(l, annosize, txtc)
	end

	# i find it weird that i need to transpose the matrix back and forth
	M = M |> transpose
	anno = [
		(x.I .- .5 ..., lbl(M[x]))
		for x in eachindex(view(M, 1:size(M, 1), 1:size(M, 2)))
	] |> x -> reshape(x, M |> eachindex |> length) |> reverse
	M = M |> transpose

	@series begin
		seriescolor --> PLOT_HEATMAP_FILLCOLOR
		xguide --> "predicted"
		yguide --> "truth"
		clims --> (0., 1.)
		fillalpha --> 1.
		label := nothing

		annotations := anno
		x --> L
		y --> reverse(L)
		z := Surface(M)
		seriestype := :heatmap

		()
	end
end

"""
this one does not work because of bug in recipes i think
"""
@recipe function f(::Type{MLJBase.ConfusionMatrixObject}, cm::MLJBase.ConfusionMatrixObject;)
	seriestype := :confmatplot
	labels := cm.labels
	cm.mat
end

"""
StatsPlots.corrplot takes ages with larger datasets, this is most likely because of the scatter plots.
I find the histogram2d to be the most valuable information in this plot so I made this to focus on that part.
"""
@userplot XCorrPlot

@recipe function f(p::XCorrPlot)
	M = p.args[1]

	# number of dimensions
	D = size(M, 2)
	g = grid(D, D)
	layout := g

	# prepare a grid layout for upper right corner that will be blank
	I = zeros(Int, D, D)
	pltidx = 1
	for i = axes(M, 2), j = axes(M, 2)
		if i < j
			g[i, j].attr[:blank] = true
		else
			I[i, j] = pltidx
			pltidx += 1
		end
	end

	# labels - create dummy one in case does not exist
	L = get(plotattributes, :label, [])
	if isempty(L)
		L = ["y$i" for i = 1:D]
	end

	# by default each single plot does not have a lot of information
	# around them, this is more for the plots that are along the sides

	label := nothing
	margin := 1mm
	bottom_margin := 1mm
	top_margin := 1mm
	left_margin := 1mm
	right_margin := 1mm
	ticks := nothing
	grid := false

	# all histograms should share same numbers of bins
	bins --> 50

	# histograms in the diagonal
	for d = axes(M, 2)
		@series begin
			seriestype := :histogram
			subplot := I[d, d]
			grid := true
			seriescolor := 1

			if d == D
				xticks := :auto
				xguide := L[end]
			elseif d == 1
				yticks := :auto
				yguide := L[1]
				left_margin := 50px
			end

			@view M[:, d]
		end
	end

	# 2d histograms in upper corner
	for i = axes(M, 2), j = axes(M, 2)
		i <= j && continue
		@series	begin
			if j == 1
				yguide := L[i]
				left_margin := 50px
				yticks := :auto
			end

			if i == D
				xguide := L[j]
				bottom_margin := 50px
				xticks := :auto
			end

			seriestype := :histogram2d
			subplot := I[i, j]
			colorbar := :none
			@view(M[:, j]), @view(M[:, i])
		end
	end
end

@recipe function f(::Type{Val{:xdensity}}, x, y, z; bandwidth = KernelDensity.default_bandwidth(y))
	kde = KernelDensity.kde(y, npoints = 200, bandwidth = bandwidth)
	x := kde.x
	y := kde.density
	seriestype := :path
	()
end
