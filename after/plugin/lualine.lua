require('lualine').setup {
  options = {
    theme = 'tokyonight',
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
vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
  group = "lualine_augroup",
  callback = require("lualine").refresh,
})
