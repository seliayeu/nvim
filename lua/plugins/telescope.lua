return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>pc', function() builtin.live_grep { default_text = vim.fn.expand("<cword>") } end)

    local actions = require('telescope.actions')
    require('nvim-web-devicons').setup({
      override = {},
      default = true
    })
    require("telescope").setup {
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
            ["<esc>"] = actions.close,
          },
        },
        preview = {
          hide_on_startup = true
        },
        layout_config = { horizontal = { preview_width = 0.6, preview_cutoff = 100 } },
        file_ignore_patterns = { "node_modules", "yarn.lock", "Cargo.lock" },
        dynamic_preview_title = true,
      },
      pickers = {
        find_files = {
          hidden = true
        }
      },

    }
  end
}
