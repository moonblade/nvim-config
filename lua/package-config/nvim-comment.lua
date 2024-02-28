require('nvim_comment').setup()
local map = require("package-config.utils").map

map("n", "<leader-q>", ":CommentToggle")
map("n", "<C-_>", ":CommentToggle")
map("i", "<C-_>", ":CommentToggle")
map("x", "<C-_>", ":CommentToggle")
