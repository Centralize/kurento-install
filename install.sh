#!/usr/bin/env bash

echo "Install GNUpg"
sudo apt-get update ; sudo apt-get install --no-install-recommends gnupg

echo "Import Key"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

echo "Get Ubuntu Version"
source /etc/lsb-release

echo "Add the repository to Apt"
sudo tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
# Kurento Media Server - Release packages
deb [arch=amd64] http://ubuntu.openvidu.io/6.16.0 $DISTRIB_CODENAME kms6
EOF

echo "Install Kurento"
sudo apt-get update ; sudo apt-get install --no-install-recommends kurento-media-server

echo "Restart Kurento Media Server"
sudo service kurento-media-server stop
sudo service kurento-media-server start
