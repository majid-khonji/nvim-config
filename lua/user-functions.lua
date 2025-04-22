vim.api.nvim_create_user_command(
    'FormatWithBlack',
    function()
        vim.cmd('write')
        vim.cmd('silent! !black --line-length 120 %')
    end,
    { nargs = 0 }
)

