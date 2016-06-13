#! /bin/sh

cd $1
cd PDAL/build && sudo make uninstall && cd -
rm -rf PDAL
git clone https://github.com/PDAL/PDAL
cd PDAL
mkdir build && cd build
cmake -DWITH_LAZPERF=ON ..
make
sudo make install
