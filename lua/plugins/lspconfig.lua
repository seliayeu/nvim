return {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
        ensure_installed = { "lua_ls", "rust_analyzer" },
    },
    dependencies = {
        {
          "mason-org/mason.nvim", opts = { } ,
          lazy = false
        },
        "neovim/nvim-lspconfig",
    },
    config = function ()
      require("mason").setup()
      require("mason-lspconfig").setup()
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--resource-dir=" .. vim.fn.system("clang --print-resource-dir"):gsub("\n", ""),
        },
        root_markers = { '.clangd', 'compile_commands.json' },
        capabilities = {
          textDocument = {
            semanticTokens = {
              multilineTokenSupport = true,
            }
          }
        }
      })
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
      vim.keymap.set('n', 'K', vim.diagnostic.open_float, {})
    end
}
--
-- return {
--     {
--         "williamboman/mason.nvim",
--         lazy = false,
--         config = function ()
--             require("mason").setup()
--         end
--     },
--     {
--       'mrcjkb/rustaceanvim',
--       version = '^4', -- Recommended
--       lazy = false, -- This plugin is already lazy
--     },
--     {
-- 	"williamboman/mason-lspconfig.nvim",
--         lazy = false,
-- 	dependencies = {
-- 	    "neovim/nvim-lspconfig",
-- 	    'mrcjkb/rustaceanvim'
--     	},
--         config = function ()
--             require("mason-lspconfig").setup()
--
-- 		--    require("mason-lspconfig").setup_handlers {
-- 		-- function (server_name)
-- 		--     require("lspconfig")[server_name].setup{}
-- 		-- end,
-- 		-- ["lua_ls"] = function ()
-- 		--                 require("lspconfig")["lua_ls"].setup {
-- 		--                   settings = { Lua = {
-- 		--                       diagnostics = {
-- 		--                         globals = {
-- 		--                           "mpv",
-- 		--                           "vim",
-- 		--                           "awesome",
-- 		--                           "client",
-- 		--                           "root",
-- 		--                         }
-- 		--                       }
-- 		--                     }}
-- 		--                 }
-- 		-- end,
-- 		--               ["rust_analyzer"] = function ()
-- 		--               end
-- 		--    }
--         end
--     },
--     {
-- 	"neovim/nvim-lspconfig",
--     }
-- }
