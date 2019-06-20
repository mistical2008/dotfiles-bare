#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using custom config locatione
polybar mybar -c ~/.config/i3/polybar.conf  -r &
sleep 2;
polybar mybar-2 -c ~/.config/i3/polybar.conf  -r &

echo "Polybar launched..."
