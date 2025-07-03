local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
  color_scheme = 'Catppuccin Mocha',
  use_fancy_tab_bar = false
}

return config
