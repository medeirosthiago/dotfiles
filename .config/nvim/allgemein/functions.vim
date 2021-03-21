
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
" nnoremap <C-n> :call NumberToggle()<CR>

" hidding things
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        " set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        " set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
