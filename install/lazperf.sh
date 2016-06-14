#! /bin/sh

BUILDDIR="laz-perf"

if [ "$#" -ne 1 ]
then
  echo "I need a build directory..."
  exit 1
fi

cd $1

if [ "$REBUILD" = 'true' ] && [ -d "$BUILDDIR" ]
then
  echo "Uninstall $BUILDDIR ..."
  cd laz-perf/build && sudo make uninstall && cd -
  rm -rf laz-perf
fi

if [ ! -d "$BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/hobu/laz-perf
  cd laz-perf
  mkdir build
  cd build
  cmake ..
  make

  echo "Install $BUILDDIR ..."
  sudo make install
fi
