local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add" })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Quick Menu" })

--stylua: ignore
vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, { desc = "Go 1" })
--stylua: ignore
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end, { desc = "Go 2" })
--stylua: ignore
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end, { desc = "Go 3" })
--stylua: ignore
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end, { desc = "Go 4" })
