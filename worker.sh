#!/bin/bash

sudo su
echo "instalando docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "Participando do swarm"
docker swarm join --token $(cat /vagrant_data/worker_token) > /vagrant_data/worker_log 10.0.1.100:2377