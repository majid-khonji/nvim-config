-- Minimalistic Avante configuration - only enable what's needed
require('avante').setup({
    windows = {
        position = "left", -- Position windows on the left side
        width = 75,        -- Take 75% of the window width
        fixed_width = true, -- Use fixed width mode
    },
})

-- Create an autocommand to ensure Avante's statusline is always disabled
vim.opt.laststatus = 3
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "VimEnter" }, {
    callback = function()
        vim.opt.laststatus = 3
        if vim.fn.exists('*lualine#statusline') == 1 then
            vim.o.statusline = '%!v:lua.require("lualine").statusline()'
        end
        if package.loaded['avante.statusline'] then
            package.loaded['avante.statusline'] = nil
        end
    end,
    group = vim.api.nvim_create_augroup("DisableAvanteStatusline", { clear = true }),
})
