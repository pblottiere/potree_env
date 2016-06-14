#! /bin/sh

if [ "$#" -ne 1 ]
then
        echo "I need a build directory..."
        exit 1
fi

cd $1

if [ $REBUILD = 'true' ]
then
  if [ -d "entwine" ]
  then
	cd entwine/build && sudo make uninstall && cd -
	rm -rf entwine
  fi
fi

if [ ! -d "entwine" ]
then 
	git clone https://github.com/connormanning/entwine
	cd entwine
	mkdir build && cd build
	cmake ..
	make
	sudo make install
fi
