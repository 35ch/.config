#!/bin/bash

function year_and_date() {
	echo $(date +"%Y-%m-%d")
}

function current_time() {
	echo $(date +"%H:%M")
}

function ram_usage() {
	echo $(free -b | head -n 2 | tail -1 | awk '{printf "%.0f\n", $3/$2 * 100}')
}

function updates_available() {
	echo $(xbps-install -Mun | awk "END {print NR}")
}

function local_ip_adress() {
	echo $(ip route get 1 | awk '{print $7}')
}

function disk_usage() {
	echo $(df -h --total | tail -1 | awk '{print $5}')
}

function cpu_temperature() {
	echo $(cat /sys/devices/platform/eeepc-wmi/hwmon/hwmon3/subsystem/hwmon2/temp1_input | awk '{printf "%.0f\n", $1/1000}')
}

function wifi_bars() {
	wifi_signal=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
	
	bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "▉")

	# Half-up rounding wifi_str/12
	wifi_eight=$(( ($wifi_signal + 12 / 2 ) / 12 ))

	wifi=${bars[$wifi_eight]}
	
	for i in {1..8}; do
		if (($wifi_eight-$i < 0)); then
			wifi+=${bars[0]}
		else
			wifi+=${bars[$wifi_eight-$i]}
		fi
	done
	
	echo $wifi
}

echo "$(local_ip_adress) | $(wifi_bars) | XBPS: $(updates_available) updates | RAM: $(ram_usage)% | CPU: $(cpu_temperature)°C | DISK: $(disk_usage) | $(current_time) | $(year_and_date) "
