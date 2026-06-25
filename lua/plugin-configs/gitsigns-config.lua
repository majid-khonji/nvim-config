-- Leader is ";". Avoid <leader>h (;h = Harpoon) and <leader>g (;g = DAP UI).
-- Git maps use <leader>G (Shift+g): ;Gp, ;Gs, ;Gr, ;Gd, etc.

require('gitsigns').setup({
  signcolumn = true,
  numhl = true,
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = require('gitsigns')

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
    end

    map('n', ']c', gs.next_hunk, 'Git: next hunk')
    map('n', '[c', gs.prev_hunk, 'Git: prev hunk')

    map('n', '<leader>Gp', gs.preview_hunk, 'Git: preview hunk')
    map('n', '<leader>Gs', gs.stage_hunk, 'Git: stage hunk')
    map('n', '<leader>Gr', gs.reset_hunk, 'Git: reset hunk')
    map('v', '<leader>Gs', gs.stage_hunk, 'Git: stage hunk')
    map('v', '<leader>Gr', gs.reset_hunk, 'Git: reset hunk')
    map('n', '<leader>Gu', gs.undo_stage_hunk, 'Git: undo stage hunk')
    map('n', '<leader>Gd', function()
      if vim.fn.exists(':DiffviewOpen') == 2 then
        vim.cmd('DiffviewOpen')
      else
        gs.diffthis()
      end
    end, 'Git: diff all changes')
  end,
})

-- Diffview works even outside a git-tracked buffer (repo-level)
vim.keymap.set('n', '<leader>GD', function()
  if vim.fn.exists(':DiffviewOpen') == 2 then
    vim.cmd('DiffviewOpen')
  end
end, { desc = 'Git: Diffview open', silent = true })

vim.keymap.set('n', '<leader>GC', function()
  if vim.fn.exists(':DiffviewClose') == 2 then
    vim.cmd('DiffviewClose')
  end
end, { desc = 'Git: Diffview close', silent = true })
