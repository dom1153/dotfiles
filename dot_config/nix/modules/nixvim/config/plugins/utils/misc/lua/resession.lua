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
    s = {
      function()
        require('resession').save(vim.fn.getcwd(), { dir = 'dirsession' })
      end,
      'Save this session',
    },
    l = {
      function()
        require('resession').load(nil, { dir = 'dirsession' })
      end,
      'Load session',
    },
    d = {
      function()
        require('resession').delete(nil, { dir = 'dirsession' })
      end,
      'Delete session',
    },
  },
}, { prefix = '<leader>' })
