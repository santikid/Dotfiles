-- install lazy.nvim
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


require("lazy").setup({
	"folke/zen-mode.nvim",

	-- Colorscheme
	'marko-cerovac/material.nvim',

	'windwp/nvim-autopairs',

	'machakann/vim-sandwich',

	{
		'NeogitOrg/neogit',
		dependencies = 'nvim-lua/plenary.nvim'
	},

	-- devicons are needed by barbar & lualine, ...
	'nvim-tree/nvim-web-devicons',

	'nvim-tree/nvim-tree.lua',

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- tab bar
	'romgrk/barbar.nvim',

	-- status line
	'nvim-lualine/lualine.nvim',

	-- fzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = 'nvim-lua/plenary.nvim'
	},
	"nvim-telescope/telescope-file-browser.nvim",

	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/nvim-treesitter-context',

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	-- DEPRECATED - replace once good alternatives are available
	'jose-elias-alvarez/null-ls.nvim',

	'github/copilot.vim',

	{
		"akinsho/toggleterm.nvim",
		version = '*'
	},

	"mg979/vim-visual-multi",

	"folke/neodev.nvim",
})

require('settings')
require('plugins-config')
require('lsp')
require('keys')
