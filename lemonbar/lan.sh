function lan
{
	device=$1
	connected=`cat /sys/class/net/$device/carrier`
	if [ "$connected" == "1" ]
	then
		echo -n "$(icon '\ue20e') eth0"
	else
		echo -n ""
	fi
}

function wlan
{
	device=$1
	essid=`iwconfig $device | grep "ESSID" | awk -F"[]:[]" '{ print $2 }' | cut -d "\"" -f2`
	#ip=`ip address show dev $device | grep -m 1 -e "inet .* global.*$device" | awk '{ print $2 }' | cut -d "/" -f1`
	link=`cat /proc/net/wireless | grep $device | awk '{ print $3 }' | cut -d "." -f1`

	ICON='\ue21f'
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

