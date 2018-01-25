BIN=$HOME/projects/go/bin/weather
#BIN=$GOPATH/bin/weather

CITY=Stockholm
REGION=Stockholm
COUNTRY=Sweden

if [[ $# -eq 3 ]]; then
	CITY=$1
	REGION=$2
	COUNTRY=$3
fi

#echo "$BIN $COUNTRY $REGION $CITY"
ans=`$BIN $COUNTRY $REGION $CITY`

if [[ $? != 0 ]]; then
	echo "[no service]"
else
	echo -n "$CITY $COUNTRY "
	echo "`echo $ans | cut -d ":" -f1`° `echo $ans | cut -d ":" -f2`"
	#echo "lol"
fi
