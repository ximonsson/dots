using Plots, Plots.PlotMeasures

""" Set default plot theme """

begin

local PLOT_THEME = (
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
	foreground_color_subplot = RGB(.5, .5, .5),
	titlefontcolor = RGB(1, 1, 1),
	palette = [RGB(1, 1, 1), RGB(1, .3, .3), RGB(.8, .6, .4), RGB(.5, 1, .5), RGB(.3, .7, 1)],
	legend = :topleft,
	size = (1200, 700),
	fillalpha = .3,
)

default(; PLOT_THEME...)

end
