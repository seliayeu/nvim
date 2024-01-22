return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })

    local on_attach = function(client, bufnr, lsp_name)
      local opts = { noremap = true, silent = true }
      client.server_capabilities.documentFormattingProvider = true

      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
      --   buffer = bufnr,
      --   callback = function()
      --     if lsp_name == "tsserver" then
      --       require("typescript").actions.removeUnused({ sync = true })
      --     end
      --     vim.lsp.buf.format()
      --   end
      -- });
      --
      -- vim.api.nvim_create_autocmd('BufWritePre', {
      --   pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
      --   command = 'silent! EslintFixAll',
      --   group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
      -- })
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig")["lua_ls"].setup {
      on_attach = function(client, bufnr) on_attach(client, bufnr, "lua_ls") end,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'mp' }
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

    require("lspconfig")["cssls"].setup {
      on_attach = function(client, bufnr) on_attach(client, bufnr, "cssls") end,
      capabilities = capabilities,
    }

    require("lspconfig")["ltex"].setup {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr, "latex")
        vim.keymap.set('n', '<localleader>lc', '<cmd>VimtexClean<cr>')
        vim.keymap.set('n', '<localleader>li', '<cmd>VimtexInfo<cr>')
        vim.keymap.set('n', '<localleader>li', '<cmd>VimtexCompile<cr>')
        vim.keymap.set('n', '<localleader>le', '<cmd>VimtexErrors<cr>')
        vim.keymap.set('n', '<localleader>lv', '<cmd>VimtexView<cr>')
      end,
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
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              enable = true,
              command = "clippy",
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
    })
  end
}
