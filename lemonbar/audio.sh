#!/usr/bin/bash

function phones
{
	#STATE=`grep -A 10 'Node 0x1f' /proc/asound/card0/codec#0 | grep 'Pin-ctls'`
	#[[ "$STATE" != *OUT ]]
	STATE=`pactl list sinks | grep "Active Port"`
	[[ $STATE == *headphones* ]]
}

function volume
{
	VOL=`amixer sget Master | grep "Left:"`
	STATUS=`echo $VOL | awk -F"[]%[]" '{ print $5 }'`
	if [ -z "$VOL" ]
	then
		VOL=`amixer sget Master | grep "Mono:"`
		STATUS=`echo $VOL | awk -F"[]%[]" '{ print $7 }'`
	fi
	VOL=`echo $VOL | awk -F"[]%[]" '{ print $2 }'`

	ICON="$(icon '\ue202' "warn")" # if speakers are muted
	if [ $STATUS == "on" ]
	then
		if phones
		then # headphones are connected
			ICON=$(icon '\ue04d')
		else # speakers
			ICON=$(icon '\ue203')
			[ $VOL -eq 0 ] && ICON=$(icon '\ue204') # zero volume
		fi
	fi
	echo -n "$ICON %{F-}$VOL"
}

