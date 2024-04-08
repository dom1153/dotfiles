-- Pull in the wezterm API
local appearance = require("modules/appearance")

-- This will hold the configuration.
local config = {}
appearance.apply_to_config(config)

return config
