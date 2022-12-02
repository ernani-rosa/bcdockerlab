#!/bin/bash

sudo su
echo "instalando docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "iniciando swarm"
docker swarm init --advertise-addr 10.0.1.100
docker swarm join-token worker -q > /vagrant_data/worker_token
docker swarm join-token manager -q > /vagrant_data/manager_token
echo "iniciado manager com a token '$(cat /vagrant_data/token)'"