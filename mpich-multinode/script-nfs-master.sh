#!/usr/bin/env bash
#
# Este script permite la instalacion de servidor de NFS
#
# Author: John Sanabria 
# Date: 2020-03-19
#
sudo apt install -y nfs-kernel-server
sudo mkdir /shared
sudo chown nobody:nogroup /shared
sudo chmod 1777 /shared
echo "/shared *(rw,sync,no_subtree_check)" > /etc/exports
sudo exportfs -a
sudo service nfs-kernel-server start
