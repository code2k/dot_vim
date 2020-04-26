# Just another vim configuration

## Installation

1. `git clone http://github.com/code2k/dot_vim.git .vim` into your home
   folder.
2. `cd .vim`
3. `./bootstap.sh`
4. Vim plugins will be installed on the first start.

If you need to modify this configuration just add a `.vimrc.local` and/or
`.gvimrc.local` in your home directory.

## Plugins

- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-polyglot](https://github.com/sheerun/vim-polyglot)
- [vim-solarized8](https://github.com/lifepillar/vim-solarized8)
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [coc.nvim](https://github.com/neoclide/coc.nvim)
- [vim-startify](https://github.com/mhinz/vim-startify)
- [vim-textobj-user](https://github.com/kana/vim-textobj-user)
- [vim-textobj-indent](https://github.com/kana/vim-textobj-indent)
- [vim-textobj-line](https://github.com/kana/vim-textobj-line)
- [vim-textobj-entire](https://github.com/kana/vim-textobj-entire)
- [vim-expand-region](https://github.com/terryma/vim-expand-region)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-indexed-search](https://github.com/henrik/vim-indexed-search)
- [vim-snippets](https://github.com/honza/vim-snippets)
- [emmet-vim](https://github.com/mattn/emmet-vim)
- [ack.vim](https://github.com/mileszs/ack.vim)
- [gundo.vim](https://github.com/sjl/gundo.vim)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-eunuch](https://github.com/tpope/vim-eunuch)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
- [vim-vinegar](https://github.com/tpope/vim-vinegar)
- [ZoomWin](https://github.com/vim-scripts/ZoomWin)

## coc.nvim

Initially there are only a few essential coc.nvim extensions installed.

For a better more VSCode like experience, install the following extensions:

```
:CocInstall coc-css coc-eslint coc-html coc-json coc-prettier coc-tailwindcss coc-tsserver coc-tslint-plugin coc-yaml
```

## Credits

This vim configuration is a mix from these excellent configurations:

- [The Vim Configuration of Champions](https://github.com/mutewinter/dot_vim)
- [Janus](https://github.com/carlhuda/janus)
- [YADR](https://github.com/skwp/dotfiles)
