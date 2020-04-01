#!/usr/bin/env bash
#
# Script used to install docker-compose
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Date: 2020-04-01
#
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
