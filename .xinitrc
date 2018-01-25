# --------------------------------------------------------------------------------------
# .xinitrc
# --------------------------------------------------------------------------------------

source $HOME/.xprofile

session=${1:-bspwm}
case $session in
	openbox) exec openbox-session;;
	bspwm)   exec bspwm;;
	*)       exec $session;;
esac
