local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use({ 'folke/tokyonight.nvim', as = 'tokyonight' })

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')

    use("L3MON4D3/LuaSnip")


    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            'linrongbin16/lsp-progress.nvim',
            opt = true,
        }
    }

    use {
        'linrongbin16/lsp-progress.nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('lsp-progress').setup()
        end
    }

    use {
        'goolord/alpha-nvim',
        config = function ()
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("<leader> p f", "󰈞  Find file"),
                dashboard.button("<leader> p s", "󰊄  Live grep"),
                dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
                alpha.setup(dashboard.opts)
            }
        end
    }
    use { 'ThePrimeagen/harpoon' }
    use { 'tpope/vim-fugitive' }
    use { 'mbbill/undotree' }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
