-- theme randomhue comes from mini.hue
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hues.md#demo
-- TODO: override mini.hue to become transparent
vim.keymap.set("n", "<leader>ut", "<cmd>colorscheme randomhue<cr>", { desc = "Theme Random" })
vim.keymap.set("n", "<leader>uT", "<cmd>colorscheme catppuccin<cr>", { desc = "Theme Catppuccin" })
