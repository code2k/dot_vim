" ---------------
" Airline
" ---------------
let g:airline_powerline_fonts=1

" ---------------
" bclose
" ---------------
cmap bd Bclose

" ---------------
" CtrlP
" ---------------
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                                                       \ --ignore .git
                                                       \ --ignore .svn
                                                       \ --ignore .hg
                                                       \ --ignore .DS_Store
                                                       \ -g ""'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("h")': ['<c-x>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>', '<c-cr>'],
      \ }

let g:ctrlp_map = ''
nnoremap <C-p> :CtrlP<CR>
inoremap <C-p> <esc>:CtrlP<CR>

nnoremap <C-b> :CtrlPBuffer<CR>
inoremap <C-b> <esc>:CtrlPBuffer<CR>

nnoremap <C-l> :CtrlPMRUFiles<CR>
inoremap <C-l> <esc>:CtrlPMRUFiles<CR>

nnoremap <C-t> :CtrlPBufTag<CR>
inoremap <C-t> <esc>:CtrlPBufTag<CR>

" ---------------
" Gundo
" ---------------
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1
" a little wider for wider screens
let g:gundo_width = 40
let g:gundo_prefer_python3 = 1

nnoremap ,u :GundoToggle<CR>

" ---------------
" syntastic
" ---------------
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_signs=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2

" ---------------
" neocomplcache
" ---------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_fuzzy_completion_start_length = 2
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_max_list = 20
"let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_enable_auto_delimiter = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"let g:neocomplcache_snippets_dir = $HOME . '/bundle/vim-snippets'

" ruby omni completion fix
" http://osdir.com/ml/editors.vim.vim-ruby.devel/2007-02/msg00008.html
if has("ruby")
  silent! ruby nil
endif
" Enable omni completion.
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.go = '\h\w*\%.'
let g:neocomplcache_omni_patterns.less = '^\s\+\w\+\|\w\+[):;]\?\s\+\w*\|[@!]'

" neocomplcache activation
inoremap <expr> <c-space> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"
inoremap <expr><c-CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

"---------------
" Surround
"---------------
map <leader># Surround a word with #{ruby interpolation}
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


"---------------
" delimitMate
"---------------
let delimitMate_expand_cr = 1

"---------------
" ACK
"---------------
let g:ackprg = 'ag --nogroup --nocolor --column'
