#!/usr/bin/bash
function weather
{
	lat=$1
	lon=$2
	summary=
	temp="..."
	res=$(curl -s --retry 5 "https://api.met.no/weatherapi/nowcast/2.0/complete?lat=$lat&lon=$lon")

	if [ $? -eq 0 ]; then
		temp=$(echo $res | jq -r '.properties.timeseries[0].data.instant.details.air_temperature')
		summary=$(echo $res | jq -r '.properties.timeseries[0].data.next_1_hours.summary.symbol_code')
	fi

	# icon
	ICON='\ue25d warn'
	case $summary in
		# cloudy ones
		"partlycloudy"*|fair*)
			H=$(date +"%H")
			if [ $H -gt "20" ] || [ $H -lt "6" ]; then # night
				ICON='\ue232'
			else # day
				ICON='\ue231'
			fi
			;;
		"cloudy"*)
			ICON='\ue22b'
			;;
		# rain
		"lightrain"*|*sleet*|"rainshowers")
			ICON='\ue230'
			;;
		rain*)
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
		fog*|windy*)
			ICON='\ue235'
			;;
		# thunder
		*"thunder"*)
			ICON='\ue22c'
			;;
	esac
	echo -n "$(icon $ICON) $temp"
}
