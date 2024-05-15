#!/usr/bin/env bash

### https://www.reddit.com/r/awesomewm/comments/zhhu0i/how_do_i_autostart_applicationsrun_commands_on/
run() {
  if ! pgrep -f "$1"; then
    "$@" &
  fi
}

run "wezterm"
run "signal-desktop" --start-in-tray
### normal 'steam' run isn't working???
run "steam" -silent
run "obsidian"
run "firefox"

### noisetorch does not create a process
# run "noisetorch" -i alsa_input.usb-Antlion_Audio_Antlion_USB_Microphone-00.pro-input-0

### TODO: qemu w11
# run "volumeicon"
# run "nm-applet"
# run "ibus-daemon" -drxR
# run "caffeine"
# run "feh" --randomize --recursive --bg-fill ~/Pictures/Wallpapers/
# run "picom" -b
