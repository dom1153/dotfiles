local resession = require 'resession'
resession.setup {
  autosave = {
    enabled = true,
    interval = 60,
    notify = true,
  },
}

local wk = require 'which-key'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
-- TODO: review astrovim resession and prompts
wk.register({
  q = {
    -- stylua: ignore start
    s = { function() resession.save(vim.fn.getcwd(), { dir = 'dirsession'}) end, 'Save this session', },
    d = { function() resession.delete(nil, { dir = 'dirsession', silence_errors = true  }) end, 'Delete session (dir)', },
    l = { function() resession.load(vim.fn.getcwd(), { dir = "dirsession" }) end, 'Load session (current dir)', },
    L = { function() resession.load(nil, { dir = 'dirsession' }) end, 'Load a session', },
    -- d = { function() resession.delete() end, 'Delete session', },
    -- L = { function() resession.load() end, 'Load a session', },
    -- S = { function() resession.save() end, 'Save this session', },
    -- stylua: ignore end
  },
}, { prefix = '<leader>' })
