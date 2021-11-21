" usually I `ln init.vim ~/.vimrc` to have basic config for vim

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
set nowrap
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
set completeopt=menu,menuone,noselect

autocmd VimEnter * set cmdheight=1

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

" some remaps hack
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

nmap <leader>t2 :set tabstop=2 shiftwidth=2<CR>
nmap <leader>t4 :set tabstop=4 shiftwidth=4<CR>
