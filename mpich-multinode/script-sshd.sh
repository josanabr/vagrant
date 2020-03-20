#!/usr/bin/env bash
#
# Este script hace cambios en el sshd_config para posibilitar el acceso via ssh
# a la maquina virtual
#
# Author: John Sanabria 
# Date: 2020-03-19
#
sudo sed -i '/PermitRootLogin.*/c\PermitRootLogin yes' /etc/ssh/sshd_config
sudo sed -i '/PasswordAuthentication.*/c\PasswordAuthentication yes' /etc/ssh/sshd_config
sudo service ssh restart
