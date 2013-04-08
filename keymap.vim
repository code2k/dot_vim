let mapleader=","
noremap \ ,

" use jk to exit insert mode
inoremap jk <Esc>

"Go to last edit location with ,.
nnoremap ,. '.

" CMD-Enter to enter new line, doesn't work in terminal
inoremap <D-Enter> <C-o>o
inoremap <D-S-Enter> <C-o>O

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" buffer next/previous
nnoremap <silent> <leader>< :bp<CR>
nnoremap <silent> <leader>> :bn<CR>

" ctrl-opt- left/right for tab movement
nnoremap <silent> <D-A-Left> :tabp<cr>
inoremap <silent> <D-A-Left> <esc>:tabp<cr>
nnoremap <silent> <D-A-Right> :tabn<cr>
inoremap <silent> <D-A-Right> <esc>:tabn<cr>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Adjust viewports to the same size
nnoremap <Leader>= <C-w>=

" Resize windows with arrow keys
nnoremap <D-S-Up> <C-w>+
nnoremap <D-S-Down> <C-w>-
nnoremap <D-S-Left> <C-w><
nnoremap <D-S-Right>  <C-w>>

" Easy close windows with Q
nnoremap <silent> Q <C-w>c

nnoremap <leader>w :StripTrailingWhitespaces<CR>
" reindent complete file without losing position
nnoremap <leader>f mqHmwgg=G`wzt`q

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" cd to the directory containing the file in the buffer
map <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
map <silent> <leader>md :!mkdir -p %:p:h<CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <C-k> [egv
vmap <C-j> ]egv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Fugitive
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
 " Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>

" Ack
if has("gui_macvim") && has("gui_running")
  " Command-Shift-F on OSX
  map <D-F> :Ack<space>
else
  " Define <C-F> to a dummy value to see if it would set <C-f> as well.
  map <C-F> :dummy

  if maparg("<C-f>") == ":dummy"
    " <leader>f on systems where <C-f> == <C-F>
    map <leader-f> :Ack<space>
  else
    " <C-F> if we can still map <C-f> to <S-Down>
    map <C-F> :Ack<space>
  endif

  map <C-f> <S-Down>
endif

" Zoom Window to Full Size
nnoremap <silent> <leader>z :ZoomWin<CR>

" GUndo
nnoremap ,u :GundoToggle<CR>

" ctrlp
let g:ctrlp_map = ''
nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>

nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>

nnoremap <C-l> :CtrlPMRUFiles<CR>
inoremap <C-l> <esc>:CtrlPMRUFiles<CR>

nnoremap <C-t> :CtrlPBufTag<CR>
inoremap <C-t> <esc>:CtrlPBufTag<CR>

" Surround
" <leader># Surround a word with #{ruby interpolation}
map <leader># ysiw#
vmap <leader># c#{<C-R>"}<ESC>

" <leader>" Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" <leader>' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>

" <leader>) or <leader>( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" <leader>[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" <leader>{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>

" Tabular
nnoremap <Leader>t= :Tabularize /=<CR>
vnoremap <Leader>t= :Tabularize /=<CR>
nnoremap <Leader>t: :Tabularize /:\zs<CR>
vnoremap <Leader>t: :Tabularize /:\zs<CR>
nnoremap <Leader>t, :Tabularize /,\zs<CR>
vnoremap <Leader>t, :Tabularize /,\zs<CR>
nnoremap <Leader>t> :Tabularize /=>\zs<CR>
vnoremap <Leader>t> :Tabularize /=>\zs<CR>
nnoremap <Leader>t- :Tabularize /-<CR>
vnoremap <Leader>t- :Tabularize /-<CR>
nnoremap <Leader>t" :Tabularize /"<CR>
vnoremap <Leader>t" :Tabularize /"<CR>

" Tagbar toggle
" o=outline
nnoremap <Leader>o :TagbarToggle<CR>

" neocomplcache activation
inoremap <expr> <c-space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
inoremap <expr><c-CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

