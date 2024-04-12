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
	-- not sure why c-/ doens't work, maybe needs escaping
	open_mapping = [[<c-\>]],
})
