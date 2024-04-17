-- -- help vim.keymap.set()

-- local nmap = function(keys, func, des)
-- 	vim.keymap.set("n", keys, func, { desc = des })
-- end

-- normal Q repeats the last recorded register [count] times
vim.keymap.set('n', 'Q', '<nop>')
-- esc -> noh
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- -- visual mode drag
-- -- Cool hat trick, but I like J in visual mode (:join works as an alternative)
-- stylua: ignore start
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move up when line is highlighted" })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move down when line is highlighted" })
-- stylua: ignore end

vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move down when line is highlighted' })

-- stylua: ignore start

-- normal mode J does not move cursor
vim.keymap.set("n", "J", "mzJ`z", { silent = true, desc = "Allow cursor to stay in the same place after appeding to current line" })

-- <c-d> and <c-u> keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Allow <C-d> and <C-u> to keep the cursor in the middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Allow C-d and C-u to keep the cursor in the middle" })

-- Allow search terms to stay in the middle
vim.keymap.set("n", "n", "nzzzv", { desc = "Allow search terms to stay in the middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Allow search terms to stay in the middle" })

-- stylua: ignore end

-- clipboard and register management (paste seems to inherit clipboard by default)
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard (motion)' })

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete to void register (motion)' })

-- greatest remap ever (x == visual mode)
-- allows you to highlight over text, paste over it with <leader>p
-- puts the overwritten text to the void buffer (clipboard stays the same)
vim.keymap.set({ 'x', 'v' }, '<leader>p', [["_dP]])

-- <C-c> instead of pressing esc (insert mode) just because
vim.keymap.set('i', '<C-c>', '<Esc>')

-- <C-s> save
vim.keymap.set({ 'i', 'n', 'x', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- qa/qq quit
vim.keymap.set('n', '<leader>qa', '<cmd>qa<cr>', { desc = 'Quit All' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })
