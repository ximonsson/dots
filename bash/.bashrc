#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# set sexy PS1
white="\e[37m"
default="\e[0m"
cyan="\e[36m"
gray="\e[30m"

color=$cyan

W="\[\e[106;30m\] \W \[$default\]"
H="\[\e[7m\] \H \[$default\]"
PS1="\[\e[96m\]───╼ \[$default\]"

PS1="$H$W$PS1"
PS1R="$white[ $color$USER@$HOSTNAME$white ]"
prompt ()
{
	printf "%*s\r" $(tput cols) "$PS1R"
}
unset white
unset color
unset default

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion/*

# Load custom environment variables
[ -r ~/.bash_env ] && . ~/.bash_env

# Load custom alias definitions.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Autostart X server
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
