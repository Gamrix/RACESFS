#!/bin/bash
# read http://git-scm.com/book/en/v2/Getting-Started-Installing-Git for info

sudo yum install -y curl-devel expat-devel gettext-devel openssl-devel perl-devel zlib-devel
sudo yum install -y epel-release
sudo yum install -y asciidoc xmlto docbook2X

# yeah, we will also need gcc...
sudo yum install -y gcc

sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

mkdir git-src
cd git-src
wget https://github.com/git/git/archive/v2.4.10.tar.gz

tar -zxf v2.4.10.tar.gz
cd git-2.4.10
make configure
./configure --prefix=/usr
make all
# make doc info
sudo make install 
# sudo make install-doc install-html install-info
cd ../..
rm -rf git-src


