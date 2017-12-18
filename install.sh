#!/bin/sh

# Clone vimrc-buftab
git clone https://github.com/orkunkaraduman/vimrc-buftab.git  ~/.vim/vimrc-buftab

# Clone VundleVim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# SymLink vimrc
ln -s -f ~/.vim/vimrc-buftab/vimrc ~/.vimrc

# Install plugins
vim +PluginInstall +qall
