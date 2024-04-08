local wezterm = require("wezterm")
local hostname = wezterm.hostname()

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"

	config.window_background_opacity = 0.85

	-- fallback will report errors if not found
	-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
	-- Luckily, should include a nerd font out of the box
	if hostname == "pixelbookgo-localdomain" then
		config.font = wezterm.font("FiraCode Nerd Font Mono")
	end

	-- tab bar
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 999
end

return module
