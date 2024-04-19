require('staline').setup {
  sections = {
    left = { '-mode', ' ', 'branch' },
    mid = { 'lsp_name' },
    right = { 'file_name', 'line_column' },
  },
  inactive_sections = {
    left = { '-mode', ' ', 'branch' },
    mid = { 'lsp_name' },
    right = { 'file_name', 'line_column' },
  },
  defaults = {
    left_separator = ' ',
    right_separator = '  ',
    branch_symbol = ' ',
    mod_symbol = '',
    line_column = '[%l/%L]',
    inactive_color = '#80a6f2', --#303030 is the default
    inactive_bgcolor = 'none',
  },
  special_table = {
    lazy = { 'Plugins', '💤 ' },
    TelescopePrompt = { 'Telescope', '  ' },
    oil = { 'Oil', '󰏇 ' },
    lazygit = { 'LazyGit', ' ' },
  },
  mode_icons = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['nov'] = 'NORMAL',
    ['noV'] = 'NORMAL',
    ['niI'] = 'NORMAL',
    ['niR'] = 'NORMAL',
    ['niV'] = 'NORMAL',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['ix'] = 'INSERT',
    ['s'] = 'INSERT',
    ['S'] = 'INSERT',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL',
    [''] = 'VISUAL',
    ['r'] = 'REPLACE',
    ['r?'] = 'REPLACE',
    ['R'] = 'REPLACE',
    ['c'] = 'COMMAND',
    ['t'] = 'TERMINAL',
  },
}

-- autcmd to start at home ; this has issues in that passing a directory via cli will not override
local os = require 'os'
local vim_enter_group = vim.api.nvim_create_augroup('vim_enter_group', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, { pattern = '*', command = 'cd ' .. '$HOME', group = vim_enter_group })

-- will be useful if trying to future-proof icons
-- not likely i'll ever impl but it's useful
-- actually... this might be a custom variable
-- vim.g.icons_enabled ~= false and "" or "+"

-- autocmd FileType c setlocal commentstring=//\ %s
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'kdl' },
  callback = function()
    vim.opt.commentstring = '// %s'
  end,
  desc = 'Change commentstring for KDL files',
})

require('lualine').setup {
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},

    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      'location',
      '%p%%/%L ',
      'progress',
      "require'lsp-status'.status()",
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        filetype_names = {
          minifiles = 'Mini.Files',
          toggleterm = 'Toggle Term',
          buffer_manager = 'Buffer Manager',
        },
      },
      {
        'filename',
        path = 1, -- relative
      },
    },

    lualine_z = { 'tabs' },
  },

  winbar = {
    lualine_a = {
      {
        -- "placeholder",
        -- separator = { left = " ", right = " " },
        -- draw_empty = true,
        'filename',
        path = 1, -- relative
        color = { bg = colors.base },
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1, -- relative
        color = { bg = colors.base },
      },
    },
  },
}

-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
local colors = {
  rosewater = '#f5e0dc',
  flamingo = '#f2cdcd',
  pink = '#f5c2e7',
  mauve = '#cba6f7',
  red = '#f38ba8',
  maroon = '#eba0ac',
  peach = '#fab387',
  yellow = '#f9e2af',
  green = '#a6e3a1',
  teal = '#94e2d5',
  sky = '#89dceb',
  sapphire = '#74c7ec',
  blue = '#89b4fa',
  lavender = '#b4befe',
  text = '#cdd6f4',
  subtext1 = '#bac2de',
  subtext0 = '#a6adc8',
  overlay2 = '#9399b2',
  overlay1 = '#7f849c',
  overlay0 = '#6c7086',
  surface2 = '#585b70',
  surface1 = '#45475a',
  surface0 = '#313244',
  base = '#1e1e2e',
  mantle = '#181825',
  crust = '#11111b',
}

-- cmdline / minimal noice is a buggy or unsure mess
require('noice').setup {
  -- you can enable a preset for easier configuration
  cmdline = {
    enabled = true,
    view = 'cmdline', -- classic cmdline
    format = {
      cmdline = {
        view = 'cmdline',
        conceal = false,
      },
      search_down = {
        view = 'cmdline',
        conceal = false,
      },
      search_up = {
        view = 'cmdline',
        conceal = false,
      },
      filter = {
        view = 'cmdline',
        conceal = false,
      },
      lua = {
        view = 'cmdline',
        conceal = false,
      },
      help = {
        view = 'cmdline',
        conceal = false,
      },
    },
  },
  messages = {
    enabled = false,
  },
  popupmenu = {
    enabled = false,
  },
  commands = {
    history = {
      -- view = 'popup', -- default split
    },
    last = {
      view = 'split', --default popup
    },
  },
  notify = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    message = {
      -- Messages shown by lsp servers
      enabled = true,
    },
  },
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
  },
  -- disable virtual text
  routes = {
    {
      filter = {
        event = 'msg_show',
        kind = 'search_count',
      },
      opts = { skip = true },
    },
  },
}
