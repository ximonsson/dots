using Plots.PlotThemes

begin
	DEFAULTS = Dict(
		:margin => 30px,
		:bottom_margin => 50px,
		:top_margin => 50px,
		:title_location => :left,
		:legend => :topleft,
		:size => (800, 500),
		:fillalpha => .7,
	)

	PlotThemes._themes[:x33m0n] = PlotThemes.PlotTheme(
		background = RGB(.15, .15, .15),
		background_color_legend = RGBA(.15, .15, .15, .7),
		foreground_color_border = RGB(.3, .3, .3),
		foreground_color_legend = RGBA(.5, .5, .5, 0),
		legendfont = font(8, RGB(.8, .8, .8)),
		guidefont = font(8, RGB(.8, .8, .8)),
		tickfont = font(8, RGB(.5, .5, .5)),
		palette = [RGB(1, 1, 1), RGB(1., .3, .3), RGB(.5, 1, .5)],
		fg_color = RGB(1, 1, 1);
		DEFAULTS...
	)

	PlotThemes._themes[:x33m0nlight] = PlotThemes.PlotTheme(
		background = RGB(.95, .95, .95),
		background_color_legend = RGBA(.15, .15, .15, .7),
		foreground_color_border = RGB(.3, .3, .3),
		foreground_color_legend = RGBA(.5, .5, .5, 0),
		legendfont = font(8, RGB(.8, .8, .8)),
		guidefont = font(8, RGB(.1, .1, .1)),
		tickfont = font(8, RGB(.5, .5, .5)),
		palette = [RGB(0, 0, 0), RGB(1., .3, .3), RGB(.5, 1, .5)],
		fg_color = RGB(0, 0, 0);
		DEFAULTS...
	)
end
