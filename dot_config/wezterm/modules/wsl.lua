local wezterm = require("wezterm")
local hostname = wezterm.hostname()

local module = {}

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
	end
end

return module
