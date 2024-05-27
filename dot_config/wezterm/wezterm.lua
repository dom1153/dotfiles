-- Pull in the wezterm API
local wezterm = require('wezterm')

local appearance = require('modules/appearance')
local features = require('modules/features')

-- This will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

appearance.apply_to_config(config)
features.apply_to_config(config)

return config
