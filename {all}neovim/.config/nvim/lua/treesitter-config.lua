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

