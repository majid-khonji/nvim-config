------------------------------------------------------------
-- Mason
------------------------------------------------------------
require('mason').setup()

------------------------------------------------------------
-- LSP: shared capabilities + on_attach
------------------------------------------------------------
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function on_attach(client, bufnr)
    -- Semantic tokens (for rich semantic highlighting)
    if client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
    end

    -- Optional: inlay hints (if your Neovim + LSP support them)
    if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
        if type(vim.lsp.inlay_hint) == "table" and vim.lsp.inlay_hint.enable then
            -- Neovim 0.10+ style
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        elseif type(vim.lsp.inlay_hint) == "function" then
            -- Older style
            vim.lsp.inlay_hint(bufnr, true)
        end
    end

    -- Signature help: <C-s> in insert mode
    local opts = { buffer = bufnr, silent = true, noremap = true }
    vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)
end

------------------------------------------------------------
-- LSP server configs
------------------------------------------------------------

-- Python (Pyright)
vim.lsp.config('pyright', {
    cmd = { 'pyright-langserver', '--stdio' },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})

-- Lua
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Svelte
vim.lsp.config('svelte', {
    cmd = { 'svelteserver', '--stdio' },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- C/C++
vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Enable all configured servers
vim.lsp.enable({ 'pyright', 'lua_ls', 'svelte', 'clangd' })

------------------------------------------------------------
-- nvim-cmp
------------------------------------------------------------
local cmp = require 'cmp'

cmp.setup({
    window = {
        -- you can uncomment these for borders:
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
})

-- Cmdline completion for :
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<Down>'] = {
            c = cmp.mapping.select_next_item(),
        },
        ['<Up>'] = {
            c = cmp.mapping.select_prev_item(),
        },
    }),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
})

------------------------------------------------------------
-- Python: trigger completion after '.'
------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set("i", ".", function()
            vim.api.nvim_put({ "." }, "c", false, true)
            vim.schedule(function()
                require("cmp").complete({ reason = require("cmp").ContextReason.Auto })
            end)
        end, { buffer = true, expr = false })
    end,
})

------------------------------------------------------------
-- Semantic token highlight: make Python types/params pop
------------------------------------------------------------
local function setup_python_semantic_highlights()
    local hl = vim.api.nvim_set_hl

    -- Types / classes
    hl(0, "@lsp.type.class.python",      { link = "Type" })
    hl(0, "@lsp.type.type.python",       { link = "Type" })
    hl(0, "@lsp.type.enum.python",       { link = "Type" })

    -- Functions / methods
    hl(0, "@lsp.type.function.python",   { link = "Function" })
    hl(0, "@lsp.type.method.python",     { link = "Function" })

    -- Parameters / variables / fields
    hl(0, "@lsp.type.parameter.python",  { link = "Identifier" })
    hl(0, "@lsp.type.variable.python",   { link = "Identifier" })
    hl(0, "@lsp.type.property.python",   { link = "Identifier" })

    -- Constants / readonly
    hl(0, "@lsp.type.enumMember.python", { link = "Constant" })
    hl(0, "@lsp.mod.readonly",           { link = "Constant" })
end

setup_python_semantic_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = setup_python_semantic_highlights,
})

