-- This function is basically find_files()
-- but only for the directory containing the file you're currently editing.
-- So you don't have to open up :Explore, tree, or anything else to browse next to the current file.
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f.", function()
	builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Files (Local Directory)" })

-- -- wrapped ; testing with telescope-all-recent ; wrap binding if loaded in the wrong order
-- vim.keymap.set("n", "<leader><space>", function()
-- 	builtin.find_files()
-- end)
