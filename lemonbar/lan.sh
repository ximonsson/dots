function lan
{
	device=$1

	stat /sys/class/net/$device/operstate 2>&1 > /dev/null
	if [ "$?" -ne "0" ]
	then
		echo -n ""
		return
	fi

	# check if the device is running
	state=`cat /sys/class/net/$device/operstate`
	if [ "$state" == "down" ]
	then
		echo -n ""
		return
	fi

	# check if it is connected
	connected=`cat /sys/class/net/$device/carrier`
	if [ "$connected" == "1" ]
	then
		echo -n "$(icon '\ue20e') $device"
	else
		echo -n ""
	fi
}

function wlan
{
	device=$1
	essid=`iwctl station $device show | grep -i "connected network" | awk '{ print $3 }'`
	link=`cat /proc/net/wireless | grep $device | awk '{ print $3 }' | cut -d "." -f1`

	ICON='\ue21f warn'
	if [[ $essid != *off* ]]
	then
		ICON='\ue222'
		if [ "$link" -le "20" ]
		then
			ICON='\ue220'
		elif [ "$link" -le "50" ]
		then
			ICON='\ue221'
		fi
	fi
	echo -n "$(icon $ICON) $essid"
}
