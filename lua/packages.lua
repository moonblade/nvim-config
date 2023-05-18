local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the packages.lua file
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


		-- auto-completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
			config = function()
				require("package-config.nvim-cmp")
			end,
		})

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

    -- Git gutter
    -- use({
    --   "airblade/vim-gitgutter",
    --   config = function()
    --     require("package-config.git-gutter")
    --   end
    -- })

    -- Git signs
    use({
      "lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("package-config.gitsigns")
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
