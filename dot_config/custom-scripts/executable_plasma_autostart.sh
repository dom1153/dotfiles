#!/usr/bin/env bash

autorandr --load single &

signal-desktop --start-in-tray &

steam -silent &

### -f foreground (debug)
# barrier &

noisetorch -i alsa_input.usb-Antlion_Audio_Antlion_USB_Microphone-00.pro-input-0 &
