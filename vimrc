"" Plugins

"" Installation with VimPlug
if has("win32")
  call plug#begin('~/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

let g:plug_window="enew"

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplcache'
Plug 'godlygeek/tabular'
Plug 'henrik/vim-indexed-search'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'spiiph/vim-space'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ZoomWin'

call plug#end()

syntax on
filetype plugin indent on

" ---------------
" no swap/backup
" ---------------
set noswapfile
set nobackup
set nowb

" ---------------
" Color
" ---------------
set t_Co=256
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif
colorscheme solarized
let g:solarized_contrast="high"
let g:solarized_visibility="normal"

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set nu             " Line numbers on
set wrap           " Line wrapping on
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set gcr=a:blinkon0              "Disable cursor blink
set encoding=utf-8
set cursorline
let g:netrw_liststyle = 3 " tree

function! <SID>setupColors()
  hi! link txtBold Identifier
  hi! link zshVariableDef Identifier
  hi! link zshFunction Function
  hi! link rubyControl Statement
  hi! link rspecGroupMethods rubyControl
  hi! link rspecMocks Identifier
  hi! link rspecKeywords Identifier
  hi! link rubyLocalVariableOrMethod Normal
  hi! link rubyStringDelimiter Constant
  hi! link rubyString Constant
  hi! link rubyAccess Todo
  hi! link rubySymbol Identifier
  hi! link rubyPseudoVariable Type
  hi! link rubyRailsARAssociationMethod Title
  hi! link rubyRailsARValidationMethod Title
  hi! link rubyRailsMethod Title
  hi! link MatchParen DiffText
  hi! link WildMenu DiffText
endfunction
autocmd VimEnter * call <SID>setupColors()

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
"set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=500     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
set splitbelow
set splitright

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2  " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set visualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ================ Completion =======================

set wildmode=longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc
set wildignore+=*/vim/backups*
set wildignore+=*/DS_Store*
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 4 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ----------------------------------------
" Remove Trailing Whitespaces
" ----------------------------------------
" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=80
  set nolist
  setl spell
  if exists('+colorcolumn')
    setl colorcolumn=80 " Color the 80th column differently
  endif
endfunction

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.txt,*.md,*.markdown,*.mdown,*.mkd,*.mkdn,*.txt setf markdown | call s:setupWrapping()

  " Enable wrapping for asciidoc(tor) files
  au BufRead,BufNewFile *.adoc call s:setupWrapping()

  " GoLag settings
  autocmd FileType go setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2 nolist

  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Fix trailing whitespace in my most used programming langauges
  autocmd BufWritePre *.c,*.cpp,*.h,*.m,*.mm,*.swift,*.java,*.go,*.py,*.js,*.rb,*.scss,*.less: silent! :StripTrailingWhitespaces

  " If the only cmdline argument is a directory, change into it at start
  autocmd VimEnter * if argc() == 1 && isdirectory(argv(0)) | exe "silent! cd ".argv(0)."|Explore" | endif

endif

" ----------------------------------------
" General Key mappings
" ----------------------------------------

let mapleader=","
noremap \ ,

" use jk to exit insert mode
inoremap jk <Esc>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" buffer next/previous
nnoremap <silent> <leader>< :bp<CR>
nnoremap <silent> <leader>> :bn<CR>

" meta-opt- left/right for tab movement
nnoremap <silent> <D-A-Left> gT
inoremap <silent> <D-A-Left> <esc>gT
nnoremap <silent> <D-A-Right> gt
inoremap <silent> <D-A-Right> <esc>gt

" meta j/k for tab movement
nnoremap <silent> <D-j> gT
inoremap <silent> <D-j> <esc>gT
nnoremap <silent> <D-k> gt
inoremap <silent> <D-k> <esc>gt

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Easy close windows with Q
nnoremap <silent> Q <C-w>c

nnoremap <leader>w :StripTrailingWhitespaces<CR>
" reindent complete file without losing position
nnoremap <leader>f mqHmwgg=G`wzt`q

"Clear current search highlight by double tapping //
nnoremap <silent> // :nohlsearch<CR>

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

" Zoom Window to Full Size
nnoremap <silent> <leader>z :ZoomWin<CR>

"---------------
"  External plugin config
"---------------

exe 'source ~/.vim/plugins.vim'

"---------------
"  Local config
"---------------

" Use local vimrc if available
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Use local gvimrc if available and gui is running
if has('gui_running')
  if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
  endif
endif

