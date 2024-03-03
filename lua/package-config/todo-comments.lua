local map = require("package-config.utils").map
require("todo-comments").setup({})

map("n", "<leader>d", ":TodoTelescope<CR>")

