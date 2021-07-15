
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


" hidding things
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        " set noshowmode
        set noruler
        set laststatus=1
        set noshowcmd
    else
        let s:hidden_all = 0
        " set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <C-s> :call ToggleHiddenAll()<CR>


" define line highlight color
" highlight the current line
" clear all the highlighted lines
highlight LineHighlight guifg=#6F98B3 guibg=#FDF8CE
nnoremap <leader>lh :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
nnoremap <leader>lc :call clearmatches()<CR>
