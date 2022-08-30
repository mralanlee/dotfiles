local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing Packer')
  vim.cmd(':!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[ packadd packer.nvim ]]

require('packer').startup {
  function()
    use 'wbthomason/packer.nvim'

    -- lsp
    use {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    }

    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- git
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    }
    use 'ruanyl/vim-gh-line'

    use 'Yggdroot/indentLine'
    use 'tpope/vim-commentary'
    use 'liuchengxu/vista.vim'

    -- code
    use 'fatih/vim-go'
    use 'sebdah/vim-delve'
    use 'rust-lang/rust.vim'
    use 'hashivim/vim-terraform'
    use 'juliosueiras/vim-terraform-completion'
    use 'tpope/vim-fugitive'
    -- visual
    use {
      'akinsho/bufferline.nvim',
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use { 
      'norcalli/nvim-colorizer.lua',
    }
    use 'andersevenrud/nordic.nvim'


    -- utils
    use 'rcarriga/nvim-notify'
    use 'nvim-treesitter/nvim-treesitter'
    use 'lewis6991/impatient.nvim'
    use 'christoomey/vim-tmux-navigator'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    -- Completion
    use 'jiangmiao/auto-pairs'
    use {
      'hrsh7th/nvim-cmp',
      requires = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline'},
    }
  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    }
  }
}
