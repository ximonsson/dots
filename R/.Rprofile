options(repos=c(CRAN="https://cloud.r-project.org/"))

set.ggplot_theme <- function(...) {
	# set my cool theme as default for ggplot2
	plot.theme <- theme(
			plot.background = element_rect(fill = "#222222", colour = "#222222"),
			panel.background = element_rect(fill = NA),
			panel.grid.major = element_line(color="#2a2a2a"),
			panel.grid.minor = element_line(color="#2a2a2a"),
			axis.text = element_text(color="#888888"),
			axis.title = element_text(color="#eeeeee"),
			plot.title = element_text(color="#eeeeee", face="bold"),
			plot.subtitle = element_text(color="#888888"),
			legend.background = element_rect(fill = NA),
			legend.key = element_rect(fill = NA, color = NA),
			legend.text = element_text(color="#eeeeee"),
			legend.title = element_text(color = "#eeeeee"),
		)
	theme_set(theme_bw() + plot.theme)
}
setHook(packageEvent("ggplot2", "attach"), set.ggplot_theme)
