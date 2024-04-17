local sidebar = require 'sidebar-nvim'
sidebar.setup {
  disable_default_keybindings = 0,
  bindings = nil,
  open = false,
  side = 'right',
  initial_width = 32,
  hide_statusline = false,
  update_interval = 1000,
  sections = {
    'datetime',
    'buffers',
    -- "diagnostics",
    'git',
    -- "containers",
    'todos',
  },
  section_separator = { '', '-----', '' },
  section_title_separator = { '' },
  containers = {
    attach_shell = '/bin/sh',
    show_all = true,
    interval = 5000,
  },
  datetime = {
    format = '%a %b %d, %H:%M',
    clocks = { { name = 'local' } },
  },
  todos = {
    ignored_paths = {},
    initially_closed = true, -- toggle with t, e to open location
  },
  ['git'] = {
    icon = '', -- 
  },
}
-- cmd = {
-- 	"SidebarNvimToggle",
-- 	"SidebarNvimClose",
-- 	"SidebarNvimOpen",
-- 	"SidebarNvimFocus",
-- 	"SidebarNvimUpdate",
-- 	"SidebarNvimResize", -- pass size
-- }

local wk = require 'which-key'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  E = { '<cmd>SidebarNvimToggle<CR>', 'Toggle Sidebar' },
}, { prefix = '<leader>' })
