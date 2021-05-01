#!/usr/bin/env bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh 
rm -f get-docker.sh
usermod -aG docker vagrant
curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
