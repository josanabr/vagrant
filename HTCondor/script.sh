#!/usr/bin/env bash
sudo echo "deb http://research.cs.wisc.edu/htcondor/ubuntu/stable/ trusty contrib" >> /etc/apt/sources.list
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install condor docker.io
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
