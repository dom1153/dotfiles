-- stylua: ignore start

-- n : notifications
vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "All History" })
vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss Visible Notifications" })
vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { desc = "Error history" })

-- stylua: ignore end
