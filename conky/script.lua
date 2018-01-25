--this is a lua script for use in conky
require 'cairo'

function conky_bg()
	if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
	cr = cairo_create(cs)
	
	--settings
	line_width=1
	top_left_x=0
	top_left_y=0
	rec_width=conky_window.width
	rec_height=conky_window.height
	red=0.8
	green=0.8
	blue=0.8
	alpha=1
	--draw it
	cairo_set_line_width (cr, line_width)
	cairo_rectangle (cr, top_left_x, top_left_y, rec_width, rec_height)
	cairo_set_source_rgba (cr, red, green, blue, alpha)
	cairo_stroke (cr)
	
	cairo_destroy (cr)
    cairo_surface_destroy (cs)
    cr=nil
end

function conky_format (format, value)
	return string.format (format, conky_parse(value))
end
