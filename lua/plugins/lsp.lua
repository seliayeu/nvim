return {
  "mason-org/mason-lspconfig.nvim",
  opts = function() 
    vim.lsp.config("lua_ls", {
      settings = { Lua = {
        diagnostics = {
          globals = {
            "mpv",
            "vim",
            "awesome",
            "client",
            "root",
          }
        }
      }}
    })
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--fallback-style=llvm" },
      init_options = {
        fallbackFlags = { "-std=c++23" },
      },
    })
    vim.lsp.config("pylsp", {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "E501" },
            },
          },
        },
      },
    })
    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', function()
      vim.cmd('tab split')
      vim.lsp.buf.definition()
    end)
    return { automatic_enable = true }
  end,
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
