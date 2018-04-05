# Vagrantfile y las *private network*

Las máquinas virtuales que se crean con Vagrant generalmente cuentan solo con una interfaz de red del tipo NAT.
Este tipo de interfaz no fue pensada para brindar servicios de red a través de ella sino que a través de ella se pueda acceder a otros servicios de red.

Vagrant permite que se adicione una nueva interfaz de red a una máquina virtual a través de la instrucción

```
  config.vm.network "private_network", ip: "192.168.33.10"
```

En este caso la nueva máquina de red tendrá dos interfaces de red, una tipo NAT y la otra una red tipo privada o *host only adapter*. 
Este tipo de red privada permite que máquinas que están en el mismo *host* se puedan comunicar entre ellas a través de sus respectivos números IPs.

## Valídelo usted mismo

* Descargue el archivo [Vagrantfile](https://raw.githubusercontent.com/josanabr/vagrant/master/privatenetwork/Vagrantfile).
* En el directorio donde lo descargo ejecute el comando `vagrant up`.
* Determine el nombre de la máquina virtual `VBoxManage list runningmvs`
* Valide que efectivamente su máquina virtual en ejecución, cuenta con dos interfaces de red. `VBoxManage showvminfo ...`
* Ingrese a la máquina virtual via SSH, `vagrant ssh`
* Cambie el password del usuario `ubuntu`, `sudo passwd ubuntu`
* Salga de la máquina virtual
* Ejecute, desde la terminal, el comando `ssh ubuntu@192.168.33.10`

## Hágalo usted mismo

Cree los archivos necesarios para tener una máquina virtual con el servidor web instalado en ella de modo que se accede a través del navegador con el URL [http://192.168.33.10](http://192.168.33.10). 
Observe que en este caso ya no se hace necesario especificar un puerto HTTP diferente al puerto 80 por defecto.
