local resolve = require("telescope.config.resolve")
local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = "close",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-o>"] = "select_default",
      },
      n = {
        ["<esc>"] = "close",
        ["o"] = "select_default",
      }
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

local project_files = function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files({})
  else
    require"telescope.builtin".find_files({})
  end
end

vim.keymap.set('n', '<C-p>', project_files, {})
vim.keymap.set('n', '<C-]>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', builtin.buffers, {})
