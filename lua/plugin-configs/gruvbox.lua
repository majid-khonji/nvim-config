
------------------------------------------------------------
-- HARD override: kill gruvbox orange for Python types
------------------------------------------------------------
local function hard_fix_gruvbox_python_types()
  local hl = vim.api.nvim_set_hl

  -- Completely unlink from `Type`
  hl(0, "@lsp.type.class.python",      { link = "Identifier" })
  hl(0, "@lsp.type.type.python",       { link = "Identifier" })
  hl(0, "@lsp.type.enum.python",       { link = "Identifier" })
  hl(0, "@lsp.type.typeParameter.python", { link = "Identifier" })

  -- Optional: make them slightly distinct
  hl(0, "Identifier", { fg = "#ebdbb2" }) -- gruvbox fg1 (safe)
end

hard_fix_gruvbox_python_types()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = hard_fix_gruvbox_python_types,
})

