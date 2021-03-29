"""
startup.jl

most helper files would increase startup time for julia a little too much and
require packages to be installed so here are some functions that help with the
loading of the files.
"""

EXTRA_LOAD_PATH = get(ENV, "JULIA_EXTRA_LOAD_PATH", ENV["HOME"] * "/dev/julia")

macro includehelper(f)
	return :( include(Base.Filesystem.joinpath(EXTRA_LOAD_PATH, $f)) )
end
