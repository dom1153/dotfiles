-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
-- local colors = {
-- 	rosewater = "#f5e0dc",
-- 	flamingo = "#f2cdcd",
-- 	pink = "#f5c2e7",
-- 	mauve = "#cba6f7",
-- 	red = "#f38ba8",
-- 	maroon = "#eba0ac",
-- 	peach = "#fab387",
-- 	yellow = "#f9e2af",
-- 	green = "#a6e3a1",
-- 	teal = "#94e2d5",
-- 	sky = "#89dceb",
-- 	sapphire = "#74c7ec",
-- 	blue = "#89b4fa",
-- 	lavender = "#b4befe",
-- 	text = "#cdd6f4",
-- 	subtext1 = "#bac2de",
-- 	subtext0 = "#a6adc8",
-- 	overlay2 = "#9399b2",
-- 	overlay1 = "#7f849c",
-- 	overlay0 = "#6c7086",
-- 	surface2 = "#585b70",
-- 	surface1 = "#45475a",
-- 	surface0 = "#313244",
-- 	base = "#1e1e2e",
-- 	mantle = "#181825",
-- 	crust = "#11111b",
-- }
--
require('lualine').setup {
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'branch',
      },
      'diff',
      'diagnostics',
    },
    lualine_c = {
      'filename',
    },

    lualine_x = {
      {
        require('noice').api.statusline.mode.get,
        cond = require('noice').api.statusline.mode.has,
        color = { fg = '#ff9e64' },
      },
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
      },
      'filetype',
      -- "require'lsp-status'.status()",
    },
    lualine_y = {
      'progress',
      '%L Line(s)',
    },
    lualine_z = {
      'location',
    },
  },
  -- inactive_sections = {
  -- 	lualine_a = {},
  -- 	lualine_b = {},
  -- 	lualine_c = { "filename" },
  -- 	lualine_x = { "location" },
  -- 	lualine_y = {},
  -- 	lualine_z = {},
  -- },

  tabline = {
    lualine_a = {
      -- {
      -- 	"buffers",
      -- 	filetype_names = {
      -- 		minifiles = "Mini.Files",
      -- 	},
      -- },
    },
    lualine_z = { 'tabs' },
  },

  -- TODO: this feature seems good, but I need a transparent winbar
  -- winbar = {
  -- 	lualine_a = {
  -- 		{
  -- 			-- "placeholder",
  -- 			-- separator = { left = " ", right = " " },
  -- 			-- draw_empty = true,
  -- 			"filename",
  -- 			path = 1, -- relative
  -- 			color = { bg = colors.base },
  -- 		},
  -- 	},
  -- },
  -- inactive_winbar = {
  -- 	lualine_a = {
  -- 		{
  -- 			"filename",
  -- 			path = 1, -- relative
  -- 			color = { bg = colors.base },
  -- 		},
  -- 	},
  -- },
}

local wk = require 'which-key'

-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings
wk.register({
  b = {
    ['<Tab>'] = {
      '<cmd>bnext<CR>',
      'Next buffer',
    },
    ['<S-Tab>'] = {
      '<cmd>bprev<CR>',
      'Previous buffer',
    },
  },
}, { prefix = '<leader>' })
