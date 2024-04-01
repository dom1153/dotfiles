#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Windows\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

### dummy switch cuz nwg-bar does not work with -- args
case $op in 
        poweroff)
                systemctl -i poweroff
                ;&
        reboot)
                systemctl reboot
                ;&
        windows)
                systemctl reboot --boot-loader-entry=auto-windows
                ;&
        logout)
                hyprctl dispatch exit
                ;;
esac