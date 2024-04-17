require('telescope').setup {
  extensions = {
    glyph = {
      action = function(glyph)
        -- to clipboard >:3
        vim.fn.setreg('+', glyph.value)
        print([[Selected "]] .. glyph.value .. [[" and copied to clipboard]])

        -- insert glyph when picked
        vim.api.nvim_put({ glyph.value }, 'c', false, true)
      end,
    },
  },
}

require('telescope').load_extension 'glyph'
