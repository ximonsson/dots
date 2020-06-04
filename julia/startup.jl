using Plots, Plots.PlotMeasures

""" Set default plot theme """

const PLOT_THEME = (
	background = RGB(.15, .15, .15),
	margin = 30px,
	bottom_margin = 50px,
	top_margin = 70px,
	title_location = :left,
	legendfontsize = 5,
	background_color_legend = RGBA(.15, .15, .15, .7),
	foreground_color_border = RGB(.3, .3, .3),
	foreground_color_legend = RGBA(.5, .5, .5, 0),
	tickfontcolor = RGB(.5, .5, .5),
	legend = :topleft,
	size = (1200, 700),
)

default(; PLOT_THEME...)
