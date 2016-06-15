#! /bin/sh

update-rc.d supervisor defaults
service supervisord start

greyhound auto
