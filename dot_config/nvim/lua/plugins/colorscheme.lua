return {
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      style = 'day',
    },
    config = function(_, opts)
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight'
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  { -- gruvbox
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      terminal_colors = true,
      transparent_mode = true,
    },
    config = function(_, opts)
      require('gruvbox').setup(opts)
      vim.cmd 'colorscheme gruvbox'
    end,
  },

  { -- catppuccin
    'catppuccin/nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      term_colors = true,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
