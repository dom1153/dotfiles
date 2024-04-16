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
		config.font_size = 12.0
	end

	-- tab bar
	config.use_fancy_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 999

	-- bell
	config.audible_bell = "Disabled"

	-- behavior
	config.window_close_confirmation = "NeverPrompt"

	if hostname == "jill-stingray" or hostname == "sei-asagiri" then
		-- hyprland isn't working with wezterm wayland, x11 will do, if I try it
		config.enable_wayland = false
		config.font = wezterm.font("dina")
		config.font_size = 10.0
	end
end

return module
