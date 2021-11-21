
" autocmd VimEnter * call ToggleHiddenAll()
autocmd BufWinEnter * echo @%

nmap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

vnoremap < <gv
vnoremap > >gv

let g:python3_host_prog = '$HOME/.pyenv/versions/tools/bin/python'


" Plugins config

" webdevicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_vimfiler = 1

let g:gitgutter_realtime=1
let g:gitgutter_set_sign_backgrounds=1


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 60})
augroup END

