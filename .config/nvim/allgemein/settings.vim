syntax enable
let mapleader = " "
set termguicolors
set clipboard+=unnamedplus
set nocompatible
set mouse=a
set scrolloff=8
set ignorecase
set smartcase
" set expandtab  " Don't need this
" set shiftround  " Don't need this
set number
set relativenumber
set updatetime=100
set linebreak
set showbreak=↪
" set nowrap          " don't automatically wrap on load
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

autocmd VimEnter * call ToggleHiddenAll()
autocmd BufWinEnter * echo @%

"TODO: what is this?
" filetype plugin indent on
" set fileencoding=utf-8

nmap <leader>gs :Gstatus<CR><C-w>30+
nmap <leader>fw :FixWhitespace<CR>
nmap <leader>no :nohlsearch<CR>
nmap <leader>B :set wrap linebreak tw=0<CR>
nmap <leader>BB :set nowrap linebreak tw=99<CR>
nmap <leader>os :Obsession<CR>
nmap <leader>od :Obsession!<CR>
nmap <leader>td :r!date<CR>
nmap <leader>pyc :!pycharm %<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bd :bp <BAR> bw #<CR>
nmap <leader>bw :%bwipeout<CR>
nmap <leader>js :%!python -m json.tool<CR>
vmap <leader>ht :!tidy -q -i --show-errors 0<CR>
nmap <leader>cd :lcd %:h<CR>

nmap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

vnoremap < <gv
vnoremap > >gv

let g:python3_host_prog = '$HOME/.pyenv/versions/tools/bin/python'


" Simple statusline TODO:


" Plugins config
" let g:vimwiki_list = [{}]

" vimwiki

" webdevicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_vimfiler = 1

let g:gitgutter_realtime=1
let g:gitgutter_set_sign_backgrounds=1

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>lf <cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>
nnoremap <leader>le <cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>
nnoremap <leader>gb <cmd>lua require("telescope.builtin").git_branches()<cr>
nnoremap <leader>gc <cmd>lua require("telescope.builtin").git_bcommits()<cr>
nnoremap <leader>gp <cmd>lua require('telescope').extensions.gh.pull_request()<cr>

nnoremap <leader>df <cmd>lua require("plugins.telescope").search_dotfiles()<cr>
nnoremap <leader>nt <cmd>lua require("plugins.telescope").search_notes()<cr>

nnoremap <C-B> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy='ascending', layout_config={prompt_position='top'}})<cr>
nnoremap <C-h> <cmd>lua require('telescope.builtin').help_tags()<cr>

" completion
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
