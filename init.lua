vim.g.mapleader = " "

require("base")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'linrongbin16/lsp-progress.nvim',
    },
  },
  {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lsp-progress').setup()
    end
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "onsails/lspkind-nvim",
  "glepnir/lspsaga.nvim",

  "L3MON4D3/LuaSnip",

  "jose-elias-alvarez/typescript.nvim",

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup({}) end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },
  "nvim-treesitter/nvim-treesitter-context",

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "VeryLazy"
  },
  "windwp/nvim-autopairs",
  "mg979/vim-visual-multi",
  "p00f/nvim-ts-rainbow",
  "axelvc/template-string.nvim",

  "folke/todo-comments.nvim",
  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",

  "tpope/vim-obsession",
  {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
    }
  },

  "f-person/git-blame.nvim",

  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  'ThePrimeagen/harpoon',
  'tpope/vim-fugitive',
  'gcmt/wildfire.vim',

  'rmagatti/alternate-toggler',

  "github/copilot.vim",

  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true
      },
    },
  },
})

require("text")
require("color")
require("remap")
