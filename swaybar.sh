#!/bin/bash

date=$(date +"%Y-%m-%d")
time=$(date +"%T")
ram=$(free -b | head -n 2 | tail -1 | awk '{printf "%.0f\n", $3/$2 * 100}')
wifi_str=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
inst=$(xbps-query -l | awk "END {print NR}")
upd=$(xbps-install -Mun | awk "END {print NR}")
ip=$(ip route get 1 | awk '{print $7}')
disk=$(df -h --total | tail -1 | awk '{print $5}')
cpu_temp=$(cat /sys/devices/platform/eeepc-wmi/hwmon/hwmon3/subsystem/hwmon2/temp1_input | awk '{printf "%.0f\n", $1/1000}')

wifi_bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "▉")

# Half-up rounding wifi_str/12
wifi_eight=$(( ($wifi_str + 12 / 2 ) / 12 ))

wifi=${wifi_bars[$wifi_eight]}

for i in {1..8}; do
	if (($wifi_eight-$i < 0)); then
		wifi+=${wifi_bars[0]}
	else
		wifi+=${wifi_bars[$wifi_eight-$i]}
	fi
done

echo "$ip | $wifi | XBPS: $upd updates | RAM: $ram% | CPU: $cpu_temp°C | DISK: $disk | $time | $date "
