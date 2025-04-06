vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox_dark',
        -- theme = 'gruvbox-material',
        section_separators = '',
        component_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = { 'filename' },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 0,
                color = { fg = '#fabd2f', gui = 'bold' } -- Set the foreground color to white and make it bold
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
