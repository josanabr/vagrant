#!/usr/bin/env bash
#
# Este script permite la instalacion de cliente de NFS
#
# Author: John Sanabria 
# Date: 2020-03-19
#
sudo apt -y install nfs-common
sudo mkdir /shared
sudo mount master:/shared /shared
