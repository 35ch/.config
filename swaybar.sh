#!/bin/bash

todays_date() {
	echo $(date +"%x")
}

current_time() {
	echo $(date +"%T")
}

ram_usage() {
	ram_used=$(free | awk 'NR==2{printf "%.0f\n", $3/$2*30}')
	echo $(printf '█%.0s' $(seq 1 $ram_used))$(printf '░%.0s' $(seq $ram_used 30))
}

packages_installed() { 
	echo $(qlist -I | awk "END {print NR}")
}

cpu_temperature() {
	echo "$(awk '{printf "%.0f\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp)°C"
} 

kernel() {
	echo "$(uname -r)"
}

wifi_bars() {
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

vpn() {
	vpn=$(ip a | grep wg | awk 'NR==1{printf "%s\n", $2}' | cut -c 1-13)
	
	if [ -z $vpn ]; then
		echo "Not Connected"
	else
		echo "$vpn"
	fi
}

echo "$(cpu_usage) $(ram_usage) 🐧 $(kernel) 📦 $(packages_installed) 🖥 $(cpu_temperature) 🗓 $(todays_date) 🕘 $(current_time) 🌐 $(vpn) $(wifi_bars)"
