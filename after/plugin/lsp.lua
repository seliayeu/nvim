require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "eslint",
    "tailwindcss",
    "svelte",
    "tsserver",
    "eslint",
    "prismals",
    "pyright",
    "clangd",
  },
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

require("lspconfig")["eslint"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "eslint") end,
  capabilities = capabilities,
}

require("lspconfig")["svelte"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "svelte") end,
  capabilities = capabilities,
}

require("lspconfig")["pyright"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "python") end,
  capabilities = capabilities,
}

require("lspconfig")["prismals"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "prisma") end,
  capabilities = capabilities,
}

require("lspconfig")["tailwindcss"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "tailwindcss") end,
  capabilities = capabilities,
}

require("lspconfig")["clangd"].setup {
  on_attach = function(client, bufnr) on_attach(client, bufnr, "clangd") end,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
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
