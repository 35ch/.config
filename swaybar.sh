#!/bin/bash

year_and_date() {
	echo " $(date +"%Y-%m-%d")"
}

current_time() {
	echo " $(date +"%H:%M:%S")"
}

ram_usage() {
	echo "RAM: $(free -b | head -n 2 | tail -1 | awk '{printf "%.0f\n", $3/$2 * 100}')%"
}

packages_installed() {
	echo "$(xbps-query -l | awk "END {print NR}") installed"
}

updates_available() { 
	echo "$(xbps-install -Mun | awk "END {print NR}") updates"
}

cpu_temperature() {
	echo " $(cat /sys/devices/platform/eeepc-wmi/hwmon/hwmon3/subsystem/hwmon2/temp1_input | awk '{printf "%.0f\n", $1/1000}')°C"
} 

wifi() {
	if [[ $(wpa_cli ping | tail -1) == "PONG" ]] & [[ $(dhcpcd -U | grep ip | cut -c 12-) != "" ]]; then
		local wifi=""
	else
		local wifi="睊"
	fi
	
	wifi+=" $(wpa_cli SIGNAL_POLL | head -n 2 | tail -1 | cut -c 7-)%"

	echo $wifi
}

wifi_bars() {
	wifi_signal=$(iw dev wlp5s0 station dump | grep signal: | awk '{print $2*-1}')
	
	if [[ $wifi_signal == "" ]]; then
		local wifi="Not connected"
	else
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
	fi

	echo $wifi
}

echo "$(packages_installed) $(updates_available) $(ram_usage) $(cpu_temperature) $(year_and_date) $(current_time) $(wifi) "
