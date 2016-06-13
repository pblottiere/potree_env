#! /bin/sh

cd $1
cd entwine/build && sudo make uninstall && cd -
rm -rf entwine
git clone https://github.com/connormanning/entwine
cd entwine
mkdir build && cd build
cmake ..
make
sudo make install
