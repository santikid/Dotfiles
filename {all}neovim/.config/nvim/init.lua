-- install https://github.com/wbthomason/packer.nvim before using this init.lua

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use "folke/zen-mode.nvim"

	-- Colorscheme
	use 'marko-cerovac/material.nvim'

	use 'windwp/nvim-autopairs'

	use 'machakann/vim-sandwich'

	use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- devicons are needed by barbar & lualine, ...
  use 'nvim-tree/nvim-web-devicons'

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	}

  -- tab bar
  use 'romgrk/barbar.nvim'

  -- status line
  use 'nvim-lualine/lualine.nvim'

  -- file browser
  use 'lambdalisue/fern.vim'

  -- fzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
	use "nvim-telescope/telescope-file-browser.nvim"

	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-context'

	use {
    "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

	use 'jose-elias-alvarez/null-ls.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

	use 'github/copilot.vim'

	use {"akinsho/toggleterm.nvim", tag = '*'}

	use "mg979/vim-visual-multi"
end)

require('plugins-config')
require('settings')
require('keys')
require('lsp')
