call plug#begin(stdpath('data') . '/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'

Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'sts10/vim-pink-moon'
Plug 'dracula/vim'
" Plug 'folke/tokyonight.nvim'
Plug '~/.config/nvim/forks/tokyonight-nord.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'lilydjwg/colorizer'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug '~/.config/nvim/forks/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'ThePrimeagen/harpoon'

Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-dispatch'  "required for some of the plugins below
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'  "TODO: am I using this?
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dadbod'

Plug 'rbong/vim-flog'

Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
