#!/bin/bash
set -x
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common wget
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt-get update
sudo apt-get install -y anydesk

#Imagenes
sudo docker pull percona:5.7
sudo docker pull alemeji/graphics:latest
sudo docker pull alemeji/db-backup:1.1
# sudo docker pull alemeji/db-backup:2.0
sudo docker pull rabbitmq:3.6.1
sudo docker pull phpmyadmin/phpmyadmin:4.8
sudo docker pull portainer/portainer

#Creacion del directorio de trabajo
WORK_DIR=/proyectos/virtualenv/graphics/
sudo mkdir -p $WORK_DIR
sudo cp crontab.txt backup_db initdb.yml prod.yml $WORK_DIR
