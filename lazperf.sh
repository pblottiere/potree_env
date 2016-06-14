#! /bin/sh

cd $1

if [ $REBUILD = 'true' ]
then
	cd laz-perf/build && sudo make uninstall && cd -
	rm -rf laz-perf
fi

if [ ! -d "laz-perf" ]
then
	git clone https://github.com/hobu/laz-perf
	cd laz-perf
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
fi
