-- from theprimeagen
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- greatest remap ever (x == visual mode)
-- allows you to highlight over text, paste over it with <leader>p
-- puts the overwritten text to the void buffer (clipboard stays the same)
vim.keymap.set('x', '<leader>p', [["_dP]])

-- This is going to get me cancelled ()
vim.keymap.set('i', '<C-c>', '<Esc>')

-- normal Q repeats the last recorded register [count] times
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- quickfix navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- vscode style ctrl-d mode for nvim (all instances) ; a bit jarring
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chomd +x current buffer
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>ee', 'oif err != nil {<CR>}<Esc>Oreturn err<Esc>')

-- switch projects through tmux / fzf
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<leader>vpp', '<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>')
vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>')

vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end)
