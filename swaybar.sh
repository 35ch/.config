date=$(date +"%Y-%m-%d")
time=$(date +"%T")
vol=$(pactl list sinks | grep Volym: | awk '{print $5}')
ram=$(free | grep Minne | awk '{printf "%.0f\n", $3/$2 *100}')
mem=$(df -h | grep /dev/nvme0n1p2 | awk '{print $5}')
wifi_str=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
pkgs=$(xbps-query -l | awk 'END {print NR}')
uptime=$(uptime | awk '{print substr($3, 1, length($3)-1)}')

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
	wifi="NO WIFI"

fi	

echo "$date | $time | UP: $uptime | VOL: $vol | RAM: $ram% | MEM: $mem | PKGS: $pkgs | $wifi "
