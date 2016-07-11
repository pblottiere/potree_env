#! /bin/sh

BUILDDIR="PDAL"

if [ "$#" -ne 1 ]
then
  echo "I need a build directory..."
  exit 1
fi

cd $1

if [ "$REBUILD" = 'true' ] && [ -d "$BUILDDIR" ]
then
  echo "Uninstall $BUILDDIR ..."
  cd PDAL/build && make uninstall && cd -
  rm -rf PDAL
fi

if [ ! -d "$BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/PDAL/PDAL
  cd PDAL
  git checkout scoped-enums
  mkdir build && cd build
  cmake -DWITH_LAZPERF=ON ..
  make

  echo "Install $BUILDDIR ..."
  make install
fi
