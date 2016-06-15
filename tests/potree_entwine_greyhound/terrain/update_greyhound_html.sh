#!/bin/sh

apt-get install sed

KEY_HOST_IP="HOST_IP"
KEY_HOST_PORT_GREYHOUND="HOST_PORT_GREYHOUND"
CONF_HOST_IP=$1
CONF_HOST_PORT_GREYHOUND=$2
HTML=/var/www/html/potree/examples/greyhound_terrain.html

cp greyhound_terrain.html.tpl $HTML
sed -i 's/$KEY_HOST_IP/$CONF_HOST_IP/g' $HTML
sed -i 's/$KEY_HOST_PORT_GREYHOUND/$CONF_HOST_PORT_GREYHOUND/g' $HTML
