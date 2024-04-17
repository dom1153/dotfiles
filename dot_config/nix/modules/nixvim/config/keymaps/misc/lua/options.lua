-- theme randomhue comes from mini.hue
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hues.md#demo
-- TODO: override mini.hue to become transparent
-- 'random' , 'Reset'
vim.keymap.set('n', '<leader>ur', '<cmd>colorscheme randomhue<cr>', { desc = 'Theme Random' })
vim.keymap.set('n', '<leader>uR', '<cmd>colorscheme catppuccin<cr>', { desc = 'Theme Catppuccin' })
