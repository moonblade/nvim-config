local map = require("package-config.utils").map

local resolve = require("telescope.config.resolve")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    layout_config = {
      preview_width = resolve.resolve_width(0.5),
    },
  },
  pickers = {
    git_files = {
      show_untracked = true
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})
require("telescope").load_extension("fzy_native")


vim.api.nvim_set_keymap('n', '<C-p>', builtin.git_files, {})
-- map('n', '<C-p>', builtin.git_files)
-- map('n', '<C-]>', builtin.find_files)
-- map('n', '<C-f>', builtin.live_grep)
-- map('n', '<leader>l', builtin.buffers)
-- map('n', '<leader>fh', builtin.help_tags)
