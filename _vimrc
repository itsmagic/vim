set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set encoding=utf-8

"select color scheme
color visualstudio

"set font
set guifont=Consolas:h9

"set line numbers
set number

" highlight column
set colorcolumn=110

" always show the statusline
set laststatus=2   

" swithc on syntax highlight
syntax on

" incremental searching
set incsearch

" highlight searching results
set hlsearch

" text encoding
set termencoding=utf8

" show cursor position all time
set ruler

" show not finished command in status bar
set showcmd

" do not wrap strings
set nowrap

" tab options 
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set shiftwidth=4
" size of an "indent"
set softtabstop=4
" size of a hard tabstop
set tabstop=4
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab


" cursor line options
set cursorline
highlight CursorLine guibg=lightblue ctermbg=lightgray
highlight CursorLine term=none cterm=none
" length of history
set history=200
" additional info in status bar
set wildmenu



nnoremap * *N
nnoremap <C-F8> :nohlsearch<CR>



" CTRL-Tab is Next tab
nnoremap <C-Tab> :tabnext<CR>

" CTRL-Shift-Tab is Previous tab
nnoremap <C-S-Tab> :tabprevious<CR>

" use Alt-Left and Alt-Right to move current tab to left or right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" CTRL-F4 is :tabclose
nnoremap <C-F4> :tabclose<CR>












set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

