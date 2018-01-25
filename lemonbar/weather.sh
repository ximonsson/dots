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
		weather=`$HOME/projects/go/bin/weather $country $region $city 2> /dev/null`
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
	ICON='\ue25d'
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
		sunny|"clear sky")
			ICON='\ue234'
			;;
		# windy
		fog|windy)
			ICON='\ue235'
			;;
	esac
	echo -n "$(icon $ICON) $weather"
}
