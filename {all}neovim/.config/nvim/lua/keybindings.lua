vim.g.mapleader = ","
  
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope grep_string<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>fo', ':Telescope oldfiles<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', {noremap=true})
  
vim.api.nvim_set_keymap('n', '<leader>ft', ':NvimTreeToggle<CR>', {noremap=true})
  
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', {noremap=true})
  
vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', {noremap=true})
  
vim.api.nvim_set_keymap('n', 'n', '{<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'm', '}<CR>', {noremap=true})
  
vim.api.nvim_set_keymap('n', '<space>p', ':bprevious<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>n', ':bnext<CR>', {noremap=true})

vim.api.nvim_set_keymap('n', '<tab>', ':bnext<CR>', {noremap=true})

vim.api.nvim_set_keymap('n', '<space>q', ':bd<CR>', {noremap=true})

vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap=true})

vim.api.nvim_set_keymap('n', '<space>t', ':ToggleTerm 1<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>tt', ':ToggleTerm 2<CR>', {noremap=true})

vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-N>', {noremap=true})

-- keybindings for multi-cursor
vim.g.VM_maps = {
	["Select Cursor Down"] = '<A-j>',
	["Select Cursor Up"] = '<A-k>'
}
