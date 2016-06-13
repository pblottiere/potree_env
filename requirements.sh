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
    # apache server
    sudo apt-get install apache2

    # gcc/g++ 4.9
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt-get update
    sudo apt-get install gcc-4.9 g++-4.9
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9

    # javascript
    sudo apt-get install nodejs nodejs-dev npm
    sudo update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10
    ;;
esac
