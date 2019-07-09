# HTCondor - All in one

En este repositorio se encuentran los archivos necesarios para hacer el despliegue de Docker + HTCondor (All-in-one). 
En una máquina virtual se instalará [Docker](https://www.docker.com) y [HTCondor](https://research.cs.wisc.edu/htcondor/) y se tendrá un sistema funcional con estas dos herramientas usadas en entornos de HTC (*Hight Throughput Computing*).

## Requerimientos

Instalar la herramienta [vagrant](https://vagrantup.com).
Durante el desarrollo de los scripts en este repositorio se usó la versión 2.2.5 de Vagrant.

---

## Pasos para el despliegue Docker + HTCondor (All-In-One)

Asumiendo que se ha instalado `vagrant` y desde una terminal, ubíquese en el directorio donde se encuentren los archivos listados en este directorio de este repositorio.
Una vez en el directorio ejecutar los siguientes pasos:

* `vagrant up`
* `vagrant ssh`
* `cd /vagrant`
* `condor_submit docker.condor`
* `cat out.0`

---

## Autores

Edier Zapata - edalzap@gmail.com

John Sanabria - john.sanabria@correounivalle.edu.co
