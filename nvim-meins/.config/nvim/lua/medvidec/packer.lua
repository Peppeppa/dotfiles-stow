-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'maxmx03/solarized.nvim',
	  config = function()
		  vim.o.background = 'dark' -- or 'light'

		  vim.cmd.colorscheme 'solarized'
	  end
  }

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('christoomey/vim-tmux-navigator')

--	use {
--		'VonHeikemen/lsp-zero.nvim',
--		branch = 'v3.x',
--		requires = {
--			--- Uncomment the two plugins below if you want to manage the language servers from neovim
--			{'williamboman/mason.nvim'},
--			{'williamboman/mason-lspconfig.nvim'},
--
--			-- LSP Support
--			{'neovim/nvim-lspconfig'},
--			-- Autocompletion
--			{'hrsh7th/nvim-cmp'},
--			{'hrsh7th/cmp-nvim-lsp'},
--			{'hrsh7th/cmp-nvim-lua'},
--			{'hrsh7th/cmp-buffer'},
--			{'hrsh7th/cmp-path'},
--			{'L3MON4D3/LuaSnip'},
--			{'rafamadriz/friendly-snippets'},
--			{'saadparwaiz1/cmp_luasnip'},
--		}
--	}



end)
