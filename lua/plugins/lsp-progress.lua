return {
  'linrongbin16/lsp-progress.nvim',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lsp-progress').setup()
  end
}
