#! /bin/sh

cd $1
rm -rf LAStools
git clone https://github.com/pblottiere/LAStools
cd LAStools
git checkout fix
make
cd LASzip
mkdir build
cd build
cmake ..
make
