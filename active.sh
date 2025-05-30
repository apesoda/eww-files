#!/usr/bin/env bash

while true; do
	info=$(hyprctl activewindow -j 2>/dev/null)
	if [ -z "$info" ]; then
		continue
	fi

	x=$(echo "$info" | jq '.at[0]')
	y=$(echo "$info" | jq '.at[1]')

	if [ -z "$x" ] || [ -z "$y" ]; then
		continue
	fi

	new_x=$(( $x - 10 ))
	new_y=$(( $y - 55 ))

	eww open active-indicator --arg pos_x=$new_x --arg pos_y=$new_y
	#sleep 0.1
done
