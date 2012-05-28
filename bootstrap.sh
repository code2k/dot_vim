#!/bin/bash

echo "Installing vundle"
git submodule init
git submodule update

echo "Initialize vim"
vim +BundleInstall +qall

echo "Symlink config"
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
