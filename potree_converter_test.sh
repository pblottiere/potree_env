#! /bin/sh

POTREE_CONVERTER_DIR=$1/PotreeConverter

cd $POTREE_CONVERTER_DIR/PotreeConverter

export PATH=$PATH:../build/PotreeConverter/
mkdir -p /var/www/html/potree_env_dir/
rm -rf /var/www/html/potree_env_dir/*
PotreeConverter "${testPath}/resources/ripple.pts" -o "/var/www/html/potree_env_dir/" --generate-page pageName -l 3 -s 0.5 --overwrite
