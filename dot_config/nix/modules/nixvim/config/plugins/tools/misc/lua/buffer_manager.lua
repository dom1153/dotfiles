local bm = require 'buffer_manager'
bm.setup {
  -- <C-6> will do the job most the time, but still nice to have options
  focus_alternate_buffer = true,
  -- VVV doesn't work, wants internal commands
  -- select_menu_item_commands = {
  --   hadd = {
  --     key = '<Tab>',
  --     command "<cmd>lua require'harpoon'.mark.add_file<cr>",
  --   },
  -- },
}

local bmui = require 'buffer_manager.ui'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
require('which-key').register({
  o = { bmui.toggle_quick_menu, 'Buffer manager' },
}, { prefix = '<leader>' })
