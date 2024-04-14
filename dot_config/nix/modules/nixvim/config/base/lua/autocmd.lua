-- autocmd FileType c setlocal commentstring=//\ %s
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "kdl" },
	callback = function()
		vim.opt.commentstring = "// %s"
	end,
	desc = "Change commentstring for KDL files",
})
