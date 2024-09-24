require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>go", "<cmd>DiffviewOpen<CR>", {desc = "Open Git Diff View"})
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", {desc = "Close Git Diff View"})
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
