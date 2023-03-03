-- install https://github.com/wbthomason/packer.nvim before using this init.lua

require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use "folke/zen-mode.nvim"

	-- Colorscheme
	use 'marko-cerovac/material.nvim'

	use 'windwp/nvim-autopairs' 

	use 'machakann/vim-sandwich'

  -- Use vimagit, load on :Magit
  use {'jreybert/vimagit'}

  -- devicons are needed by barbar & lualine, ...
  use 'kyazdani42/nvim-web-devicons'

	-- file tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
	use { "nvim-telescope/telescope-file-browser.nvim" }

	use {
		'nvim-treesitter/nvim-treesitter'
  }

  use 'neovim/nvim-lspconfig'
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

  -- lspsaga for code actions
--  use 'glepnir/lspsaga.nvim'

end)

require('plugins-config')
require('settings')
require('appearance')
require('keybindings')
require('lsp-config')
require('cmp-config')
require('treesitter-config')
require('telescope-config')
