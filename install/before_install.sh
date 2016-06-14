#! /bin/sh

# ldconfig
sudo echo "/usr/local/lib" > /etc/ld.so.conf
sudo ldconfig
