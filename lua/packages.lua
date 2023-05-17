require("packer").startup({
  function()
    -- self manage packaging package
    use("wbthomason/packer.nvim")

    -- mason, for lsp config
    use {
        "williamboman/mason.nvim",
        -- :MasonUpdate updates registry contents
        config = function()
          require("package-config.mason")
        end,
        run = ":MasonUpdate" 
    }

    -- neovim lsp configs
    use({
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("package-config.mason-lspconfig")
      end,
    })
    use("neovim/nvim-lspconfig")

  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
