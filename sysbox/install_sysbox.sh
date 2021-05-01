#!/usr/bin/env bash
echo "Instalando sysbox"
VERSION="0.3.0"
SYSBOX_DW_URL="https://github.com/nestybox/sysbox/releases/download/v${VERSION}/sysbox-ce_${VERSION}-0.ubuntu-focal_amd64.deb"
wget ${SYSBOX_DW_URL}
echo "Finalizando sysbox"
apt install ./sysbox-ce_${VERSION}-0.ubuntu-focal_amd64.deb -y
