require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
