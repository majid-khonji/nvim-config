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
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'GitsignsAttach',
  callback = function(args)
    local bufnr = args.data.bufnr
    local gs = require('gitsigns')

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, silent = true })
    end

    map('n', ']c', gs.next_hunk, 'Git: next hunk')
    map('n', '[c', gs.prev_hunk, 'Git: prev hunk')

    map('n', '<leader>gsp', gs.preview_hunk, 'Git: preview hunk')
    map('n', '<leader>gss', gs.stage_hunk, 'Git: stage hunk')
    map('n', '<leader>gsr', gs.reset_hunk, 'Git: reset hunk')
    map('v', '<leader>gss', gs.stage_hunk, 'Git: stage hunk')
    map('v', '<leader>gsr', gs.reset_hunk, 'Git: reset hunk')
    map('n', '<leader>gsu', gs.undo_stage_hunk, 'Git: undo stage hunk')
    map('n', '<leader>gsd', function()
      if vim.fn.exists(':DiffviewOpen') == 2 then
        vim.cmd('DiffviewOpen %')
      else
        gs.diffthis()
      end
    end, 'Git: diff file')
  end,
})
