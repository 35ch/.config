./.screenlayout/screenlayout.sh

./.fehbg

while xsetroot -name "RAM: `free | grep Mem | awk '{ printf("%.1f%\n", $3/$2 * 100) }'` | VOL: `pamixer --get-volume-human` | `date +%H:%M:%S` "
do
    sleep 1
done &
exec dwm
