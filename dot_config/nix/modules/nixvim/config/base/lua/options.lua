-- misc options

-- some plugin breaks shortmess anyways
-- not that I was using the splash anyways
vim.opt.shortmess:append 'I'

-- keeps traditional vim g/GG
vim.opt.startofline = true

function ToggleLineNumber()
  if vim.wo.number then
    vim.wo.number = false
    -- show_notification("Line numbers disabled", "info")
  else
    vim.wo.number = true
    vim.wo.relativenumber = false
    -- show_notification("Line numbers enabled", "info")
  end
end

function ToggleRelativeLineNumber()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    -- show_notification('Relative line numbers disabled', 'info')
  else
    vim.wo.relativenumber = true
    vim.wo.number = false
    -- show_notification('Relative line numbers enabled', 'info')
  end
end

function ToggleWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    -- show_notification('Wrap disabled', 'info')
  else
    vim.wo.wrap = true
    vim.wo.number = false
    -- show_notification('Wrap enabled', 'info')
  end
end

local wk = require 'which-key'
wk.register({
  -- basic config
  u = {
    w = { ToggleWrap, 'Toggle Wrap' },
    L = { ToggleRelativeLineNumber, 'Toggle Relative Line Numbers' },
    l = { ToggleLineNumber, 'Toggle Line Numbers' },
  },
}, { prefix = '<leader>' })

-- if vim.lsp.inlay_hint then
--   vim.keymap.set('n', '<leader>uh', function()
--     vim.lsp.inlay_hint(0, nil)
--   end, { desc = 'Toggle Inlay Hints' })
-- end
