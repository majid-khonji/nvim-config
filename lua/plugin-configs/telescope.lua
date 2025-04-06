-------
-- Telescope Setup
actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                -- for up and down
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    }
}

-------
