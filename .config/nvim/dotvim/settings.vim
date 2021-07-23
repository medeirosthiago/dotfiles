
autocmd VimEnter * call ToggleHiddenAll()
autocmd BufWinEnter * echo @%

nmap <leader>L :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

vnoremap < <gv
vnoremap > >gv

let g:python3_host_prog = '$HOME/.pyenv/versions/tools/bin/python'


" Simple statusline
function! StatuslineGit()
  let l:branchname = FugitiveHead()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#Comment#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%M
set statusline+=%=
set statusline+=\ %Y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 


" Plugins config
" let g:vimwiki_list = [{}]

" vimwiki

" webdevicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_vimfiler = 1

let g:gitgutter_realtime=1
let g:gitgutter_set_sign_backgrounds=1
