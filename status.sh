#!/bin/bash

# Credits to https://www.reddit.com/r/suckless/comments/l7la29/making_a_posix_dwm_status_script_with_signalling/

# Remember the pid of this process
echo $$ > ~/scripts/status_pid

update_vol() {
    volume=$([ "$(pamixer --get-mute)" = "true" ] && echo "Muted" || echo "$(pamixer --get-volume)%")
}

# Use read commmand to create shell variables
update_bat() {
    read -r battery < /sys/class/power_supply/BAT0/capacity
}

update_time() {
    time=$(date "+%m/%d/%Y %I:%M")
}

display() {
    xsetroot -name "[VOL $volume] [BAT $battery%] $time"
}

trap "update_vol; display" "SIGRTMIN+1"

# Initial update of volume
update_vol

while true
do
    update_bat
    update_time
    display
    sleep 1
done
