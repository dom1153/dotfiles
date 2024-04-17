return {
  { -- A fast and easy to configure Neovim statusline written in Lua.
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        icons_enabled = true,
        theme = 'gruvbox',
      }
    end,
  },
}
