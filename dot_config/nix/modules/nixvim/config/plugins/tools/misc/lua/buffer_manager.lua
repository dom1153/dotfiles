local bm = require 'buffer_manager'
bm.setup {
  -- <C-6> will do the job most the time, but still nice to have options
  focus_alternate_buffer = true,
}

local bmui = require 'buffer_manager.ui'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
require('which-key').register({
  b = {
    b = { bmui.toggle_quick_menu, 'Buffer Manager' },
  },
}, { prefix = '<leader>' })
