call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-lua/popup.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dadbod'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'folke/lua-dev.nvim'
Plug 'rafcamlet/nvim-luapad'
Plug 'b3nj5m1n/kommentary'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'bronson/vim-trailing-whitespace'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" colorscheme
" Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" Plug 'sts10/vim-pink-moon'
" Plug 'dracula/vim'
" Plug 'folke/tokyonight.nvim'
" Plug '~/.config/nvim/hack/tokyonight-nord.nvim'
" Plug 'shaunsingh/nord.nvim'
" Plug 'rebelot/kanagawa.nvim'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }

call plug#end()
