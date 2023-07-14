require("nvim-autopairs").setup {}
require("toggleterm").setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "tsx", "go", "json", "json5", "latex", "css", "html", "astro", "svelte", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fern'}
}

require("telescope").setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
}

require("telescope").load_extension "file_browser"

require('neogit').setup{}
