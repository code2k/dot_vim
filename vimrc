" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/vitality.vim'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'tomtom/tlib_vim.git'
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-eunuch'

Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'henrik/vim-indexed-search'
Bundle 'milkypostman/vim-togglelist'
Bundle 'majutsushi/tagbar'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'rwfitzge/vim-bclose'
Bundle 'tpope/vim-repeat'
Bundle 'christoomey/vim-space'
Bundle 'tpope/vim-unimpaired'
Bundle 'edsono/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic.git'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/MatchTag'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-snippets-complete'

Bundle 'hallison/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rvm'
Bundle 'tpope/vim-rake'
Bundle 'jnwhiteh/vim-golang'
Bundle 'beatlog/vim-gocode'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'mmalecki/vim-node.js'
Bundle 'leshill/vim-json'
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'itspriddle/vim-jquery'
Bundle 'msanders/cocoa.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-indent'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=55
  set columns=130

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

  " Hide Toolbar in MacVim
  set guioptions=egmt

  set lines=60
  set columns=140

  " Use option (alt) as meta key.
  "set macmeta

  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

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
set background=light
colorscheme solarized
let g:solarized_contrast="high"
let g:solarized_visibility="normal"

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
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
set list listchars=tab:\ \ ,trail:·

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc

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

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/vim/backups*
set wildignore+=*/DS_Store*
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=4         "Start scrolling when we're 4 lines away from margins
set sidescrolloff=15
set sidescroll=1

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! SudoWrite

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

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " Fix trailing whitespace in my most used programming langauges
  autocmd BufWritePre *.c,*.cpp,*.h,*.m,*.mm,*.java,*.go,*.py,*.js,*.rb: silent! :StripTrailingWhitespaces

  " If the only cmdline argument is a directory, change into it at start
  autocmd VimEnter * if argc() == 1 && isdirectory(argv(0)) | exe "silent! cd ".argv(0) | endif

  " if rvm configuration exists, change used ruby and gemset using Rvm
  autocmd VimEnter * if filereadable(expand("./.rvmrc")) | Rvm | endif
endif

exe 'source ~/.vim/plugins.vim'
exe 'source ~/.vim/keymap.vim'

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

