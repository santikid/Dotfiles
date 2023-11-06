vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = { noremap = true, silent = true }

local ts = require('telescope.builtin')
local ts_fp = require('telescope').extensions.file_browser
vim.keymap.set('n', '<leader>ff', ts.find_files, opts)
vim.keymap.set('n', '<leader>fg', ts.git_files, opts)
vim.keymap.set('n', '<leader>fs', ts.live_grep, opts)
vim.keymap.set('n', '<leader>fb', ts_fp.file_browser, opts)
vim.keymap.set('n', '<leader>fo', ts.oldfiles, opts)
vim.keymap.set('n', '<leader>b', ts.buffers, opts)

vim.keymap.set('n', '<leader>ft', require("nvim-tree.api").tree.toggle, opts)

vim.keymap.set('n', '<leader>z', require("zen-mode").toggle, opts)

vim.keymap.set('n', '<leader>g', require("neogit").open, opts)

vim.keymap.set('n', '<leader>tt', require("trouble").toggle, opts)

vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', opts)

vim.api.nvim_set_keymap('n', '<S-tab>', ':bprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':bd<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)

vim.api.nvim_set_keymap('n', '<leader>t', ':ToggleTerm 1<CR>', opts)

vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-N>', opts)

-- keybindings for multi-cursor
vim.g.VM_maps = {
	["Select Cursor Down"] = '<A-j>',
	["Select Cursor Up"] = '<A-k>'
}
