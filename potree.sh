#! /bin/sh

if [ "$#" -ne 1 ]
then
        echo "I need a build directory..."
        exit 1
fi

cd $1

if [ $REBUILD = 'true' ]
then
  if [ -d "potree" ]
  then
    rm -rf potree
  fi

  if [ -d "/var/www/html/potree" ]
  then
    rm -rf "/var/www/html/potree/"
  fi
fi

if [ ! -d "potree" ]
then 
	git clone https://github.com/Maartenvm/potree
	git checkout develop
	sudo mkdir -p /var/www/html/potree
	sudo cp -r * /var/www/html/potree
fi
