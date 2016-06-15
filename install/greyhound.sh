#! /bin/sh

BUILDDIR="greyhound"
MYDIR=$(dirname "$(readlink -f "$0")")

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

if [ ! -d "$BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/hobu/greyhound
  cd greyhound
  make

  echo "Install $BUILDDIR ..."
  make install

  pwd
  ls
  cd $MYDIR
  echo $MYDIR
  pwd
  ls
  cp greyhound.conf /var/greyhound/config.json
fi
