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
    -- use {
    --   "terrortylor/nvim-comment",
    --   config = function()
    --     require("package-config.nvim-comment")
    --   end
    -- }

    use {
      "numToStr/Comment.nvim",
      config = function()
          require("package-config.comment")
      end
    }

    -- Color scheme
    -- use({
    --   "ellisonleao/gruvbox.nvim",
    --   config = function()
    --     require("package-config.gruvbox")
    --   end
    -- })
    -- use({
    --   "rakr/vim-one",
    --   config = function()
    --     require("package-config.one")
    --   end
    -- })
    use({
     "navarasu/onedark.nvim",
     config = function()
       require("package-config._onedark")
     end,
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

    -- Status line at bottom for each buffer, lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        require("package-config.lualine")
      end,
    })

    -- Better tokenizing with treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("package-config._treesitter")
      end,
    })

    -- Wild menu
    use {
      'gelguy/wilder.nvim',
      config = function()
        require("package-config.wilder")
        -- config goes here
      end,
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- 'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/plenary.nvim'},
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
      config = function ()
        require("package-config.telescope")
      end
    }

    -- Markdown preview
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Better terminal
    -- use({
    --   "akinsho/toggleterm.nvim", tag = '*',
    --   config = function()
    --     require("package-config.toggleterm")
    --   end
    -- })

    -- Better quoting
    use "tpope/vim-surround"

    -- Unception for git commits
    use {
        "samjwill/nvim-unception",
        setup = function()
            -- Optional settings go here!
            -- e.g.) vim.g.unception_open_buffer_in_new_tab = true
        end
    }

    -- Leap around
    use({
      "ggandor/leap.nvim",
      config = function ()
        require("package-config.leap")
      end
    })

    -- Prettier
    use('jose-elias-alvarez/null-ls.nvim')
    use({
      'MunifTanjim/prettier.nvim',
      config = function ()
        require("package-config.prettier")
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
