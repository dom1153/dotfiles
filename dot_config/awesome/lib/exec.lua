local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')

-- TODO: not sure what's wrong with xinitrc... nixos lmao
awful.util.spawn('xset r rate 250 30')
-- awful.util.spawn('xrandr --output DisplayPort-0 --mode 2560x1440 --rate 164.83')
-- xrandr --output DisplayPort-0 --mode 2560x1440 --rate 164.83

-- use autorandr to handle monitors

-- pgrep in the script will ensure we don't launch every reload
awful.spawn.with_shell('~/.config/awesome/autorun.sh')

-- noisetorch: mic noise suppression
awful.spawn.with_shell('noisetorch -i alsa_input.usb-Antlion_Audio_Antlion_USB_Microphone-00.pro-input-0')
