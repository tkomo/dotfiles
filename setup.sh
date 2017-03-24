#!/bin/sh

chsh -s /bin/zsh `whoami`

curl -sL zplug.sh/installer | zsh

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./installer.sh
sh ./installer.sh ~/.vim/dein

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd home

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf ~/dotfiles/home/${f} ~/${f} && echo "${f}"
done
