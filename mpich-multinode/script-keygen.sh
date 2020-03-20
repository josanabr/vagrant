#!/usr/bin/env bash
#
# Este script genera llaves publicas y privadas RSA
#
# Author: John Sanabria 
# Date: 2020-03-19
#
ssh-keygen -t rsa -q -f "/home/vagrant/.ssh/id_rsa" -N ""
chown -R vagrant:vagrant /home/vagrant/.ssh
