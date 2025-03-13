return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function ()
            require("mason").setup()
        end
    },
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
	"williamboman/mason-lspconfig.nvim",
        lazy = false,
	dependencies = {
	    "neovim/nvim-lspconfig",
	    'mrcjkb/rustaceanvim'
    	},
        config = function ()
            require("mason-lspconfig").setup()
	    require("mason-lspconfig").setup_handlers {
		function (server_name)
		    require("lspconfig")[server_name].setup{}
		end,
		["lua_ls"] = function ()
                  require("lspconfig")["lua_ls"].setup {
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
                  }
		end,
                ["rust_analyzer"] = function ()
                end
	    }
        end
    },
    {
	"neovim/nvim-lspconfig",
    }
}
