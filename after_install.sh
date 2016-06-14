#! /bin/sh

sudo echo "/usr/local/lib" > /etc/ld.so.conf
sudo ldconfig

sudo update-rc.d supervisor defaults
sudo greyhound auto
sudo greyhound start
