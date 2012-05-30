#!/bin/bash

echo "Installing vundle"
git clone https://github.com/gmarik/vundle.git bundle/vundle

echo "Symlink vim config"
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc

echo "Initialize vim"
vim +BundleInstall +qall
