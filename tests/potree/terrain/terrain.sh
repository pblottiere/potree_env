#! /bin/sh

DATADIR=/opt/data/terrain

mkdir -p $DATADIR/las
cd $DATADIR/las
wget http://www.liblas.org/samples/LAS12_Sample_withRGB_Quick_Terrain_Modeler_fixed.las

cp terrain.html /var/www/html/potree/
