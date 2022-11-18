vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use "nvim-lua/plenary.nvim"

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- TODO: figure out it this works
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'onsails/lspkind.nvim' }
  }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'onsails/lspkind.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { "folke/lua-dev.nvim" }
  use { 'b3nj5m1n/kommentary' }

  -- TODO: figure out how this works
  use { 'ThePrimeagen/harpoon' }

  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }

  -- TODO: check if I really need all these from tpope
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-obsession' }

  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }

  use { 'lilydjwg/colorizer' }

  use { 'editorconfig/editorconfig-vim' }

  -- from old config
  -- Plug 'editorconfig/editorconfig-vim'
  -- Plug 'junegunn/gv.vim'
  -- Plug 'rhysd/git-messenger.vim'
  -- Plug 'sheerun/vim-polyglot'
  -- Plug 'rafcamlet/nvim-luapad'
  -- Plug 'folke/lsp-colors.nvim'
  -- Plug 'folke/trouble.nvim'
  -- Plug 'folke/todo-comments.nvim'
  -- Plug 'Raimondi/delimitMate'
  -- Plug 'godlygeek/tabular'
  -- Plug 'plasticboy/vim-markdown'
  -- Plug 'bronson/vim-trailing-whitespace'
  -- Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  -- colorscheme
  use { 'rmehri01/onenord.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }

end)
