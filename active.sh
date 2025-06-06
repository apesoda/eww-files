#!/usr/bin/env bash

while true; do
	info=$(hyprctl activewindow -j 2>/dev/null)
	if [ -z "$info" ]; then
		continue
	fi

	x_t=$(echo "$info" | jq '.at[0]')
	y_t=$(echo "$info" | jq '.at[1]')
	
	offset_x_b=$( echo "$info" | jq '.size[0]')
	offset_y_b=$( echo "$info" | jq '.size[1]')

	x_b=$(( $x_t + $offset_x_b ))
	y_b=$(( $y_t + $offset_y_b ))

	if [ -z "$x_t" ] || [ -z "$y_t" ]; then
		continue
	fi

	if [ -z "$x_b" ] || [ -z "$y_b" ]; then
		continue
	fi
	new_x_t=$(( $x_t - 10 ))
	new_y_t=$(( $y_t - 55 ))

	new_x_b=$(( $x_b - 10 ))
	new_y_b=$(( $y_b - 55 ))
	
	eww open active-indicator-t --arg pos_x=$new_x_t --arg pos_y=$new_y_t
	eww open active-indicator-b --arg pos_x=$new_x_b --arg pos_y=$new_y_b
	#sleep 0.1
done
