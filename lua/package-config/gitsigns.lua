-- Show gitsign in a new column
vim.opt.signcolumn = "yes"

require("gitsigns").setup({
	on_attach = function(bufnr)
    local function map(mode, lhs, rhs)
        local options = { noremap = true, silent = true }
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end

		map("n", "<leader>p", "<cmd>Gitsigns preview_hunk<CR>")
		map("n", "<leader>u", "<cmd>Gitsigns reset_hunk<CR>")
  end
})
