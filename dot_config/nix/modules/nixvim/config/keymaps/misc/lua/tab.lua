-- magement via <leader>t
vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', { silent = true, desc = 'New Tab' })

vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<cr>', { silent = true, desc = 'Close tab' })

vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>', { silent = true, desc = 'Next Tab' })
-- stylua: ignore
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { silent = true, desc = "Previous Tab", })
