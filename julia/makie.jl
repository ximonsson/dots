let
	labelcolor = RGBf(.5, .5, .5)
	backgroundcolor = RGBf(.1, .1, .1)
	gridcolor = backgroundcolor
	tickcolor = gridcolor
	bgcolor = RGBf(.15, .15, .15)
	labelpadding = 10
	palette = [
		(.95, .95, .95),
		(.81, .2, .2),
		(.16, .50, .5),
		(.8, .45, .2),
		(.20, .69, .4),
		(.58, .16, .7),
	]

	global theme_x33m0n = () -> Attributes(
		resolution = (1000, 700),
		backgroundcolor = backgroundcolor,
		textcolor = RGBf(.8, .8, .8),
		#linecolor = :white,
		color = RGBf(1., 1., 1.),
		padding = (0, 0, 0),
		show_legend = true,
		font = "Roboto Mono",
		fontsize = 11,

		palette = (
			color = [ RGBAf(p..., 1.) for p in palette ],
			patchcolor = [ RGBAf(p..., .8) for p in palette ],
		),

		Axis = Attributes(
			backgroundcolor = bgcolor,
			rightspinevisible = false,
			topspinevisible = false,
			leftspinevisible = false,
			bottomspinevisible = false,

			titlesize = 16,
			titlegap = 20,
			titlealign = :left,
			titlecolor = :white,

			xgridcolor = gridcolor,
			xlabelpadding = labelpadding,
			xlabelcolor = labelcolor,
			xtickcolor = tickcolor,

			ygridcolor = gridcolor,
			ylabelcolor = labelcolor,
			ylabelpadding = labelpadding,
			ytickcolor = tickcolor,
		),

		Axis3 = Attributes(
			xspinesvisible = false,
			yspinesvisible = false,
			zspinesvisible = false,

			xypanelcolor = bgcolor,
			xzpanelcolor = bgcolor,
			xlabelcolor = labelcolor,
			xlabelpadding = labelpadding,
			xgridcolor = gridcolor,
			xtickcolor = tickcolor,

			yzpanelcolor = bgcolor,
			ylabelcolor = labelcolor,
			ylabelpadding = labelpadding,
			ygridcolor = gridcolor,
			ytickcolor = tickcolor,

			zpanelcolor = bgcolor,
			zlabelcolor = labelcolor,
			zlabelpadding = labelpadding,
			zgridcolor = gridcolor,
			ztickcolor = tickcolor,
		),

		Legend = Attributes(
			bgcolor = (backgroundcolor, .35),
			framewidth = 0.,
			halign = :left,
			titlecolor = labelcolor,
		)
	)
end
