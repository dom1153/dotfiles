require("staline").setup({
	sections = {
		left = { "-mode", " ", "branch" },
		mid = { "lsp_name" },
		right = { "file_name", "line_column" },
	},
	inactive_sections = {
		left = { "-mode", " ", "branch" },
		mid = { "lsp_name" },
		right = { "file_name", "line_column" },
	},
	defaults = {
		left_separator = " ",
		right_separator = "  ",
		branch_symbol = " ",
		mod_symbol = "",
		line_column = "[%l/%L]",
		inactive_color = "#80a6f2", --#303030 is the default
		inactive_bgcolor = "none",
	},
	special_table = {
		lazy = { "Plugins", "💤 " },
		TelescopePrompt = { "Telescope", "  " },
		oil = { "Oil", "󰏇 " },
		lazygit = { "LazyGit", " " },
	},
	mode_icons = {
		["n"] = "NORMAL",
		["no"] = "NORMAL",
		["nov"] = "NORMAL",
		["noV"] = "NORMAL",
		["niI"] = "NORMAL",
		["niR"] = "NORMAL",
		["niV"] = "NORMAL",
		["i"] = "INSERT",
		["ic"] = "INSERT",
		["ix"] = "INSERT",
		["s"] = "INSERT",
		["S"] = "INSERT",
		["v"] = "VISUAL",
		["V"] = "VISUAL",
		[""] = "VISUAL",
		["r"] = "REPLACE",
		["r?"] = "REPLACE",
		["R"] = "REPLACE",
		["c"] = "COMMAND",
		["t"] = "TERMINAL",
	},
})

-- autcmd to start at home ; this has issues in that passing a directory via cli will not override
local os = require("os")
local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "cd " .. "$HOME", group = vim_enter_group })

-- will be useful if trying to future-proof icons
-- not likely i'll ever impl but it's useful
-- actually... this might be a custom variable
vim.g.icons_enabled ~= false and "" or "+",

-- autocmd FileType c setlocal commentstring=//\ %s
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "kdl" },
	callback = function()
		vim.opt.commentstring = "// %s"
	end,
	desc = "Change commentstring for KDL files",
})
