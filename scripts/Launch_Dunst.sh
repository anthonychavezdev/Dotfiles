#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q dunst

# Wait until the processes have been shut down
while pgrep -x dunst >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example &

for i in $(dunst -m | awk -F: '{print $1}'); do MONITOR=$i dunst & done

echo "Dunst launched..."
