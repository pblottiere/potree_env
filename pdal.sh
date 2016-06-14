#! /bin/sh

if [ "$#" -ne 1 ]
then
        echo "I need a build directory..."
        exit 1
fi

cd $1

if [ $REBUILD = 'true' ]
then
	cd PDAL/build 
	sudo make uninstall 
	cd -
	rm -rf PDAL
fi

cd $1

if [ ! -d "PDAL" ]
then
	git clone https://github.com/PDAL/PDAL
	cd PDAL
	mkdir build && cd build
	cmake -DWITH_LAZPERF=ON ..
	make
	sudo make install
fi
