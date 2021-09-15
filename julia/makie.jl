let
	gridcolor = RGBf(.25, .25, .25)
	textsize = 1.5
	tickcolor = RGBf(.5, .5, .5)
	labelcolor = RGBf(.8, .8, .8)

	Attributes(
		resolution = (1200, 800),
		backgroundcolor = RGBf(.15, .15, .15),
		color = RGBf(1., 1., 1.),
		padding = (0, 0, 0),
		show_legend = true,
		fontsize = 12,
		title = Attributes(
			textsize = 20,
		),
		axis = Attributes(
			grid = Attributes(
				linecolor = (gridcolor, gridcolor),
			),
			ticks = Attributes(
				textsize = (textsize, textsize),
				textcolor = (tickcolor, tickcolor),
				linecolor = (labelcolor, labelcolor),
				gap = 1,
				title_gap = 5,
			),
			names = Attributes(
				textcolor = (labelcolor, labelcolor),
				textsize = (2, 2),
			),
			frame = Attributes(
				frames = ((true, false), (true, false)),
				linecolor = RGBf(.3, .3, .3),
			),
		),
	)
end
