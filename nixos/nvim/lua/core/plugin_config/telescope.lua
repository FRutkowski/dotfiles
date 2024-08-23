local builtin = require('telescope.builtin')
-- vim.api.nvim_set_keymap('n', '<c-p>', builtin.find_files, {})
-- vim.api.nvim_set_keymap('n', '<Space><Space>', builtin.live_grep, {})
-- vim.api.nvim_set_keymap('n', '<Space>fg', builtin.buffers, {})
-- vim.api.nvim_set_keymap('n', '<Space>fh', builtin.help_tags, {})

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fg', builtin.buffers, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})

