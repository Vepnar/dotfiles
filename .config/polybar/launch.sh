#!/usr/bin/env sh

# Terminate all running instances
killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

interface=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Polybar run on every monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -c ~/.config/polybar/config.ini main &
  done
else
  polybar -c ~/.config/polybar/config.ini main &
fi
