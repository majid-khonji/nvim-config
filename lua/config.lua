require("user-functions")
require('Comment').setup()
require("plugin-configs/lsp-config") -- this one is based on native lsp. More functionality compared to coc
-- require("plugin-configs/coc-config")
require("plugin-configs/telescope")
require("plugin-configs/nvim-tree")
require("plugin-configs/aerial-setup")
require("plugin-configs/treesitter")
require("plugin-configs/lualine-config")
require("plugin-configs/obsidian-config")
require("plugin-configs/avante-setup")
require("plugin-configs/fterm-config")
require("plugin-configs/notice-config")
require('neogit').setup {}
require("todo-comments").setup {}
require('Comment').setup {
    padding = true, -- Add a space after the comment symbol
}
require("notify").setup {
    -- stages = "fade",
    timeout = 2000,
    background_colour = "#000000",
}


-- Replace the default 'eob' character with a blank space
vim.opt.fillchars:append({ eob = " " })

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


-- debug business
require("dapui").setup()
local dap = require('dap')
local dap_python = require('dap-python')

dap_python.setup('/usr/bin/python3') -- Adjust the path to your system Python interpreter

dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return '/usr/bin/python3' -- Adjust the path to your system Python interpreter
        end,
    },
}
