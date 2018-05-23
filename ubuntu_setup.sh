#!/bin/bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo add-apt-repository ppa:ondrej/php

sudo apt-get update
sudo apt-get install -y git curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev checkinstall cvs subversion mercurial postgresql-common postgresql postgresql-client postgresql-plperl10 postgresql-plpython10 postgresql-pltcl10 libpq-dev mariadb-client mariadb-server mariadb-common
sudo apt-get install -y software-properties-common php7.2 php7.2-dev php7.2-fpm php7.2-cli php7.2-xml php7.2-zip php7.2-mysql php7.2-gd php7.2-imagick php7.2-recode php7.2-tidy php7.2-xmlrpc php-pear gcc make autoconf libc-dev pkg-config libmcrypt-dev bzip2

cd ~

sudo timedatectl set-timezone America/Toronto

git config --global color.ui true
git config --global user.name "Brian Foster"
git config --global user.email "cola.katz@gmail.com"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.5.1
rbenv global 2.5.1
gem install bundler
rbenv rehash

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs yarn
gem install rails -v 5.2.0
rbenv rehash

wget https://bitbucket.org/zhb/iredmail/downloads/iRedMail-0.9.8.tar.bz2
tar xvf iRedMail-0.9.8.tar.bz2
cd iRedMail-0.9.8/
chmod +x iRedMail.sh
