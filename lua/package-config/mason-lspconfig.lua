require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "lua_ls",
    "terraformls",
    "tflint",
    "bashls",
  },
})

require("mason-lspconfig").setup_handlers({
    function (server_name)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
        }
    end,

    ["lua_ls"] = function ()
       require("lspconfig").lua_ls.setup {
           settings = {
               Lua = {
                   diagnostics = {
                       globals = { "vim", "use" }
                   }
               }
           }
       }
    end,
})

-- lsp config
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  end
})
