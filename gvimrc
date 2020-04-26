set guioptions-=m " Turn off menubar
set guioptions-=T " Turn off toolbar
set guioptions-=r " Turn off right-hand scrollbar
set guioptions-=R " Turn off right-hand scrollbar when split
set guioptions-=L " Turn off left-hand scrollbar
set guioptions-=l " Turn off left-hand=scrollbar when split
set guicursor+=a:blinkon0 " Turn off blinking cursor

if has("gui_running")
  if has("win32") || has('win64')
    set guifont=Consolas:h13
  elseif has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h13
  else
    " assume Linux
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  endif
endif

if has("autocmd")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

set linespace=1
set lines=56
set columns=140

set mousemodel=popup
