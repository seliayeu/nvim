return {
  "gungun974/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require('nvim-ts-autotag').setup({
        enable_close_on_slash = false,
    })
  end
}
