#
# ls
#
alias ls="ls --color=auto"
alias l="ls -l"
alias ll="l -aF"

#
# grep
# in color and alias for searching directories
#
alias grep="grep --color"
alias fsearch="grep -RIn"

#
# Monitors
#
# for switching between monitors
function change_monitor
{
	xrandr --output $1 --auto --output $2 --off
	$HOME/.fehbg
	$XDG_CONFIG_HOME/lemonbar/lemonbarrc &
	#conky-restart
}
LAPTOP_DISPLAY=LVDS1
alias xmonitor='change_monitor $MONITOR $LAPTOP_DISPLAY'
alias xdisplay='change_monitor $LAPTOP_DISPLAY $MONITOR'

#
# Good to have
#
alias pdf-merge='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$1.pdf file1.pdf file2.pdf'

alias change-font="printf '\e]710;%s\007'"

# AUR update
alias aur-update='(cd $XDG_CONFIG_HOME/aur && ./update)'

alias gubenerstrasse-samba='sudo mount -t cifs //FILE_SHARE/files $HOME/mnt/samba/ -o ip=192.168.2.253'

# keep forgetting this one
alias wifi="nmtui"

# conky
alias conky-restart="pkill --signal SIGHUP conky"

# function for restarting USB device
function restart-usb
{
	DEVICE=$1
	FILE="/sys/bus/usb/devices/$DEVICE/authorized"
	echo $FILE
	sudo sh -c "echo 0 >> $FILE"
	sudo sh -c "echo 1 >> $FILE"
}

#
# Mediaserver
#
function media
{
	url="$MEDIASERVER/$1/"
	if [ "$2" ]
	then
		url="$url?id=$2"
	fi
	curl $url | python -m json.tool | less
}

function media-play-episode
{
	mplayer "$MEDIASERVER/shows/stream/?id=$1&season=$2&episode=$3"
}

#
# Audio
#
alias pulse-analog="pactl set-card-profile $AUDIO_CARD $AUDIO_PROFILE_ANALOG"
alias pulse-hdmi="pactl set-card-profile $AUDIO_CARD $AUDIO_PROFILE_DIGITAL"
