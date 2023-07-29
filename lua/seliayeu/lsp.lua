require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "rust_analyzer" },
}


local on_attach = function(client, _)
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["lua_ls"].setup {
    on_attach = on_attach,
    capabilities = capbilities
}
require("lspconfig")["rust_analyzer"].setup {
    on_attach = on_attach,
    capabilities = capbilities
}
