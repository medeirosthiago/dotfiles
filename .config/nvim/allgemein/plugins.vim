call plug#begin(stdpath('data') . '/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'

" Themes/colors
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'sts10/vim-pink-moon'
Plug 'chriskempson/base16-vim'

" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'hrsh7th/nvim-compe'


Plug 'tpope/vim-dispatch'  "TODO: am I using this?
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'  "TODO: am I using this?
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-dadbod'  "TODO: am I using this?
" Plug 'tpope/vim-dotenv'  "TODO: am I using this?

Plug 'rbong/vim-flog'

Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'

Plug 'rizzatti/dash.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()