-------
--- Funciton Tree
require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffe
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "<c-p>", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<c-n>", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    keymaps = { ["<Tab>"] = "actions.scroll" },
    layout = {
        default_direction = "prefer_left",
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 20,
    },
    show_guides = false, -- Disable guides to remove '~' symbols
})
-------
vim.opt.fillchars:append({ eob = " " }) -- Replace '~' with a blank space
