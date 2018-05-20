#!/bin/bash
VIM_DIR=~/.vim
if [ ! -d "$VIM_DIR" ]; then
    echo Please install vim first
    exit 1
fi

echo Install vim vundle...
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sf $(pwd)/.vimrc ~/.vimrc
vim +PluginInstall +qall
echo Install vim vundle done!

echo Applying gruvbox vim scheme...
git clone https://github.com/morhetz/gruvbox.git gruvbox
VIM_COLORS_DIR=~/.vim/colors
if [ ! -d "$VIM_COLORS_DIR" ]; then
    echo making directory: "$VIM_COLORS_DIR"
    mkdir $VIM_COLORS_DIR
fi
cp gruvbox/colors/*.vim $VIM_COLORS_DIR
rm -rf gruvbox/
echo Applying gruvbox done!


