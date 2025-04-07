
-- this causes a sec delay on startup
require("CopilotChat").setup({
    window = {
        width = .8,
        height = .8,
        layout = 'float',
    },
})
local vim = vim
-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-E>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
