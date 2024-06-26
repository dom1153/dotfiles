#!/bin/sh

### https://wiki.hyprland.org/faq/

handle() {
	case $1 in monitoradded*)
		hyprctl dispatch moveworkspacetomonitor "1 1"
		hyprctl dispatch moveworkspacetomonitor "2 1"
		hyprctl dispatch moveworkspacetomonitor "4 1"
		hyprctl dispatch moveworkspacetomonitor "5 1"
		;;
	esac
}

socat - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
