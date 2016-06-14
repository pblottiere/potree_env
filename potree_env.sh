#! /bin/sh

POTREE_ENV_BUILD_DIR=$PWD/../potree_env_build_dir
export REBUILD=false

mkdir -p $POTREE_ENV_BUILD_DIR
sh lastools.sh $POTREE_ENV_BUILD_DIR
sh potree_converter.sh $POTREE_ENV_BUILD_DIR
sh potree_converter_test.sh $POTREE_ENV_BUILD_DIR #root access to write in /var/www/html
sh lazperf.sh $POTREE_ENV_BUILD_DIR
sh pdal.sh $POTREE_ENV_BUILD_DIR
#sh entwine.sh $POTREE_ENV_BUILD_DIR
#sh greyhound.sh $POTREE_ENV_BUILD_DIR
