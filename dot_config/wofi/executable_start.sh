#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/config.ini"
STYLE="$HOME/.config/wofi/style.css"

### drun searches $XDG_DATA_HOME/applications and $XDG_DATA_DIRS/applications
### $HOME/.nix-profile/share/applications
### /run/current-system/sw/share/applications
### $HOME/.local/share/applications
if [[ ! $(pidof wofi) ]]; then
	wofi --conf "${CONFIG}" --style "${STYLE}"
else
	pkill wofi
fi
