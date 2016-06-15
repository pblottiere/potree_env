#! /bin/sh

sudo docker rmi potree
sudo docker rmi -f $(sudo docker images -f "dangling=true" -q)
sudo docker ps -a|grep Exit|cut -d' ' -f 1|xargs sudo docker rm
