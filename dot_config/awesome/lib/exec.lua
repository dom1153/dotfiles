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
