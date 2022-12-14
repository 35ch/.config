#!/bin/bash

year_and_date() {
	echo " $(date +"%Y-%m-%d")"
}

current_time() {
	echo " $(date +"%H:%M")"
}

ram_usage() {
	ram_used=$(free | awk 'NR==2{printf "%.0f\n", $3/$2*10}')
	echo $(printf '█%.0s' $(seq 1 $ram_used))$(printf '░%.0s' $(seq $ram_used 10))
}

updates_available() { 
	echo "$(xbps-install -Mun | awk "END {print NR}") updates"
}

cpu_temperature() {
	echo " $(awk '{printf "%.0f\n", $1/1000}' /sys/devices/platform/eeepc-wmi/hwmon/hwmon3/subsystem/hwmon2/temp1_input)°C"
} 

wifi() {
	if [[ $(wpa_cli ping | tail -1) == "PONG" ]] & [[ $(dhcpcd -U | grep ip | cut -c 12-) != "" ]]; then
		local wifi=""
	else
		local wifi="睊"
	fi
	
	wifi+=" $(wpa_cli SIGNAL_POLL | awk 'NR==2{print $1}' | cut -c 7-)%"

	echo $wifi
}

echo "$(updates_available) $(cpu_temperature) $(year_and_date) $(current_time) $(wifi) $(ram_usage) "
