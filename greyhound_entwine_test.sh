#! /bin/sh

sudo cp greyhound.conf /var/greyhound/config.defaults.json
sudo mkdir -p /opt/data/autzen
sudo cp $1/greyhound/examples/data/autzen.las /opt/data/autzen

sudo entwine build -i /opt/data/autzen/autzen.las -o /opt/data/autzen

sudo /etc/init.d/supervisor start
sudo greyhound start

echo "In your web browser: http://localhost:8080/resource/autzen/info"
