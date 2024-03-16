#!/usr/bin/env bash

swww init &
swww img ~/Pictures/AnimeWallpaperSetV2/landscape/giga-screenshot-13_final_40418139823_o.jpg

bash ~/.config/custom-scripts/watchmanchezmoi.sh

### network manager applet
nm-applet --indicator &

waybar &

dunst &

steam -silent &

# obsidian &