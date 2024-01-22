return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require("rose-pine").setup({
      -- dark_variant = 'moon',
      bold_vert_split = true,
      disable_float_background = true,
      disable_background = true,
    })
    vim.cmd("colorscheme rose-pine")
  end

  -- "folke/tokyonight.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- opts = {},
  -- config = function()
  --   require("tokyonight").setup({
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent"
  --     },
  --   })
  --
  --   vim.cmd("colorscheme tokyonight")
  -- end
}
