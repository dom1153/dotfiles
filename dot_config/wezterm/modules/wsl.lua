local wezterm = require("wezterm")
local hostname = wezterm.hostname()

local module = {}
-- https://wezfurlong.org/wezterm/config/launch.html#__tabbed_1_2
-- local launch_menu = {}

function module.apply_to_config(config)
	if hostname == "DomArtProW11" then
		config.wsl_domains = {
			{
				name = "WSL:NixOS", -- unique identifier
				distribution = "NixOS", -- 'wsl -l -v'
				default_cwd = "~",
			},
		}
		config.default_domain = "WSL:NixOS"

		-- right click menu to get options
		config.hide_tab_bar_if_only_one_tab = false
	end
end

return module
