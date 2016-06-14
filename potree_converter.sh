#! /bin/sh

LASZIP_DIR=$1/LAStools/LASzip/

cd $1

if [ $REBUILD = 'true' ]
then
  rm -rf PotreeConverter
fi

if [ ! -d "PotreeConverter" ]
then
	git clone https://github.com/potree/PotreeConverter
	cd PotreeConverter
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/$LASZIP_DIR/dll -DLASZIP_LIBRARY=$LASZIP_DIR/build/src/liblaszip.so ..
	make
	sudo make install
fi
