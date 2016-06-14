#! /bin/sh

OS=$(lsb_release -si)

case $OS in
  Debian)
    # supervisor
    apt-get -y install supervisor

    # javascript
    apt-get -y install nodejs nodejs-dev npm
    update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    ;;

  Ubuntu)
    # build
    apt-get -y install git cmake build-essential

    # apache server
    apt-get -y install apache2

    # gcc/g++ 4.9
    #add-apt-repository ppa:ubuntu-toolchain-r/test
    #apt-get update
    #apt-get install gcc-4.9 g++-4.9
    #update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9

    # geotiff
    apt-get -y install libgeotiff-dev

    # javascript
    apt-get -y install nodejs nodejs-dev npm
    update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

    # boost
    apt-get -y install libboost-dev
    apt-get -y install libboost-system-dev libboost-thread-dev libboost-filesystem-dev \
	libboost-program-options-dev libboost-regex-dev

    # gdal
    apt-get -y install gdal-bin libgdal1-dev

    # supervisor
    apt-get -y install supervisor
    ;;
esac
