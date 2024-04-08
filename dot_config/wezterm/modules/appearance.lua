local wezterm = require("wezterm")
local hostname = wezterm.hostname()

local module = {}

function module.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"

	config.window_background_opacity = 0.85

	-- fallback will report errors if not found
	-- https://wezfurlong.org/wezterm/config/lua/wezterm/target_triple.html
	-- Luckily, should include a nerd font out of the box
	if hostname == "stella-hoshii.local" then
		config.font = wezterm.font("FiraCode Nerd Font Mono")
		-- default is 12.0
		config.font_size = 12.0
	end

	-- tab bar
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 999

	-- behavior
	config.window_close_confirmation = "NeverPrompt"
end

return module