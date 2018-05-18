#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UI -x polybar >/dev/null; do sleep 1; done

# Launch bars...
if type "xrandr"; then
  for m in $(xrandr -q | grep " connected" | cut -d ' ' -f1); do
    MONITOR=$m polybar --reload openbox-bar &
  done
else
  polybar --reload openbox-bar &
fi
