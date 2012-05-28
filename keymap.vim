let mapleader=","

"Go to last edit location with ,.
nnoremap ,. '.

" ctrl-opt- left/right for tab movement
map <silent> <D-A-Left> :tabp<cr>
map <silent> <D-A-Right> :tabn<cr>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-S-Up> <C-w>+
nnoremap <D-S-Down> <C-w>-
nnoremap <D-S-Left> <C-w><
nnoremap <D-S-Right>  <C-w>>

" NERDTree
noremap <leader>nn :NERDTreeMirrorToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Easy close windows with Q
nnoremap <silent> Q <C-w>c

nmap ,w :StripTrailingWhitespaces<CR>

" ,q to toggle quickfix window (where you have stuff like GitGrep)
nmap <silent> ,q :cw<CR>

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
