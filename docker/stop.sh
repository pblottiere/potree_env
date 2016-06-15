#! /bin/sh

docker stop $(docker ps -q --filter ancestor=potree )
docker ps
