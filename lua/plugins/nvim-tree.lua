return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=none")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      sort_by = "case_sensitive",
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = true,
      },
      filters = {
        custom = { '^.git$', '^node_modules$' }
      },
      log = {
        enable = true,
        types = {
          diagnostics = true,
        }
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        }
      }
    })

    vim.keymap.set('n', '<leader>pv', '<cmd>NvimTreeToggle<cr>')
  end
}
