local wk = require("which-key")

local spacing = "  "

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
	t = { name = "" .. spacing .. "Tab" },
	E = { "<cmd>SidebarNvimToggle<CR>", "Toggle Sidebar" },
	c = {
		m = { "<cmd>Neomake!<CR>", "Neomake (root)" },
	},
}, { prefix = "<leader>" })
