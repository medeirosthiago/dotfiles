filetype off


" PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/base16-vim'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'tveskag/nvim-blame-line'
Plug 'ludovicchabant/vim-gutentags'
Plug 'davidhalter/jedi-vim'
Plug 'kh3phr3n/python-syntax'
Plug 'nvie/vim-flake8'
Plug 'dhruvasagar/vim-zoom'
Plug 'previm/previm'

call plug#end()


" VIM SETUP

set clipboard=unnamed
filetype plugin indent on
syntax on
set fileencoding=utf-8
set mouse=a

autocmd! bufwritepost .vimrc source %

let mapleader = " "

nmap <C-S> :update<CR>
nmap <leader>ee :quit<CR>
nmap <Leader>E :qa!<CR>
nmap <Leader>N :NERDTreeToggle<CR>
nmap <Leader>F :NERDTreeFind<CR>
nmap <leader>tb :ToggleBlameLine<CR>
nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>tj :TagbarOpen j<CR>
nmap <leader>fw :FixWhitespace<CR>
nmap <leader>ez :e! ~/.zshrc<CR>
nmap <leader>ev :e! ~/.vimrc<CR>
nmap <leader>et :e! ~/.tmux.conf<CR>
nmap <leader>no :nohlsearch<CR>
nmap <leader>gh :Dash<CR>
nmap <leader>B :set wrap linebreak tw=0<CR>
nmap <leader>BB :set nowrap linebreak tw=99<CR>
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
nmap <leader>bl :ls<CR>
nmap <leader>T :enew<CR>
nmap <leader>re :edit<CR>
nmap <leader>bw :%bwipeout<CR>

if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nmap <leader>cp :let @*=expand("%")<CR>
  " absolute path  (/something/src/foo.txt)
  nmap <leader>cap :let @*=expand("%:p")<CR>
  " filename       (foo.txt)
  nmap <leader>cfi :let @*=expand("%:t")<CR>
  " directory name (/something/src)
  nmap <leader>cd :let @*=expand("%:p:h")<CR>
endif

if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nmap <leader>cp :let @+=expand("%")<CR>
  " absolute path (/something/src/foo.txt)
  nmap <leader>cap :let @+=expand("%:p")<CR>
  " filename (foo.txt)
  nmap <leader>cfi :let @+=expand("%:t")<CR>
  " directory name (/something/src)
  nmap <leader>cd :let @+=expand("%:p:h")<CR>
endif

" json beautify
nmap <leader>js :%!python -m json.tool<CR>
" html beautify
vmap <leader>ht :!tidy -q -i --show-errors 0<CR>

vnoremap < <gv
vnoremap > >gv

" allows hidden modified buffers
set hidden

set undolevels=1000
set history=1000

set nobackup
set nowritebackup
set noswapfile

" toggle invisible chars
nmap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " ~ NEOVIM
set showbreak=↪

set relativenumber
set guicursor=	" change cursor on neovim

" set incsearch		" search as characters are entered ~ NEOVIM
set ignorecase
set smartcase

" indent settings
au BufNewFile,BufRead *.sql,*.py
    \| set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4

au BufNewFile,BufRead *.js,*.html,*.css
    \| set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

set expandtab
set shiftround      " round indent to a multiple of 'shiftwidth'
set number
set nowrap          " don't automatically wrap on load
set fo-=t           " don't automatically wrap text when typing
set showmatch
set gdefault
set winheight=5
set winminheight=5
set winheight=999

" escape terminal mode
tnoremap <Esc> <C-\><C-n>
autocmd BufEnter term://* startinsert

" enable folding
set foldmethod=indent
set foldlevel=99

set tags=tags


" COLORS

set termguicolors

" Source file with theme setting
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" PLUGIN SETUP

" fugitive
nmap <leader>gs :Gstatus<CR><C-w>25+

" python
let g:python_host_prog = '/Users/t.medeiros/.pyenv/versions/tools2/bin/python'
let g:python3_host_prog = '/Users/t.medeiros/.pyenv/versions/tools3/bin/python'

let python_highlight_all = 1

" nerdtree
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" open nerdtree when initiating vim with a path
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" does not open files/buffers in nerdtree
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif


" git-gutter
set updatetime=100
let g:gitgutter_realtime=1

" airline
let g:airline_theme='chico_airline'
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
" let g:airline_section_w = '%{ObsessionStatus()}'
let g:airline_section_z = '%3p%% %l %c'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_buffers = 1
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

" webdevicons:
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_vimfiler = 1

" fzf:
let g:fzf_buffers_jump = 0
noremap <C-F> :FZF<CR>
noremap <C-B> :Buffers<CR>

" tagbar:
let g:tagbar_sort = 0

" previm
let g:previm_open_cmd = 'open -a Firefox'

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql']

highlight htmlBold gui=bold
highlight htmlItalic gui=italic


" zoom:
nmap <C-W>z <Plug>(zoom-toggle)


" SCRIPTS

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
