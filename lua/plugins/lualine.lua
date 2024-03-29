return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'linrongbin16/lsp-progress.nvim',
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'rose-pine',
      },
      icons_enabled = true,
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = {
          "require('lsp-progress').progress()",
        },
      },
    }


    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end
}
