#!/bin/bash

# Script to install Grafana locally

# Update system repositories
apt update
apt upgrade -y

# Add Grafana repository
apt install -y apt-transport-https 
apt install -y software-properties-common
apt install -y wget
wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list

# Install Grafana
apt update
apt install grafana -y

# Enable and start Grafana service
systemctl enable grafana-server
systemctl start grafana-server

# Verify installation
systemctl status grafana-server
echo "Grafana installation completed! Access it at http://localhost:3000"
