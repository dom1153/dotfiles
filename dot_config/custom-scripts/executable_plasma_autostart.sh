#!/usr/bin/env bash

autorandr --load single &

signal-desktop --start-in-tray &

### it's fine since I use multiple workspaces
# steam -silent &

### -f foreground (debug) ; ssl == crypto (no .conf option)
# barriers --config $HOME/.config/custom-scripts/assets/jill_stella_dorothy.conf --disable-crypto &
barrier &

### noisetorch!?

noisetorch -i alsa_input.usb-Antlion_Audio_Antlion_USB_Microphone-00.pro-input-0 &
