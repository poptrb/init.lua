return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
           'nvim-telescope/telescope.nvim', tag = '0.1.0',
           requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    "catppuccin/nvim",
    as = "theme-catppuccin"
  })
--  use({
--	  'projekt0n/github-nvim-theme',
--	  as = 'github-theme',
--	  config = function()
--      require('github-theme').setup({
--        theme_style = light,
--        sidebars = {"terminal", "packer"}
--      })
--	  end
--  })
--
  use("theprimeagen/harpoon")
  use({
		"nvim-treesitter/nvim-treesitter",
                --commit = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
		run = ":TSUpdate"
  })

  use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
      	  -- LSP Support
      	  {'neovim/nvim-lspconfig'},
      	  {'williamboman/mason.nvim'},
      	  {'williamboman/mason-lspconfig.nvim'},

      	  -- Autocompletion
      	  {'hrsh7th/nvim-cmp'},
      	  {'hrsh7th/cmp-buffer'},
      	  {'hrsh7th/cmp-path'},
      	  {'saadparwaiz1/cmp_luasnip'},
      	  {'hrsh7th/cmp-nvim-lsp'},
      	  {'hrsh7th/cmp-nvim-lua'},

      	  -- Snippets
      	  {'L3MON4D3/LuaSnip'},
      	  {'rafamadriz/friendly-snippets'},
        }
  }

--  use("theprimeagen/harpoon")
--  use("theprimeagen/refactoring.nvim")
--  use("mbbill/undotree")
--  use("tpope/vim-fugitive")
--  use("nvim-treesitter/nvim-treesitter-context");
--
--  use("folke/zen-mode.nvim")
--  use("github/copilot.vim")
--  use("eandrju/cellular-automaton.nvim")
--  use("laytan/cloak.nvim")

end)

