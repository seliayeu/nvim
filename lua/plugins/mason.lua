return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
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
        "cssls",
        -- "ltex"
      },
    }
    require("mason-tool-installer").setup({})
  end
}
