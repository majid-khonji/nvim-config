local lazy = require('diffview.lazy')
local FileHistoryView = lazy.access(
  'diffview.scene.views.file_history.file_history_view',
  'FileHistoryView'
)
local DiffView = lazy.access(
  'diffview.scene.views.diff.diff_view',
  'DiffView'
)

local function find_view(class)
  local ok, lib = pcall(require, 'diffview.lib')
  if not ok then
    return nil
  end
  for _, view in ipairs(lib.views) do
    if view:instanceof(class.__get()) then
      return view
    end
  end
end

function _G.toggle_file_history()
  if vim.fn.exists(':DiffviewFileHistory') ~= 2 then
    return
  end
  local view = find_view(FileHistoryView)
  if view then
    view:close()
  else
    vim.cmd('DiffviewFileHistory')
  end
end

function _G.toggle_diffview()
  if vim.fn.exists(':DiffviewOpen') ~= 2 then
    return
  end
  local view = find_view(DiffView)
  if view then
    view:close()
  else
    vim.cmd('DiffviewOpen')
  end
end
