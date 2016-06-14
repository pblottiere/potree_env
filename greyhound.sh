#! /bin/sh

if [ "$#" -ne 1 ]
then
        echo "I need a build directory..."
        exit 1
fi

cd $1

if [ $REBUILD = 'true' ]
then
  if [ -d "greyhound" ]
  then
    # no uninstall rules
    rm -rf greyhound
  fi
fi

if [ ! -d "greyhound" ]
then
	git clone https://github.com/hobu/greyhound
	cd greyhound
	make
	cp config.template.js config.js
	sudo make install
fi
