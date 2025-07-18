#!/bin/sh

# --------------------------------------------------------------------------------------
# .xinitrc
# --------------------------------------------------------------------------------------

userresources="$HOME/.Xresources"
xinitdir="/etc/X11/xinit"

source $HOME/.xprofile

# no bell sounds (so annoying)
xset -b

# keyring
eval $(ssh-agent)

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# start window manager
session=${1:-$WM}
case $session in
	openbox) exec openbox-session;;
	bspwm)   exec bspwm;;
	*)       exec $session;;
esac
