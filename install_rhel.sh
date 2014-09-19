#!/bin/bash

# yum
yum -y install zsh

# get dotfiles
git submodule init
git submodule update

# chsh
chsh -s /bin/zsh

# rbenv, ruby, rails
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
exec $SHELL -l
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install -v 2.1.2
rbenv rehash
