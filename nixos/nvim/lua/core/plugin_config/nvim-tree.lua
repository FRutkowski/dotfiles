vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--
vim.opt.termguicolors = true
require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

