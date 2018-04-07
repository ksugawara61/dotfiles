#!/bin/sh
# rbenv インストール用スクリプト

# インストールに必要なミドルウェアをインストール
sudo yum install -y git gcc gcc-c++ openssl-devel readline-devel

# rbenvのインストール
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.bash_profile
