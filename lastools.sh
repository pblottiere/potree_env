#! /bin/sh

if [ "$#" -ne 1 ]
then
	echo "I need a build directory..."
	exit 1
fi

cd $1

if [ $REBUILD = 'true' ]
then
  if [ -d "LAStools" ]
  then
    # no uninstall rules
    rm -rf LAStools
  fi
fi

if [ ! -d "LAStools" ]
then 
	git clone https://github.com/pblottiere/LAStools
	cd LAStools
	git checkout fix
	make
	cd LASzip
	mkdir build
	cd build
	cmake ..
	make
	sudo make install
fi
