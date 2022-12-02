#!/bin/bash

echo "instalando docker..."
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "iniciando swarm"
sudo docker swarm init --advertise-addr 10.0.1.100
sudo docker swarm join-token worker -q > /vagrant_data/worker_token
sudo docker swarm join-token manager -q > /vagrant_data/manager_token
echo "Swarm iniciado com sucesso!"