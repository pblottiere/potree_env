#! /bin/sh

DATADIR=/opt/data/terrain

# requirements
apt-get install wget

# get data
mkdir -p $DATADIR/las
cd $DATADIR/las
wget http://www.liblas.org/samples/LAS12_Sample_withRGB_Quick_Terrain_Modeler_fixed.las

# entwine build
entwine build -i $DATADIR/las/LAS12_Sample_withRGB_Quick_Terrain_Modeler_fixed.las -o $DATADIR

# add file in potree
cd /potree_env/tests/potree_entwine_greyhound/terrain
cp greyhound_terrain.html /var/www/html/potree/examples
