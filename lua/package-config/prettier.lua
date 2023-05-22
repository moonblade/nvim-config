local map = require("package-config.utils").map
require("prettier").setup({
  bin = 'prettier',
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

map("n", "<leader>p", ":Prettier")
