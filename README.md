# README.md

En este repositorio se encuentran algunos ejemplos básicos de Vagrant en diferentes escenarios. A continuación una descripción de los directorios:

* **basic** muestra un archivo de Vagrant básico.
* **forwarding** ejemplifica el concepto de *port forwarding* en Vagrant.
* **multiplemachines** `Vagrantfile` donde se definen varias máquinas virtuales.
* **shellprovisioning** ejemplo de un ambiente basado en Vagrant que soporta el aprovisionamiento de Apache Web Server.
* **openmpi** directorio que contiene un número de archivos que permiten tener un ambiente de OpenMPI operacional con un solo nodo de procesamiento. Ejemplo de OpenMPI listo para ejecutarse.

Cada directorio creará una o varias máquinas virtuales al invocar la ejecución del comando `vagrant up`.

## Requerimientos

Se requiere

* Instalar vagrant, visite [vagrantup.com](http://vagrantup.com)
* Descargar el *box* `ubuntu/trusty64`. `vagrant box add ubuntu/trusty64`.
