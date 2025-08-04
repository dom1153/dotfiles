local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
  color_scheme = 'Catppuccin Mocha',
  use_fancy_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  hide_tab_bar_if_only_one_tab = true,
}

return config
