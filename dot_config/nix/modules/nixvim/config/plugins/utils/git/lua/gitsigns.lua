local wk = require 'which-key'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  g = {
    D = { '<cmd>Gitsigns diffthis<cr>', 'Git diff this' },
    b = { '<cmd>Gitsigns blame_line<cr>', 'Git blame line' },
    -- R = { '<cmd>Gitsigns reset_buffer<cr>', 'Reset buffer' },
    -- p = { '<cmd>Gitsigns preview_hunk<cr>', 'Preview hunk' },
    -- r = { '<cmd>Gitsigns reset_hunk<cr>', 'Reset hunk' },
    -- s = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage hunk' },
    -- S = { '<cmd>Gitsigns stage_buffer<cr>', 'Stage buffer' },
    -- u = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Undo stage hunk' },
  },
}, { prefix = '<leader>' })
