-- TODO: find a way to delete all buffers, or all other buffers
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })

--- all
vim.keymap.set('n', '<leader>bX', '<cmd>%bdelete<cr>', { desc = 'Delete all buffer' })

--- previous buffer (TODO: alt bind this)
-- also consider <c-6>
vim.keymap.set('n', '<leader>bo', '<cmd>e #<cr>', { desc = 'Switch Other Buffer' })
