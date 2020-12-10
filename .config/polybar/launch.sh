#!/usr/bin/env sh

# Terminate all running instances
killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

interface=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

polybar -c ~/.config/polybar/config.ini main &
