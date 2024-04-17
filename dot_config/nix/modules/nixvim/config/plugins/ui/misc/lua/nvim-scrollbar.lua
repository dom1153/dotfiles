-- https://github.com/petertriho/nvim-scrollbar

-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
local mocha = require('catppuccin.palettes').get_palette 'mocha'

require('scrollbar').setup {
  handle = {
    text = ' ',
    blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
    color = nil,
    color_nr = nil, -- cterm
    highlight = 'CursorColumn',
    hide_if_all_visible = false, -- Hides handle if all lines are visible
  },
  marks = {
    Cursor = {
      text = ' ',
      priority = 0,
      gui = 'reverse',
      color = nil,
      cterm = 'reverse',
      color_nr = nil, -- cterm
      highlight = 'Normal',
    },
  },
  excluded_buftypes = {
    'terminal',
  },
  excluded_filetypes = {
    'cmp_docs',
    'cmp_menu',
    'noice',
    'prompt',
    'TelescopePrompt',
  },
  handlers = {
    cursor = false,
    diagnostic = false,
    gitsigns = false, -- Requires gitsigns
    handle = true,
    search = false, -- Requires hlslens
    ale = false, -- Requires ALE (asynchronous lint engine
  },
}
