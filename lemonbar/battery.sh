#!/usr/bin/bash

function battery
{
	DEV=/sys/class/power_supply/$1
	if [ ! -d "$DEV" ] # if we do not have a battery this is a desktop computer
	then
		echo -n "$(icon '\ue200')"
		return
	fi

	PERC=`cat $DEV/capacity`
	STATUS=`cat $DEV/status`

	ICON='\ue1ff'
	case "$STATUS" in
		Charging)
			ICON="\ue200"
			;;
		Discharging)
			ICON='\ue1ff'
			if [ "$PERC" -le "20" ]
			then
				ICON='\ue1fd warn'
			elif [ "$PERC" -le "70" ]
			then
				ICON='\ue1fe'
			fi
			;;
		Unknown)
			ICON='\ue201'
			;;
	esac
	echo -n "$(icon $ICON) $PERC"
}
