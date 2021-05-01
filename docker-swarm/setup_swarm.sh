#!/usr/bin/env bash
IP=$(ifconfig enp0s8 | head -n 2 | tail -n 1 | awk '{print $2}')
JOIN_SCRIPT="/vagrant/swarm-join"
#
# ----
#
join_swarm() {
  if [ ! -f ${JOIN_SCRIPT} ]; then
    echo "Script para unirse a docker swarm no disponible"
    exit 1
  fi
  . ${JOIN_SCRIPT}
}
create_swarm() {
  tmpfile=$(mktemp /tmp/swarm.XXXXXX)
  docker swarm init --advertise-addr ${IP} > ${tmpfile}
  grep "docker swarm" ${tmpfile}  | head -n 1 | awk '{$1=$1;print}' > ${JOIN_SCRIPT}
  rm ${tmpfile}
}
#
# ----
#

if [ "${1}" == "manager" ]; then
  create_swarm
else
  join_swarm
fi

