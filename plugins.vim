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
" bclose
" ---------------
cmap bd Bclose

" ---------------
" CtrlP
" ---------------
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\/log$\|\/output$\|\/build$\|\/node-modules$\|\.git$\|\.hg$\|\.svn$',
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

" delimitMate
let delimitMate_expand_cr = 1
