local wk = require("which-key")

local spacing = "  "

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
	-- basic config
	t = { name = "" .. spacing .. "Tab" },
	w = { name = "" .. spacing .. "Window" },
	b = { name = "󰓩" .. spacing .. "Buffer" },

	-- toggles and more
	u = { name = "󰃣" .. spacing .. "UI/UX" },

	-- telescope
	f = { name = "󰈞" .. spacing .. "Find" },
	v = { name = "" .. spacing .. "Vim" },

	-- git
	g = { name = "" .. spacing .. "Git" },

	-- noice notifications
	n = { name = "󱅫" .. spacing .. "Notifications" },

	-- toggleterm
	T = { name = "" .. spacing .. "Terminal" },

	-- session (wip)
	q = { name = "" .. spacing .. "Quit/session" },

	-- code
	c = { name = "󰅬" .. spacing .. "code" },
}, { prefix = "<leader>" })
