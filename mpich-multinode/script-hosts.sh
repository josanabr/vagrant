#!/usr/bin/env bash
cat /vagrant/hosts >> /etc/hosts
sed -i "/^127.0.1.1/d" /etc/hosts
