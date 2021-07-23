syntax enable
let mapleader = " "
set termguicolors
set clipboard+=unnamedplus
set nocompatible
set mouse=a
set scrolloff=8
set ignorecase
set smartcase
set number
set relativenumber
set updatetime=100
set linebreak
set showbreak=↪
set nowrap          " TODO: only wrap .md files
" set fo-=t           " don't automatically wrap text when typing
set showmatch
set gdefault
set tags=tags
set undolevels=10000
set history=10000
set nobackup
set nowritebackup
set noswapfile
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,noselect

autocmd VimEnter * set cmdheight=1

" markdown wrap
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup end

" netrw
augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end
let g:netrw_altfile = 1
