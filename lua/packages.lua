local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]])

require("packer").startup({
  function()
    -- self manage packaging package
    use({ 
      "wbthomason/packer.nvim",
    })

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

    -- Color scheme
    use({ 
      "ellisonleao/gruvbox.nvim",
      config = function()
        require("package-config.gruvbox")
      end
    })

    -- git gutter
    use({
      "airblade/vim-gitgutter",
      config = function()
        require("package-config.git-gutter")
      end
    })

    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end

  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
