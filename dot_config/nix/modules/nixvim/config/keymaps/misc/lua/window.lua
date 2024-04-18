-- Navigation (standard)
vim.keymap.set('n', '<leader>wh', '<C-W>h', {
  silent = true,
  desc = 'Go to window left',
})

vim.keymap.set('n', '<leader>wj', '<C-W>j', {
  silent = true,
  desc = 'Go to window down',
})

vim.keymap.set('n', '<leader>wk', '<C-W>k', {
  silent = true,
  desc = 'Go to window up',
})

vim.keymap.set('n', '<leader>wl', '<C-W>l', {
  silent = true,
  desc = 'Go to window right',
})

-- Navigation (arrows)
vim.keymap.set('n', '<Left>', '<C-W>h', {
  silent = true,
  desc = 'Go to window left',
})

vim.keymap.set('n', '<Down>', '<C-W>j', {
  silent = true,
  desc = 'Go to window down',
})

vim.keymap.set('n', '<Up>', '<C-W>k', {
  silent = true,
  desc = 'Go to window up',
})

vim.keymap.set('n', '<Right>', '<C-W>l', {
  silent = true,
  desc = 'Go to window right',
})

-- Navigation (A-hjkl)
vim.keymap.set('n', '<A-h>', '<C-W>h', {
  silent = true,
  desc = 'Go to window left',
})

vim.keymap.set('n', '<A-j>', '<C-W>j', {
  silent = true,
  desc = 'Go to window down',
})

vim.keymap.set('n', '<A-k>', '<C-W>k', {
  silent = true,
  desc = 'Go to window up',
})

vim.keymap.set('n', '<A-l>', '<C-W>l', {
  silent = true,
  desc = 'Go to window right',
})

-- create / close windows
vim.keymap.set('n', '<leader>ws', '<C-W>s', {
  silent = true,
  desc = 'Split window below',
})

vim.keymap.set('n', '<leader>wv', '<C-W>v', {
  silent = true,
  desc = 'Split window right',
})

vim.keymap.set('n', '<leader>wq', '<C-W>q', {
  silent = true,
  desc = 'Close window',
})

-- Other navigation
vim.keymap.set('n', '<leader>ww', '<C-W>w', {
  silent = true,
  desc = 'Next windows',
})

vim.keymap.set('n', '<leader>wx', '<C-W>x', {
  silent = true,
  desc = 'Swap current with next',
})

vim.keymap.set('n', '<leader>wp', '<C-W>p', {
  silent = true,
  desc = 'Other window',
})

-- resize
vim.keymap.set('n', '<leader>w_', '<C-W>_', {
  silent = true,
  desc = 'Max out the height',
})

vim.keymap.set('n', '<leader>w|', '<C-W>|', {
  silent = true,
  desc = 'Max out the width',
})

vim.keymap.set('n', '<leader>w=', '<C-W>=', {
  silent = true,
  desc = 'Equally high and wide',
})
