#! /bin/sh

ldconfig
cd /potree_env/tests/potree_entwine_greyhound/terrain && sh update_greyhound_html.sh $MY_HOST_IP $MY_HOST_PORT_GREYHOUND
/usr/bin/supervisord -n
