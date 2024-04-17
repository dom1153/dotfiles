-- stylua: ignore start

-- n : notifications
-- vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "All History" })
vim.keymap.set("n", "<leader>nh", "<cmd>Noice telescope<cr>", { desc = "All History" })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Visible Notifications" })
vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { desc = "Last Message" })
vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { desc = "Error history" })
-- vim.keymap.set("n", "<leader>ne", "<cmd>Noice log<cr>", { desc = "Noice Log" })

-- stylua: ignore end

require('noice').setup {
  -- you can enable a preset for easier configuration
  presets = {
    -- bottom_search = true, -- use a classic bottom cmdline for search
  },
  notify = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false,
    },
  },
  commands = {
    history = {
      -- view = 'popup', -- default split
    },
    history = {
      view = 'split', --default popup
    },
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
