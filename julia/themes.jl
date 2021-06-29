using Plots, Plots.PlotMeasures, Plots.PlotThemes

begin
	DEFAULTS = Dict(
		:margin => 30px,
		:bottom_margin => 50px,
		:top_margin => 50px,
		:left_margin => 50px,
		#:title_location => :left,
		#:legend => :topleft,
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
		palette = [RGB(.95, .95, .95), RGB(.81, .2, .2), RGB(.16, .50, .59), RGB(.8, .45, .2), RGB(.20, .69, .45), RGB(.58, .16, .76)],
		fg_color = RGB(1, 1, 1);
		DEFAULTS...
	)

	PlotThemes._themes[:x33m0nlight] = PlotThemes.PlotTheme(
		background = RGB(.99, .99, .99),
		background_color_legend = RGBA(.9, .9, .9, .7),
		foreground_color_legend = RGBA(.1, .1, .1, 0),
		foreground_color_border = RGB(.1, .1, .1),
		legendfont = font(8, RGB(.1, .1, .1)),
		guidefont = font(8, RGB(.1, .1, .1)),
		tickfont = font(8, RGB(.2, .2, .2)),
		palette = [RGB(.15, .15, .15), RGB(.81, .2, .2), RGB(.16, .50, .59), RGB(.8, .45, .2), RGB(.20, .69, .45)],
		fg_color = RGB(0, 0, 0);
		DEFAULTS...
	)
end
