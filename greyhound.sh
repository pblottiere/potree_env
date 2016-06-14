#! /bin/sh

cd $1

git clone https://github.com/hobu/greyhound
cd greyhound
make
cp config.template.js config.js
sudo make install
sudo mkdir -p /opt/data
