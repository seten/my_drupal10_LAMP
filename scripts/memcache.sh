#!/bin/bash
sudo apt update && sudo apt upgrade -y
apt-get install -y memcached
systemctl enable memcached
systemctl start memcached
sed -i "s/-l 127.0.0.1/-l 0.0.0.0/" /etc/memcached.conf
systemctl restart memcached
