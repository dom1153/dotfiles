#!/usr/bin/env bash

# swww init &
# swww img ~/Pictures/AnimeWallpaperSetV2/landscape/giga-screenshot-13_final_40418139823_o.jpg

### random number 1 through 6, a directory based on symlinked videos
num=$((1 + $RANDOM % 6))
mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-1 /home/archoo/Pictures/Wallpapers/vid/playlist/${num}.mp4 &

# mpvpaper -o "no-audio --loop-playlist  --panscan=1" DP-2 /home/archoo/Downloads/wall_test/aru_ny.mp4 &

bash ~/.config/custom-scripts/watchmanchezmoi.sh

### network manager applet
nm-applet --indicator &

waybar &

dunst &