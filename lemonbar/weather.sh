#!/usr/bin/bash
function weather
{
	lat=$1
	lon=$2

	forecast=
	# retry a couple of times in case we are not able to communicate with the service
	for N in 1 .. 5
	do
		weather=`$GOPATH/bin/weather $lat $lon 2> /dev/null`
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
		"partlycloudy"*|fair)
			H=$(date +"%H")
			if [ $H -gt "20" ] || [ $H -lt "6" ]; then # night
				ICON='\ue232'
			else # day
				ICON='\ue231'
			fi
			;;
		"cloudy")
			ICON='\ue22b'
			;;
		# rain
		"lightrain"*|*sleet*|"rainshowers")
			ICON='\ue230'
			;;
		rain)
			ICON='\ue22f'
			;;
		"heavyrain"*)
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
		"clearsky"*)
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
