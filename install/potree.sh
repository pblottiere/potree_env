#! /bin/sh

BUILDDIR="potree"

if [ "$#" -ne 1 ]
then
  echo "I need a build directory..."
  exit 1
fi

cd $1

if [ "$REBUILD" = 'true' ] && [ -d "$BUILDDIR" ]
then
  echo "Uninstall $BUILDDIR ..."

  rm -rf potree
  rm -rf "/var/www/html/potree/"
fi

if [ ! "-d $BUILDDIR" ]
then
  echo "Build $BUILDDIR in $1 ..."

  git clone https://github.com/Maartenvm/potree
  cd potree
  git checkout develop
  mkdir -p /var/www/html/potree
  cp -r * /var/www/html/potree
fi
