#!/bin/sh

chsh -s /bin/zsh `whoami`

curl -sL zplug.sh/installer | zsh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
sh ./installer.sh ~/.vim/dein.vim

cd home

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf ~/dotfiles/home/${f} ~/${f} && echo "${f}"
done
