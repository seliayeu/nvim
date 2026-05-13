return {
  "folke/snacks.nvim",
  lazy = false,
  keys = {
    { "<space>e", function() Snacks.explorer() end },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    {
      "<leader>s/",
      function()
        Snacks.picker({
          finder = "proc",
          cmd = "fd",
          args = { "--type", "d", "--exclude", ".git" },
          title = "Select search directory",
          layout = { preset = "select" },
          actions = {
            confirm = function(picker, item)
              picker:close()
              vim.schedule(function()
                Snacks.picker.grep({ cwd = item.file })
              end)
            end,
          },
          transform = function(item)
            item.file = item.text
            item.dir = true
          end,
        })
      end,
      desc = "Grep in dir",
    },
  },
  opts = {
    picker = {
      enabled = true,
      sources = {
        explorer = {
          win = {
            input = {
              keys = {
                ['<C-t>'] = { 'tab', mode = { 'i', 'n' } },
              },
            },
            list = {
              keys = {
                ['<C-t>'] = 'tab',
              },
            },
          },
        },
      },
    },
  }
}
