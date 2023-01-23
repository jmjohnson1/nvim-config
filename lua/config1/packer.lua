-- only required with packer configured as 'opt'
vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', branch='0.1.x',
		requires = {{'nvim-lua/plenary.nvim'}}
	}

	-- LSP configuration and plugins
	use {
		'neovim/nvim-lspconfig',
		requires = {
			-- Automatically installs LSPs
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration with help, docstrings, etc.
			'folke/neodev.nvim'
		}
	}

	-- Autocompletion
	use {
		'hrsh7th/nvim-cmp',
		requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }
	}

	-- Highlight, edit, and navigate code
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim.treesitter.install').update {with_sync = true})
		end
	}

	-- Additional text objects via treesitter
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter'
	}

	-- Package for indentation guides
	use {
		"lukas-reineke/indent-blankline.nvim"
	}


	-- Everforest color scheme
	use {"sainnhe/everforest"}

	-- Easy align
	use {"junegunn/vim-easy-align"}


end)

vim.cmd.colorscheme("everforest")
