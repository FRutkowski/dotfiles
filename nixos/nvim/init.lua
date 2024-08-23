require('core.keymaps')
require('core.plugins')
require('core.plugin_config')

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.o.guifont = "Source Code Pro:h8"
end

vim.wo.relativenumber = true
