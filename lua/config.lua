require("user-functions")
require('Comment').setup()
require("plugin-configs/lsp-config") -- this one is based on native lsp. More functionality compared to coc
-- require("plugin-configs/coc-config") -- another lsp config (faster an simpler but less features)
require("plugin-configs/telescope")
require("plugin-configs/nvim-tree")
require("plugin-configs/aerial-setup")
require("plugin-configs/treesitter")
require("plugin-configs/lualine-config")
require("plugin-configs/obsidian-config")
require("plugin-configs/avante-setup")
require("plugin-configs/copilot-config")
require("plugin-configs/fterm-config")
require("plugin-configs/notice-config")
require("plugin-configs/dapui-config")
require('neogit').setup {}
require("todo-comments").setup {}
require('Comment').setup {}
require("notify").setup {
    stages = "fade",
    timeout = 2000,
    background_colour = "#000000",
}


-- Replace the default 'eob' character with a blank space
vim.opt.fillchars:append({ eob = " " })



