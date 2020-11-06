begin
	local gridcolor = RGB(.25, .25, .25)
	local textsize = 1.5
	local tickcolor = RGB(.5, .5, .5)
	local labelcolor = RGB(.8, .8, .8)

	Attributes(
		resolution = (1200, 800),
		backgroundcolor = RGB(.15, .15, .15),
		color = RGB(1., 1., 1.),
		padding = (0, 0, 0),
		show_legend = true,
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
				linecolor = RGB(.3, .3, .3),
			),
		),
	)
end
