" ---------------
" Powerline
" ---------------
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('gui_macvim')
  let g:Powerline_symbols = 'fancy'
endif
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" ---------------
" NERDTree
" ---------------
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Open a NERDTree automatically when vim starts up without any files ...
autocmd vimenter * if !argc() | NERDTree | endif

" ---------------
" bclose
" ---------------
cmap bd Bclose

" ---------------
" CtrlP
" ---------------
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\/log$\|\/output$\|\/build$\|\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.o$\|\.class$\|\.exe$\|\.so$\|\.dll$',
      \ }
 let g:ctrlp_prompt_mappings = {
       \ 'AcceptSelection("h")': ['<c-x>', '<c-s>'],
       \ 'AcceptSelection("t")': ['<c-t>', '<c-cr>'],
       \ }

" ---------------
" Gundo
" ---------------
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1
" a little wider for wider screens
let g:gundo_width = 40

" ---------------
" syntastic
" ---------------
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_loc_list=2

" neocomplcache
" A beter autocomplete system!

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_disable_auto_complete = 1
set completeopt+=longest

" Map standard Ctrl-N completion to Cmd-Space
" inoremap <<D-Space> <C-n>

" This makes sure we use neocomplcache completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out
let g:neocomplcache_force_overwrite_completefunc = 1

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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

"---------------
"Tagbar
let g:tagbar_width=40

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

