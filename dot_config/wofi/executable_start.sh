#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config.ini"
STYLE="$HOME/.config/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi