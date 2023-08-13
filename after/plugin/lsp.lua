require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "rust_analyzer" },
}

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

local on_attach = function(client, bufnr, lsp_name)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    buffer = bufnr,
    callback = function()
      if lsp_name == "tsserver" then
        require("typescript").actions.removeUnused({ sync = true })
      end
      vim.lsp.buf.format()
    end
  });
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["lua_ls"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "lua_ls") end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }

}
require("lspconfig")["tsserver"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "tsserver") end,
  capabilities = capabilities,
  init_options = {
    importModuleSpecifierPreference = "relative",
    jsxAttributeCompletionStyle = "none"
  }
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>h", function() rt.hover_actions.hover_actions() end, { buffer = bufnr })
      vim.keymap.set("n", "<leader>s", rt.code_action_group.code_action_group, { buffer = bufnr })
      on_attach(client, bufnr, "rust")
    end,
  },
})
