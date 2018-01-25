# return CPU information
function cpu
{
	cpu=`ps -eo pcpu | grep -Ev "0.0|%CPU" | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print int(sum)}'`
	echo -n "$(icon '\ue021') %{F-}$cpu"
}

# fs returns filesystem information
function fs
{
	FS=(`df -h / | awk 'NR == 2 {print $3" "$2}'`)
	FS="$(icon '\ue1e0') ${FS[0]} %{F$GRAY}${FS[1]}%{F-}"
	echo -n "$FS"
}

# ram returns RAM information
function ram
{
	RAM=`free -m | grep Mem: | awk '{ print int($3 / $2 * 100) }'`
	RAM="$(icon '\ue0c5') %{F-}$RAM"
	echo -n "$RAM"
}

# datetime returns date and time information
function datetime
{
	TIME="$(icon '\ue015') $(date "+%R")"
	DATE="$(icon '\ue225') %{F-}$(date "+%a") %{F$GRAY}$(date "+%d.%m.%Y")"
	echo -n "$DATE   $TIME"
}
