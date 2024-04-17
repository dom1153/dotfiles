require('telescope').setup {
  extensions = {
    emoji = {
      -- -- emoji list supports https://emojipedia.org/emoji-4.0
      -- -- argument 'emoji' is a table.
      -- -- {name="", value="", cagegory="", description=""}
      action = function(emoji)
        -- -- defualt behavior
        -- vim.fn.setreg("*", emoji.value)
        -- vim.fn.setreg('"', emoji.value)
        -- print([[Press p or "*p to paste this emoji]] .. emoji.value)

        -- to clipboard >:3
        vim.fn.setreg('+', emoji.value)
        print([[Selected "]] .. emoji.value .. [[" and copied to clipboard]])

        -- insert emoji when picked
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
      end,
    },
  },
}

require('telescope').load_extension 'emoji'
