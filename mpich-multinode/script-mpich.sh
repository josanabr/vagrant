#!/usr/bin/env bash
#
# Descargar mpich. 
# Definicion del sitio de descarga
DOWNLOAD_SITE="http://www.mpich.org/static/downloads/3.3.2/mpich-3.3.2.tar.gz"
MPICH_FILE="/vagrant/mpich-3.3.2.tar.gz"
MPICH_DIR="/vagrant/mpich-3.3.2"
CWD=$(pwd)
#
# Funciones auxiliares
#
install_build_tools() {
  if [ "$(which make)" == "" ]; then
    echo -n "Instalando herramientas de compilacion... "
    sudo apt update > /dev/null && sudo apt -y install build-essential > /dev/null && echo "instaladas"
  fi
}

compile_mpich() {
  install_build_tools
  cd ${MPICH_DIR}
  echo -n "Compilando MPICH... "
  ./configure --disable-fortran --prefix=/usr/local > /dev/null
  make > /dev/null
  echo " compilado"
}
#
# INICIO DE SCRIPT
#
# Descarga archivo mpich
#
if [ ! -f ${MPICH_FILE} ]; then
  echo -n "Descargando mpich file... "
  wget ${DOWNLOAD_SITE} -P /vagrant >& /dev/null && echo "descargado"
fi
#
# Descomprime archivo mpich y compila. Esto lo hara la maquina "maestro"
#
if [ ! -d ${MPICH_DIR} ]; then
  echo -n "Descomprimiendo ${MPICH_FILE}... "
  tar -C /vagrant -xf ${MPICH_FILE} && echo "descomprimido"
  echo "Compilando MPICH"
  compile_mpich
fi
install_build_tools
echo "Instalando MPICH"
cd ${MPICH_DIR}
sudo make install
cd ${CWD}
