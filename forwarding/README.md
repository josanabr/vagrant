# Vagrantfile y *port forwarding*

El *port forwarding* o redireccionamiento de puertos es un mecanismo que permite que un servicio corriendo en una máquina virtual sea accesible a través de la infraestructura de red del *host* o equipo anfitrión.

Por ejemplo, en el directorio de [aprovisionamiento via shell](../shellprovisioning) se instalaba un servidor web.
Sin embargo, aún no era claro como acceder a dicho servidor web desde el equipo anfitrión o *host*.

La sentencia

```
  config.vm.network "forwarded_port", guest: 80, host: 8080
```

Permite hacer *port forwarding* del puerto `8080` del *host* al puerto `80` de la máquina virtual.

## Valídelo usted mismo

* Abra el *dashboard* de VirtualBox
* Descargue el archivos [Vagrantfile](https://raw.githubusercontent.com/josanabr/vagrant/master/forwarding/Vagrantfile).
* Ubíquese en el directorio donde descargó el archivo.
* Ejecute el comando `vagrant up`

## Hágalo usted mismo

Revise el directorio de [aprovisionamiento a través de *shell*](../shellprovisioning) y haga las modificaciones que considere conveniente para que se pueda acceder desde el *host* al servidor web que corre en la máquina virtual.
