local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'tsserver',
    'eslint',
    'volar'
})


lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = lsp.default_keymaps({ buffer = bufnr, remap = false })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['gopls'] = { 'go' },
        ['clangd'] = { 'c' },
        ['jedi-language-server'] = { 'python' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        ['null-ls'] = { 'javascript', 'typescript', 'vue', 'css', 'html' },
    }
})


local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        -- Replace these with the tools you have installed
        -- make sure the source name is supported by null-ls
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.stylua,
    }
})

lsp.setup()
