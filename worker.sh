#!/bin/bash

echo "Instalando docker..."
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "Entrando no swarm"
sudo docker swarm join --token $(cat /vagrant_data/worker_token) 10.0.1.100:2377