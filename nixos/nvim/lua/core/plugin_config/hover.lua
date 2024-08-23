require('hover').setup({
    init = function()
        -- Wymagane dostawcy
        require("hover.providers.lsp")
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
    end,
    preview_opts = {
        border = 'single'
    },
    preview_window = false,
    title = true,
    mouse_providers = {
        'LSP'
    },
    mouse_delay = 1000
})

-- Przypisanie klawiszy
 vim.keymap.set("n", "gD", require("hover").hover, {desc = "hover.nvim"})
-- vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
-- vim.keymap.set("n", "<C->", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
 -- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
--
-- -- Obsługa myszy
-- vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
--
