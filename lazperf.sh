#! /bin/sh

cd $1

cd laz-perf/build && sudo make uninstall && cd -
rm -rf laz-perf
git clone https://github.com/hobu/laz-perf
cd laz-perf
mkdir build
cd build
cmake ..
make
sudo make install
