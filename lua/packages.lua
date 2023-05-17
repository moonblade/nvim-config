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

    -- nvim tree
    use 'kazhala/close-buffers.nvim'
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        'nvim-tree/nvim-web-devicons',
      },
      config = function()
        require("package-config.nvim-tree-config")
      end
    }

    -- Better commenting 
    use {
      "numToStr/Comment.nvim",
      config = function()
          require("package-config.comment")
      end
    }
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
