# Vagrantfile y *shell provisioning*

Uno de los aspectos interesantes en Vagrant es que además de tener una máquina virtual rápidamente te permite instalar software al interior de ella.
Existen diferentes mecanismos que soportan la instalación de software dentro de una máquina recien creada. 
En nuestro caso particular se hará uso de un *script* en Bash gracias a tener ya una familiaridad con la herramienta.

En el archivo [script.sh](script.sh) se encuentran las líneas necesarias para llevar a cabo la instalación del servidor web de Apache.

## Valídelo usted mismo

* Abra el *dashboard* de VirtualBox
* Descargue los archivos [Vagrantfile](https://raw.githubusercontent.com/josanabr/vagrant/master/shellprovisioning/Vagrantfile) y el archivo [script.sh](https://raw.githubusercontent.com/josanabr/vagrant/master/shellprovisioning/script.sh).
* Ubíquese en el directorio donde descargó los archivos.
* Ejecute el comando `vagrant up`

## Hágalo usted mismo

Usted deberá crear un *script* que permita aprovisionar una máquina virtual con lo siguiente:

* Crear un usuario con *login* `usuario` y *password* `usuario`. [Aquí](https://askubuntu.com/questions/94060/run-adduser-non-interactively) puede encontrar detalles de como hacerlo.
* Instalar los siguientes programas
  * htop
  * mc
* Escoja algunos paquetes de los que se indican en la primera respuesta en este [foro](https://askubuntu.com/questions/151440/important-things-to-do-after-installing-ubuntu-server).

## *Bonus*

En algunas ocasiones es necesario pasar argumentos a un *script*. 
A continuación se presenta un `Vagrantfile` que muestra como ejecutar un *script* que recibe argumentos.

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial32"
  config.vm.provision "shell", path: "scriptargs.sh", args: ['hola mundo','hello world']
end
```

Observe que se ha adicionado un nuevo par en la definición del `config.vm.provision`, `args: ['hola mundo','hello world']`.
El valor de la clave `args` es un arrreglo y donde cada posición del arreglo representa una cadena. La cadena `hola mundo` será el primer argumento que se le pasa al *script*, la cadena `hello world` es el segundo argumento que se le pasa al *script*.
El *script* que se debe invocar para llevar a cabo la correcta ejecución del `Vagrantfile` anterior, es este. **Tenga en cuenta que las siguientes líneas se deben almacenar en un archivo llamado `scriptargs.sh`**.

```
#!/usr/bin/env bash
#
# Este script en bash recibe como argumentos una serie de cadenas y usará cada
# una de estas cadenas como el nombre de un archivo
#
for i in "$@"; do
  echo "${i}"
done
```

Para llevar a cabo entonces la ejecución de la sección de **Bonus** usted debe tener los siguientes archivos:

* `Vagrantfile`
* `scriptargs.sh`

Con estos archivos usted debe ejecutar entonces el comando

```
vagrant up
```

Ahora ingrese a la máquina virtual recien creada y valide que en el directorio `/tmp` se crearon los archivos `hola mundo.txt` y `hello world.txt`.

## Mayor información

* [Página oficial Vagrant - Shell Scripts](https://www.vagrantup.com/docs/provisioning/shell.html)
