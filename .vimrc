
" PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'

Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'connorholyday/vim-snazzy'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dadbod'

Plug 'Raimondi/delimitMate'
Plug 'ludovicchabant/vim-gutentags'
Plug 'godlygeek/tabular'

Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'rizzatti/dash.vim'

call plug#end()



" VIM SETUP

syntax enable
set termguicolors
set clipboard+=unnamedplus
set nocompatible
" filetype plugin indent on
" syntax enable
" set fileencoding=utf-8
set mouse=a

runtime macros/matchit.vim

autocmd! bufwritepost .vimrc source %

let mapleader = " "

set guicursor=	" change cursor on neovim
set ignorecase
set smartcase
set expandtab
set shiftround      " round indent to a multiple of 'shiftwidth'
set number
set relativenumber
set nowrap          " don't automatically wrap on load
set fo-=t           " don't automatically wrap text when typing
set showmatch
set gdefault
set hidden
set tags=tags

" colorscheme nord
colorscheme snazzy
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1


let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 30


nmap <leader>fw :FixWhitespace<CR>
nmap <leader>no :nohlsearch<CR>
nmap <leader>gh :Dash<CR>
" nmap <leader>B :set wrap linebreak tw=0<CR>
" nmap <leader>BB :set nowrap linebreak tw=99<CR>
nmap <leader>t2 :set tabstop=2 shiftwidth=2<CR>
nmap <leader>t4 :set tabstop=4 shiftwidth=4<CR>
nmap <leader>cf :call Flake8()<CR>
nmap <leader>os :Obsession<CR>
nmap <leader>od :Obsession!<CR>

" buffers
nmap <leader>= :bnext<CR>
nmap <leader>- :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bd :bp <BAR> bw #<CR>
nmap <leader>bw :%bwipeout<CR>

" json beautify
nmap <leader>js :%!python -m json.tool<CR>
" html beautify
vmap <leader>ht :!tidy -q -i --show-errors 0<CR>

vnoremap < <gv
vnoremap > >gv

set undolevels=1000
set history=1000

set nobackup
set nowritebackup
set noswapfile

" toggle invisible chars
nmap <leader>L :set list!<CR>
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" indent settings
au BufNewFile,BufRead *.sql,*.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4

au BufNewFile,BufRead *.js,*.html,*.css
    \| set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" windowing
set winheight=5
set winminheight=5
set winheight=999

" enable folding
set foldmethod=indent
set foldlevel=99

" escape terminal mode
tnoremap <Esc> <C-\><C-n>
autocmd BufEnter term://* startinsert

" python
" let g:python_host_prog = '/Users/t.medeiros/.pyenv/versions/tools2/bin/python'
let g:python3_host_prog = '$HOME/.pyenv/versions/tools/bin/python'



" PLUGIN SETUP

" fugitive
nmap <leader>gs :Gstatus<CR><C-w>25+


" fzf:
let g:fzf_buffers_jump = 0
noremap <C-F> :FZF<CR>
noremap <C-B> :Buffers<CR>


" git-gutter
set updatetime=100
let g:gitgutter_realtime=1


" airline
let g:airline_theme='base16_snazzy'
let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ ' ' : 'S',
      \ }
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ ['error', 'warning', 'w', 'x', 'y', 'z']
      \ ]
let g:airline_section_w = '%{ObsessionStatus()}'
let g:airline_section_z = '%3p%% %l %c'
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 0 " --> AUTOMATE THIS (shortcut)
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '',
        \ '1': '',
        \ '2': '',
        \ '3': '',
        \ '4': '',
        \ '5': '',
        \ '6': '',
        \ '7': '',
        \ '8': '',
        \ '9': ''
        \}

" switch buffers maps
let g:airline#extensions#tabline#buffer_idx_mode = 1

" tabline
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#tab_min_count = 2



" SCRIPTS AND HACKS

" increase numbers
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
2 normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" relative numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
