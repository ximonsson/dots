# --------------------------------------------------------------------------------------
# .xinitrc
# --------------------------------------------------------------------------------------

source $HOME/.xprofile

# no bell sounds (so annoying)
xset -b

# keyring
eval $(ssh-agent)

# start window manager
session=${1:-$WM}
case $session in
	openbox) exec openbox-session;;
	bspwm)   exec bspwm;;
	*)       exec $session;;
esac
