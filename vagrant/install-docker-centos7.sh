#!/bin/bash
# Created by Abraão Silva
# Install docker in centos

# Remove any old versions
yum remove docker docker-common docker-selinux docker-engine

# Install required packages
yum install -y yum-utils device-mapper-persistent-data lvm2

# Configure docker repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker-ce
yum install docker-ce -y

# Start Docker
systemctl start docker
systemctl enable docker

# Post Installation Steps
# Create Docker group
groupadd docker

# Add user to the docker group
# usermod -aG docker $USER

echo "Installation Complete -- Logout and Log back"

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Permssion +x execute binary
chmod +x /usr/local/bin/docker-compose

# Create link symbolic 
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Check Version docer-compose
echo "Installation Complete -- Logout and Log back"
docker-compose --version