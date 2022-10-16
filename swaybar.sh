date=$(date +"%B %d %Y")
time=$(date +"%T")
volume=$(pamixer --get-volume-human)
ram=$(free | grep Mem | awk '{printf "%.0f\n", $3/$2 *100}')
mem=$(df -h | grep /dev/nvme0n1p2 | awk '{print $5}')

echo "$date | $time | VOL: $volume | RAM: $ram% | MEM: $mem "
