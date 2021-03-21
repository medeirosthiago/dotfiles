
syntax enable
let mapleader = " "
set termguicolors
set clipboard+=unnamedplus  "TODO: grok this
set nocompatible
set mouse=a  "TODO: what is this?
set scrolloff=8
set guicursor= " "
set ignorecase
set smartcase  "TODO: what is this?
set expandtab  "TODO: what is this?
set shiftround  "TODO: what is this?
set number
set relativenumber
set updatetime=100
set nowrap          " don't automatically wrap on load
set fo-=t           " don't automatically wrap text when typing
set showmatch
set gdefault  "TODO: what is this?
set tags=tags  "TODO: what is this?
set undolevels=10000
set history=10000
set nobackup
set nowritebackup
set noswapfile
set showbreak=↪
set foldmethod=indent
set foldlevel=99

set completeopt=menuone,noselect

" set inccommand=split  " replace while substituting things
autocmd VimEnter * set cmdheight=1   " make the command above run always
augroup netrw_buf_hidden_fix  "TODO: grok this
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif

augroup end

let g:netrw_altfile = 1
autocmd bufwritepost .init.vim source %
autocmd VimEnter * call ToggleHiddenAll()
autocmd BufWinEnter * echo @%

"TODO: what is this?
" filetype plugin indent on
" syntax enable
" set fileencoding=utf-8

runtime macros/matchit.vim  "TODO: what is this?

colorscheme pink-moon

nmap <leader>gs :Gstatus<CR><C-w>30+
nmap <leader>fw :FixWhitespace<CR>
nmap <leader>no :nohlsearch<CR>
nmap <leader>B :set wrap linebreak tw=0<CR>
nmap <leader>BB :set nowrap linebreak tw=99<CR>
nmap <leader>t2 :set tabstop=2 shiftwidth=2<CR>
nmap <leader>t4 :set tabstop=4 shiftwidth=4<CR>
nmap <leader>os :Obsession<CR>
nmap <leader>od :Obsession!<CR>
nmap <leader>td :r!date<CR>
nmap <leader>pyc :!pycharm %<CR>
nmap <leader>= :bnext<CR>
nmap <leader>- :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bd :bp <BAR> bw #<CR>
nmap <leader>bw :%bwipeout<CR>
nmap <leader>js :%!python -m json.tool<CR>
vmap <leader>ht :!tidy -q -i --show-errors 0<CR>
nmap <leader>cd :lcd %:h<CR>
nmap <C-s> :Git rev-parse --abbrev-ref HEAD<CR>

nmap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

vnoremap < <gv
vnoremap > >gv

let g:python3_host_prog = '$HOME/.pyenv/versions/tools/bin/python'

let g:webdevicons_enable = 1
let g:webdevicons_enable_vimfiler = 1

let g:gitgutter_realtime=1
let g:gitgutter_set_sign_backgrounds=1

nnoremap <C-F> <cmd>Telescope find_files<cr>
nnoremap <C-P> <cmd>Telescope live_grep<cr>
nnoremap <C-B> <cmd>Telescope buffers<cr>
nnoremap <leader>df :lua require("plugins.telescope").search_dotfiles()<CR>
nnoremap <leader>nt :lua require("plugins.telescope").search_notes()<CR>

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-P>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-N>     compe#scroll({ 'delta': -4 })

