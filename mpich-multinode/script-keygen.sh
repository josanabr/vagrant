#!/usr/bin/env bash
#
# Este script genera llaves publicas y privadas RSA
#
# Author: John Sanabria 
# Date: 2020-03-19
#
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
