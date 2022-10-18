date=$(date +"%B %d %Y")
time=$(date +"%T")
vol=$(pamixer --get-volume-human)
ram=$(free | grep Mem | awk '{printf "%.0f\n", $3/$2 *100}')
mem=$(df -h | grep /dev/nvme0n1p2 | awk '{print $5}')
wifi_str=$(nmcli d wifi | grep "^\*" | grep -v "\*.*SSID" | awk '{ print $8}')
#bat=$(cat /sys/class/power_supply/BAT0/capacity)

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

echo "$date | $time | VOL: $vol | RAM: $ram% | MEM: $mem | $wifi "
