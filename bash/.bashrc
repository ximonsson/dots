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
#PS1="\[\e[96m\]»\[$default\]"
PS1="\[\e[96m\]───╼ \[$default\]"

#PS1="\[$color\]┌─╼ [ \[$default\]\W\[$color\] ] \n\[$color\]└──────╼\[$default\] "
PS1="$H$W$PS1"
PS1R="$white[ $color$USER@$HOSTNAME$white ]"
prompt ()
{
	#PS1=$(printf "%*s\r%s" $(tput cols) "$PS1R" "$PS1")
	printf "%*s\r" $(tput cols) "$PS1R"
}
#PROMPT_COMMAND=prompt
unset white
unset color
unset default

#PS1=''
#print_pre_prompt ()
#{
#    PS1L=$PWD
#    if [[ $PS1L/ = "$HOME"/* ]]; then PS1L=\~${PS1L#$HOME}; fi
#    PS1R=$USER@$HOSTNAME
#    printf "%s%$(($COLUMNS-${#PS1L}))s" "$PS1L" "$PS1R"
#}
#PROMPT_COMMAND=print_pre_prompt

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion/*

# Load custom environment variables
[ -r ~/.bash_env ] && . ~/.bash_env

# Load custom alias definitions.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Autostart X server
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec startx
fi
