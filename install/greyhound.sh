#! /bin/sh

BUILDDIR="greyhound"

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
  rm -rf greyhound
fi

if [ ! "-d $BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/hobu/greyhound
  cd greyhound
  make
  cp config.template.js config.js

  echo "Install $BUILDDIR ..."
  make install
fi
