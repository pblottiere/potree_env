#! /bin/sh

BUILDDIR="entwine"

if [ "$#" -ne 1 ]
then
  echo "I need a build directory..."
  exit 1
fi

cd $1

if [ "$REBUILD" = 'true' ] && [ -d "$BUILDDIR" ]
then
  echo "Uninstall $BUILDDIR ..."
  cd entwine/build && make uninstall && cd -
  rm -rf entwine
fi

if [ ! -d "$BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/connormanning/entwine
  cd entwine
  mkdir build && cd build
  cmake ..
  make

  echo "Install $BUILDDIR ..."
  make install
fi
