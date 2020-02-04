#!/usr/bin/bash
function weather
{
	country=$1
	region=$2
	city=$3

	forecast=
	# retry a couple of times in case we are not able to communicate with the service
	for N in 1 .. 5
	do
		weather=`$GOPATH/bin/weather "$country" "$region" "$city" 2> /dev/null`
		if [ $? -eq 0 ]; then
			#>&2 echo "succeeded getting weather"
			forecast=`echo $weather | cut -d ":" -f2`
			temp=`echo $weather | cut -d ":" -f1`
			weather="$temp°"
			break
		else
			#>&2 echo "failed"
			weather="..."
			sleep 1
		fi
	done
	# icon
	ICON='\ue25d warn'
	case `echo $forecast | awk '{print tolower($0)}'` in
		# cloudy ones
		"partly cloudy"|fair)
			ICON='\ue231'
			;;
		"cloudy")
			ICON='\ue22b'
			;;
		# rain
		"light rain"*|*sleet*|"rain showers")
			ICON='\ue230'
			;;
		rain)
			ICON='\ue22f'
			;;
		"heavy rain"*)
			ICON='\ue22d'
			;;
		# snow
		*snow*)
			ICON='\ue22e'
			;;
		# nice weather
		sunny)
			ICON='\ue234'
			;;
		"clear sky")
			H=$(date +"%H")
			if [ $H -gt "20" ] || [ $H -lt "6" ]; then # night
				ICON='\ue233'
			else # day
				ICON='\ue234'
			fi
			;;
		# windy
		fog|windy)
			ICON='\ue235'
			;;
		# thunder
		*"thunder")
			ICON='\ue22c'
			;;
	esac
	echo -n "$(icon $ICON) $weather"
}
