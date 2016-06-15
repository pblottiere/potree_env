#! /bin/sh

ldconfig
/etc/init.d/supervisor start
greyhound start
cat /var/log/supervisor/greyhound.log
