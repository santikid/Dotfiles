local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true
set.expandtab = true

vim.g.material_style = "darker"
vim.cmd 'colorscheme material'

set.mouse = "a"
set.clipboard = "unnamed"

vim.cmd([[
set guifont=JetBrainsMono\ Nerd\ Font:h13
]])
