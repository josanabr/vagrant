#!/bin/bash
#
# Este script permite el aprovisionamiento del archivo /etc/hosts
#
cat > /etc/hosts << EOF
127.0.0.1	localhost
10.11.14.10     manager
10.11.14.11     node1
10.11.14.12     node2

# The following lines are desirable for IPv6 capable hosts
::1	ip6-localhost	ip6-loopback
fe00::0	ip6-localnet
ff00::0	ip6-mcastprefix
ff02::1	ip6-allnodes
ff02::2	ip6-allrouters
ff02::3	ip6-allhosts
EOF
