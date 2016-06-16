#!/bin/sh

if [ "$#" -ne 4 ]
then
  echo "Usage: sh las_to_pg.sh <HOST> <DB> <USER> <LASFILE>"
  exit 1
fi

HOST=$1
DATABASE=$2
USER=$3
LASFILE=$4

# init database
dropdb $DATABASE
createdb $DATABASE
psql -d $DATABASE -f schema.sql

# prepare pipeline
cp pipeline.json.tpl pipeline.json
sed -i "s/HOST/$HOST/g" pipeline.json
sed -i "s/DATABASE/$DATABASE/g" pipeline.json
sed -i "s/USER/$USER/g" pipeline.json
sed -i "s|LASFILE|$LASFILE|g" pipeline.json

# pdal pipeline
pdal pipeline -i pipeline.json
