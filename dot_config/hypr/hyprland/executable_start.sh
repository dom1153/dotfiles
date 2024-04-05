#!/usr/bin/env bash

wallPath="/home/archoo/Pictures/Wallpapers"
m=$(ls -d "$wallPath/vid"/*.mp4)
j=$(ls -d "$wallPath/img"/*.jpg)
p=$(ls -d "$wallPath/img"/*.png)

chosen="$(ls "$m" "$j" "$p" | sort -R | tail -1)"
case "$chosen" in
*.mp4)
	mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-1 "$chosen" &
	;;
*.png | *.jpg)
	swww init                  ### runs fine without & ; want to do this to make sure wallpaper is actually chosen
	swww img "$chosen" -t none ### starts early, don't play animation
	;;
esac

### this should occur at zsh start
# bash ~/.config/custom-scripts/watchmanchezmoi.sh

### network manager applet
### I'm on ethernet it's fine
# nm-applet --indicator &

waybar &

dunst &
