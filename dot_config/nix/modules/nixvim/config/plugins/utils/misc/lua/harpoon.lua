local ui = require 'harpoon.ui'
local mark = require 'harpoon.mark'

vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'Add' })
vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu, { desc = 'Quick Menu' })

--stylua: ignore start
vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, { desc = "Go 1" })
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end, { desc = "Go 2" })
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end, { desc = "Go 3" })
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end, { desc = "Go 4" })
--stylua: ignore end

local wk = require 'which-key'

local spacing = '  '

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  -- basic config
  h = {
    name = '󰈺' .. spacing .. 'Harpoon',
  },
}, { prefix = '<leader>' })

wk.register {
  -- stylua: ignore start
  ["<C-h>"] = { function() ui.nav_file(1) end, "Go 1" },
  ["<C-j>"] = { function() ui.nav_file(2) end, "Go 2" },
  ["<C-k>"] = { function() ui.nav_file(3) end, "Go 3" },
  ["<C-l>"] = { function() ui.nav_file(4) end, "Go 4" },
  -- stylua: ignore end
}
