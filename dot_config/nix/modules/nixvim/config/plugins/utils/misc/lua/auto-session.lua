-- vim.fn.stdpath('data').."/sessions/".
--

require('auto-session').setup {
  log_level = 'error',

  cwd_change_handling = {
    restore_upcoming_session = true,
  },
}

local wk = require 'which-key'
-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  q = {
    s = { '<cmd>SessionSave<CR>', 'Save session' },
    r = { '<cmd>SessionRestore<CR>', 'Restore Session' },
    d = { '<cmd>Autosession delete<CR>', 'Delete Session (UI)' },
    D = { '<cmd>SessionDelete<CR>', 'Delete Session (current)' },
    X = { '<cmd>SessionPurgeOrphaned<CR>', 'Cleanup Oprhaned Sessions' },
    o = { '<cmd>Autosession search<CR>', 'Open session (UI)' },
  },
}, { prefix = '<leader>' })
