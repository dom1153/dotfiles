local wk = require 'which-key'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  c = {
    m = { '<cmd>Neomake!<CR>', 'Neomake (root)' },
    M = { '<cmd>Neomake<CR>', 'Neomake (buffer)' },
  },
}, { prefix = '<leader>' })
