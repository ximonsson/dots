#!/usr/bin/bash
function DATE
{
	DATETIME=$(date "+%a %b %d")
	DATETIME="%{T2}\ue052%{T-}%{F$GRAY}$(date "+%a %b %d")%{F$CYAN}  $(date "+%R")%{F-}"
	echo -n "$DATETIME"
}
