#!/usr/bin/env bash

logdir="/tmp/mylogs"
log="$logdir/hyprland_exec.log"
mkdir -p $logdir

wallPath="/home/archoo/Pictures/Wallpapers"
m=$(ls -d "$wallPath/vid"/*.mp4)
j=$(ls -d "$wallPath/img"/*.jpg)
p=$(ls -d "$wallPath/img"/*.png)

### I only got jpgs so far
jt=$(ls -d "$wallPath/tall"/*.jpg)

### runs fine without & ; want to do this to make sure wallpaper is actually chosen
swww init >>$log

### DP-2
chosenTALL="$(ls $jt | sort -R | tail -1)"
swww img "$chosen" -t none -o DP-2 >>$log

### DP-1
chosen="$(ls $m $j $p | sort -R | tail -1)"
daylog=$(date "+%d/%m/%y %H:%M:%S")
echo "=== ${daylog}: $chosen" >$log
case "$chosen" in
*.mp4)
	mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-1 "$chosen" >>$log 2>&1 &
	;;
*.png | *.jpg)
	### starts early, any animations won't play anyways (hence -t none)
	swww img "$chosen" -t none -o DP-1 >>$log
	;;
esac

### DP-2 tall
### TODO...

### this should occur at shell start instead
# bash ~/.config/custom-scripts/watchmanchezmoi.sh

### network manager applet
### > I'm on ethernet it's fine
# nm-applet --indicator &

### status bar
waybar &

### notification daemon
dunst &
