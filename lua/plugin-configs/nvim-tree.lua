require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_directories = {
        enable = true,
    },
    hijack_cursor = false,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        hide_root_folder = true, -- Hides the root folder
    },
    renderer = {
        group_empty = true,
        root_folder_label = false, -- Disables the root folder label display
        add_trailing = false,
        indent_markers = {
            enable = false,
        },
        icons = {
            webdev_colors = true,
        },
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
        change_dir = {
            enable = true,
            global = false,
        },
        remove_file = {
            close_window = true,
        },
        rename_file = {
            enable = true,
            use_lsp = true, -- Use LSP to rename files and update references
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    respect_buf_cwd = false,
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
