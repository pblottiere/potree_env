#!/bin/sh

BUILDDIR="LAStools"

if [ "$#" -ne 1 ]
then
  echo "I need a build directory..."
  exit 1
fi

cd $1

if [ "$REBUILD" = 'true' ] && [ -d "$BUILDDIR" ]
then
  echo "Uninstall $BUILDDIR ..."
  # no uninstall rules
  rm -rf "$BUILDDIR"
fi

if [ ! -d "$BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/pblottiere/LAStools
  cd LAStools
  git checkout fix
  make
  cd LASzip
  mkdir build
  cd build
  cmake ..
  make

  echo "Install $BUILDDIR ..."
  make install
fi
