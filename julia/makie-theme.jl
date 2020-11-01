begin
	local gridcolor = RGB(.5, .5, .5)
	local textsize = 2.5
	local labelcolor = RGB(.8, .8, .8)

	Attributes(
		backgroundcolor = RGB(.15, .15, .15),
		color = RGB(.9, .9, .9),
		axis = Attributes(
			grid = Attributes(
				linecolor = (gridcolor, gridcolor),
			),
			ticks = Attributes(
				textsize = (textsize, textsize),
				textcolor = (gridcolor, gridcolor),
			),
			names = Attributes(
				textcolor = (labelcolor, labelcolor),
				textsize = (3, 3),
			),
		),
	)
end
