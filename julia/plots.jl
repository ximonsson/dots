using Plots, Plots.PlotMeasures

""" Set default plot theme """

begin

@info "setting plot theme"

local PLOT_THEME = (
	background = RGB(.15, .15, .15),
	margin = 10px,
	bottom_margin = 20px,
	top_margin = 30px,
	title_location = :left,
	legendfont = font(7, RGB(.8, .8, .8)),
	titlefont = font(10, RGB(1., 1., 1.)),
	guidefont = font(7, RGB(.8, .8, .8)),
	tickfont = font(6, RGB(.5, .5, .5)),
	background_color_legend = RGBA(.15, .15, .15, .7),
	foreground_color_border = RGB(.3, .3, .3),
	foreground_color_legend = RGBA(.5, .5, .5, 0),
	tickfontcolor = RGB(.5, .5, .5),
	foreground_color_subplot = RGB(.6, .6, .6),
	titlefontcolor = RGB(1, 1, 1),
	palette = [RGB(1, 1, 1), RGB(1, .3, .3), RGB(1., .5, .2), RGB(.5, 1, .5), RGB(.3, .7, 1)],
	legend = :topleft,
	size = (800, 500),
	fillalpha = .3,
)

default(; PLOT_THEME...)

end
