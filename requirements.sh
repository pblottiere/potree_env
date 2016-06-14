#! /bin/sh

OS=$(lsb_release -si)

case $OS in
  Debian)
    # supervisor
    sudo apt-get install supervisor

    # javascript
    sudo apt-get install nodejs nodejs-dev npm
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    ;;

  Ubuntu)
    # build
    sudo apt-get install git cmake build-essential

    # apache server
    sudo apt-get install apache2

    # gcc/g++ 4.9
    #sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    #sudo apt-get update
    #sudo apt-get install gcc-4.9 g++-4.9
    #sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9

    # geotiff
    sudo apt-get install libgeotiff-dev

    # javascript
    sudo apt-get install nodejs nodejs-dev npm
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

    # boost
    sudo apt-get install libboost-dev
    sudo apt-get install libboost-system-dev libboost-thread-dev libboost-filesystem-dev \
	libboost-program-options-dev libboost-regex-dev

    # gdal
    sudo apt-get install gdal-bin libgdal1-dev

    # supervisor
    sudo apt-get install supervisor
    ;;
esac
