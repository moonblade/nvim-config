local map = require("package-config.utils").map

-- use space as the leader key
vim.g.mapleader = " "

-- open and reload configs
map("n", "<leader>,", [[:Telescope find_files cwd=$HOME/.config/nvim<cr>]])

-- jk instead of escape
map("i", "jk", "<esc>")
map("v", "jk", "<esc>")
map("t", "jk", "<C-\\><C-n>")

-- switch between buffers
map("n", "<leader><leader>", "<C-^>")

-- Quicker window movement
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- When pasting, dont change the register content
map("x", "p", '"_dP')

-- Move lines around
 map("n", "<A-j>", ":m .+1<CR>==")
 map("n", "<A-k>", ":m .-2<CR>==")
 map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
 map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
 map("v", "<A-j>", ":m '>+1<CR>gv=gv")
 map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Tabbing lines
map("v", "<tab>", ">gv")
map("v", "<S-tab>", "<gv")
