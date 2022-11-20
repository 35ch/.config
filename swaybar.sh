#!/bin/bash

date=$(date +"%Y-%m-%d")
time=$(date +"%T")
ram=$(free | grep Mem | awk '{printf "%.0f\n", $3/$2 *100}')
wifi_str=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
inst=$(xbps-query -l | awk "END {print NR}")
upd=$(xbps-install -Sun | awk "END {print NR}")

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

echo "( XBPS: $inst installed, $upd updates ( RAM: $ram% ( $time ( $date ) $wifi "
