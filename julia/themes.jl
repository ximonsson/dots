using Plots.PlotThemes

PlotThemes._themes[:x33m0n] = PlotThemes.PlotTheme(
	background = RGB(.15, .15, .15),
	margin = 50px,
	bottom_margin = 50px,
	top_margin = 70px,
	title_location = :left,
	background_color_legend = RGBA(.15, .15, .15, .7),
	foreground_color_border = RGB(.3, .3, .3),
	foreground_color_legend = RGBA(.5, .5, .5, 0),
	legendfont = font(7, RGB(.8, .8, .8)),
	guidefont = font(9, RGB(.8, .8, .8)),
	tickfont = font(7, RGB(.5, .5, .5)),
	legend = :topleft,
	size = (800, 500),
	palette = [RGB(1, 1, 1), RGB(1., .3, .3), RGB(.5, 1, .5)],
	fillalpha = .7,
	#fc = :gist_heat,
	fg_color = RGB(1, 1, 1),
)
