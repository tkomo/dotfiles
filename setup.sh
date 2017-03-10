#!/bin/sh

chsh -s /bin/zsh `whoami`

git submodule init
git submodule update
curl -sL zplug.sh/installer | zsh

cd home

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf ~/dotfiles/home/${f} ~/${f} && echo "${f}"
done
