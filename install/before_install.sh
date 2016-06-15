#! /bin/sh

# ldconfig
echo "/usr/local/lib" > /etc/ld.so.conf
ldconfig
