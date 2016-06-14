#! /bin/sh

sudo echo "/usr/local/lib" > /etc/ld.so.conf
sudo ldconfig

sudo update-rc.d supervisord defaults
sudo update-rc.d greyhound defaults
