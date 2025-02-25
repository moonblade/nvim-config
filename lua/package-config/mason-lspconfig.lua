require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "lua_ls",
    -- "terraformls@v0.32.7",
    "tflint",
    "bashls",
  },
})

local function on_attach(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("PyrightFormat", { clear = true })
    if client.name == "pyright" then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.code_action({
                    context = {
                        only = { "source.organizeImports" }
                    },
                    apply = true
                })
            end,
        })
    end
end

require("mason-lspconfig").setup_handlers({
    function (server_name)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
    end,

    ["lua_ls"] = function ()
       require("lspconfig").lua_ls.setup {
           on_attach = on_attach,
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

    local function quickfix()
        vim.lsp.buf.code_action({
            filter = function(a) return a.isPreferred end,
            apply = true
        })
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>r', quickfix, opts)
  end
})
