#! /bin/sh

POTREE_CONVERTER_DIR=$1/PotreeConverter

if [ $REBUILD = 'true' ]
then
	sudo rm -rf /var/www/html/potree_env_dir/*
fi

if [ ! -d "/var/www/html/potree_env_dir" ]
then
	cd $POTREE_CONVERTER_DIR/test
	cp -r ../PotreeConverter/resources/page_template/ resources/

	export PATH=$PATH:../build/PotreeConverter/
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1/LAStools/LASzip/build/src/

	mkdir -p /var/www/html/potree_env_dir/

	sudo LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$1/LAStools/LASzip/build/src/ PotreeConverter "resources/ripple.pts" -o "/var/www/html/potree_env_dir/" --generate-page pageName -l 3 -s 0.5 --overwrite

	echo "Test: http://localhost/potree_env_dir/examples/pageName.html"
fi
