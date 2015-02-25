#!/bin/sh

sudo chsh -s /bin/zsh `whoami`

git submodule init
git submodule update

ln -sf ~/dotfiles/home/.vimrc ~/.vimrc
#ln -sF ~/dotfiles/colors ~/.vim/colors
#ln -sF ~/dotfiles/ftdetect ~/.vim/ftdetect
#ln -sF ~/dotfiles/indent ~/.vim/indent
#ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
#ln -sf ~/dotfiles/.wgetrc ~/.wgetrc
#ln -sf ~/dotfiles/Brewfile ~/Brewfile
ln -sf ~/dotfiles/home/.zshrc ~/.zshrc
