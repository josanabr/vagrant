#!/usr/bin/env bash
sudo echo "deb http://research.cs.wisc.edu/htcondor/ubuntu/stable/ trusty contrib" >> /etc/apt/sources.list
wget -qO - http://research.cs.wisc.edu/htcondor/ubuntu/HTCondor-Release.gpg.key | sudo apt-key add -
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install condor docker.io
sudo -i
cat << EOT >> /etc/condor/condor_config.local

QUEUE_ALL_USERS_TRUSTED = TRUE
ALLOW_READ = *
ALLOW_WRITE = *
HOSTALLOW_READ = *
HOSTALLOW_WRITE = *
ALLOW_NEGOTIATOR = *
ALLOW_ADMINISTRATOR = *
COLLECTOR_DEBUG = D_FULLDEBUG
NEGOTIATOR_DEBUG = D_FULLDEBUG
MATCH_DEBUG = D_FULLDEBUG
SCHEDD_DEBUG = D_FULLDEBUG
START = TRUE
TRUST_UID_DOMAIN = TRUE
USE_SHARED_PORT=FALSE

EOT
sudo echo "DOCKER_OPTS=\"--insecure-registry 192.168.28.50:5000\"" >> /etc/default/docker
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo gpasswd -a condor docker
sudo gpasswd -a vagrant docker
newgrp docker
sudo service docker restart
sudo service condor restart
echo "-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-"
echo "  Para probar la instalacion ejecute 'condor_submit /vagrant/demo.condor'"
echo "-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-=*=-"
