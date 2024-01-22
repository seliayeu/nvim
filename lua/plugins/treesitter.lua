return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        "c",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "html",
        "toml",
        "yaml",
        "json",
        "markdown",
        "graphql",
        "regex",
        "rust",
        "lua",
        "markdown",
        "markdown_inline"
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "latex", "markdown" },
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
        enable_close_on_slash = true,
        filetypes = {
          'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
          'rescript',
          'css', 'lua', 'xml', 'php', 'markdown'
        },
      },
      context_commentstring = {
        enable = true,
      },
    }

    require('template-string').setup({
      filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
      jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
      remove_template_string = false,                                                             -- remove backticks when there are no template string
    })
  end
}
