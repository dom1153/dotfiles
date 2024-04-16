require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
			-- return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
			-- return 80
		end
	end,
	-- check for fish TODO: check that fish actually exists
	-- shell = function()
	-- 	return os.execute("/usr/bin/env fish") -- or vim.o.shell
	-- end,
	-- shell = os.execute("/usr/bin/env fish"),
	-- not sure why c-/ doens't work, maybe needs escaping
	open_mapping = [[<c-\>]],
	direction = "float",
})

local wk = require("which-key")

wk.register({
	T = {
		-- vertical split
		v = {
			"<cmd>ToggleTerm dir=%:p:h direction=vertical name=Term-V-cwd<CR>",
			"Terminal Vertical Split (cwd)",
		},
		V = {
			"<cmd>ToggleTerm direction=vertical name=Term-V-root<CR>",
			"Terminal Vertical Split (root)",
		},

		-- horizontal
		s = {
			"<cmd>ToggleTerm dir=%:p:h direction=horizontal name=Term-H-cwd<CR>",
			"Terminal Horizontal Split (cwd)",
		},
		S = {
			"<cmd>ToggleTerm direction=horizontal name=Term-H-root<CR>",
			"Terminal Horizontal Split (root)",
		},

		-- float
		f = {
			"<cmd>ToggleTerm dir=%:p:h direction=float name=Term-F-root<CR>",
			"Terminal Float (cwd)",
		},
		F = {
			"<cmd>ToggleTerm direction=float name=Term-F-root<CR>",
			"Terminal Float (root)",
		},

		-- tab
		t = {
			"<cmd>ToggleTerm dir=%:p:h direction=tab name=Term-T-root<CR>",
			"Terminal Tab (cwd)",
		},
		T = {
			"<cmd>ToggleTerm direction=tab name=Term-T-root<CR>",
			"Terminal Tab (root)",
		},
	},
}, { prefix = "<leader>" })
