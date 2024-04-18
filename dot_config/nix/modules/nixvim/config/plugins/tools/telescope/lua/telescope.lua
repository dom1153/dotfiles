-- This function is basically find_files()
-- but only for the directory containing the file you're currently editing.
-- So you don't have to open up :Explore, tree, or anything else to browse next to the current file.
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>f.', function()
  builtin.find_files { cwd = vim.fn.expand '%:p:h' }
end, { desc = 'Files (Local Directory)' })

-- -- wrapped ; testing with telescope-all-recent ; wrap binding if loaded in the wrong order
-- vim.keymap.set("n", "<leader><space>", function()
-- 	builtin.find_files()
-- end)

vim.keymap.set('n', '<leader>fu', '<cmd>Telescope undo<CR>', {
  desc = 'Undo tree',
})

-- -- list buffers on fb or bb
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', {
  desc = 'Buffer',
})
-- vim.keymap.set('n', '<leader>bb', '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>', {
--   desc = 'Buffer',
-- })

-- for frecency plugin
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope frecency workspace=CWD<cr>', {
  desc = 'Files (frecency ; hidden files)',
})
