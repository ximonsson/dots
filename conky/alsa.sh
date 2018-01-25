CHANNEL=$1
VOL=`amixer sget Master | grep "$CHANNEL:" | awk -F"[]%[]" '{ print $2 }'`
echo $VOL
