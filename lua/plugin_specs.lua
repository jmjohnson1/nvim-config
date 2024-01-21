local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp', 
			'L3MON4D3/LuaSnip', 
			'saadparwaiz1/cmp_luasnip'
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically installs LSPs
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',

			-- Additional lua configuration with help, docstrings, etc.
			'folke/neodev.nvim'
		},
		config = function()
			require("config.lsp")
		end,
	},
	-- Fuzzy finding
	{
		"nvim-telescope/telescope.nvim", branch = "0.1.x",
		dependencies = {"nvim-lua/plenary.nvim"},
		config = function()
			require("config.telescope")
		end,
	},
	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
	-- Additional text objects for treesitter
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"lukas-reineke/indent-blankline.nvim"
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		"lervag/vimtex"
	},
	{
		"junegunn/vim-easy-align"
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup({
				copy_sync = {
					enable = false,
					redirect_to_clipboard = true,
					register_offset = 0,
					sync_clipboard = true,
					sync_deletes = true,
				},})
		end
	},
	{
		"stevearc/vim-arduino"
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
	},

	-- Sessions
	{
		"natecraddock/sessions.nvim",
		lazy = false,
		priority = 500,
	},
}

require("lazy").setup(plugin_specs)
