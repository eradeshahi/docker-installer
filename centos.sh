#!/bin/bash

read -p "Do you want to change nameserver? [ This should be done for Iranian users ] (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sed -i '/nameserver/d' /etc/resolv.conf
	echo "nameserver 185.51.200.2" >> /etc/resolv.conf
	echo "nameserver 178.22.122.100" >> /etc/resolv.conf
fi



sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
				  
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
	
sudo yum install docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

echo "Done..."
