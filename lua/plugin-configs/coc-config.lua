-- Coc configuration
vim.g.coc_global_extensions = {
    'coc-snippets',
    'coc-pairs',
    'coc-tsserver',
    'coc-json',
    'coc-html',
    'coc-css',
    'coc-pyright'
}

vim.api.nvim_set_keymap('n', 'K', ':call CocActionAsync("doHover")<CR>', {silent = true, noremap = true})
vim.g.coc_user_config = {
    -- suggest = {
    --     noselect = false,
    --     enablePreselect = true,
    --     triggerCompletionWait = 0,
    --     minTriggerInputLength = 1,
    --     autoTrigger = "always"
    -- },
    inlayHint = {
        enable = false
    },
    diagnostic = {
        virtualText = false,
        underline = false,
        updateInInsert = false
    }
}
vim.g.coc_preferences = {
    floatBorder = false
}
