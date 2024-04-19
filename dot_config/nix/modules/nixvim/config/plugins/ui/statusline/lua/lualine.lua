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
      {
        'filename',
      },
    },

    lualine_x = {
      -- {
      --   require('noice').api.statusline.mode.get,
      --   cond = require('noice').api.statusline.mode.has,
      --   color = { fg = '#ff9e64' },
      -- },
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
        icon = 'LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
      },
    },
    lualine_y = {
      'filetype',
      '%L  ',
    },
    lualine_z = {
      '%l:%c',
    },
  },

  tabline = {
    lualine_b = {
      'filetype',
    },

    lualine_y = { 'tabs' },
  },

  winbar = {
    lualine_b = {
      {
        -- "placeholder",
        -- separator = { left = " ", right = " " },
        -- draw_empty = true,
        'filename',
        path = 1, -- relative
      },
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1, -- relative
      },
    },
  },
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
