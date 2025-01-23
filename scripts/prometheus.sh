#!/bin/bash

# Script to install Grafana locally

# Update system repositories
sudo apt update
sudo apt upgrade -y

# Add Grafana repository
sudo apt install -y software-properties-common
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Install Grafana
sudo apt update
sudo apt install grafana -y

# Enable and start Grafana service
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# Verify installation
sudo systemctl status grafana-server

echo "Grafana installation completed! Access it at http://localhost:3000"
