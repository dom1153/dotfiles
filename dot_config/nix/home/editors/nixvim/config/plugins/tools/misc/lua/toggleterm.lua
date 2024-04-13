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

-- vertical split
vim.keymap.set("n", "<leader>TV", "<cmd>ToggleTerm direction=vertical name=Terminal-Vertical<CR>", {
	desc = "Terminal Vertical Split (root)",
})
vim.keymap.set("n", "<leader>Tv", "<cmd>ToggleTerm dir=%:p:h direction=vertical name=Terminal-Vertical-cwd<CR>", {
	desc = "Terminal Vertical Split (cwd)",
})

-- horizontal split
vim.keymap.set("n", "<leader>Th", "<cmd>ToggleTerm dir=%:p:h direction=horizontal name=Terminal-Horizontal-cwd<CR>", {
	desc = "Terminal Horizontal Split (cwd)",
})
vim.keymap.set("n", "<leader>TH", "<cmd>ToggleTerm direction=horizontal name=Terminal-Horizontal<CR>", {
	desc = "Terminal Horizontal Split (root)",
})

-- float
vim.keymap.set("n", "<leader>Tf", "<cmd>ToggleTerm dir=%:p:h direction=float name=Terminal-Float<CR>", {
	desc = "Terminal Float",
})
vim.keymap.set("n", "<leader>TF", "<cmd>ToggleTerm direction=float name=Terminal-Float<CR>", {
	desc = "Terminal Float",
})

-- term
vim.keymap.set("n", "<leader>Tt", "<cmd>ToggleTerm dir=%:p:h direction=tab name=Terminal-Tab<CR>", {
	desc = "Terminal Tab",
})
vim.keymap.set("n", "<leader>TT", "<cmd>ToggleTerm direction=tab name=Terminal-Tab<CR>", {
	desc = "Terminal Tab",
})
