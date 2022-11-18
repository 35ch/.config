date=$(date +"%Y-%m-%d")
time=$(date +"%T")
ram=$(free | grep Mem | awk '{printf "%.0f\n", $3/$2 *100}')
wifi_str=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
inst=$(xbps-query -l | awk 'END {print NR}')
upd=$(xbps-install -Sun | awk "/a/{++cnt} END {print cnt}")

if [ $wifi_str -le 12 ]
then
	wifi="▁▁▁▁▁▁▁▁"

elif [ $wifi_str -gt 12 -a $wifi_str -le 25 ]
then
	wifi="▁▁▁▁▁▁▁▂"

elif [ $wifi_str -gt 25 -a $wifi_str -le 37 ]
then
	wifi="▁▁▁▁▁▁▂▃"

elif [ $wifi_str -gt 37 -a $wifi_str -le 50 ]
then
	wifi="▁▁▁▁▁▂▃▄"

elif [ $wifi_str -gt 50 -a $wifi_str -le 62 ]
then
	wifi="▁▁▁▁▂▃▄▅"

elif [ $wifi_str -gt 62 -a $wifi_str -le 75 ]
then
	wifi="▁▁▁▂▃▄▅▆"
elif [ $wifi_str -gt 75 -a $wifi_str -le 87 ]
then
	wifi="▁▁▂▃▄▅▆▇"

elif [ $wifi_str -gt 87 -a $wifi_str -le 100 ]
then
	wifi="▁▂▃▄▅▆▇▉"

else
	wifi="NO CONNECTION"

fi	

if [ upd="" ]
then
	upd="0"
fi

echo "( XBPS: $inst packages installed, $upd ready to update ( RAM: $ram% ( $time ( $date ) $wifi "
