#!/bin/zsh

# yum
sudo yum -y install gcc openssl-devel

# chsh
sudo chsh -s /bin/zsh

# rbenv, ruby, rails
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
source ~/.zshrc
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

rbenv install -v 2.1.2
rbenv rehash
rbenv global 2.1.2
rbenv rehash

# chef-solo
# curl -L http://www.opscode.com/chef/install.sh | sudo bash

# knife-solo
# gem install knife-solo

