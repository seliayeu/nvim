return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = true },
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    picker = { enabled = true },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>re", function() Snacks.explorer.reveal() end, desc = "File Explorer" }
  }
}
