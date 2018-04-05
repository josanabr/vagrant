# Vagrant y *shared folder*

Los directorios compartidos o *shared folders* son espacios de almacenamiento común entre el *host* y el *guest*. 
La instrucción que permite el compartir un directorio en el *host* con la máquina virtual es:

```
  config.vm.synced_folder ".", "/tmp"
```

La línea anterior se interpreta de la siguiente manera, el directorio actual donde está ubicado el `Vagrantfile` va a ser visto dentro de la máquina virtual como el directorio `/tmp`.

## Valídelo usted mismo

* Abra el *dashboard* de VirtualBox
* Descargue el archivos [Vagrantfile](https://raw.githubusercontent.com/josanabr/vagrant/master/forwarding/Vagrantfile).
* Ubíquese en el directorio donde descargó el archivo.
* Ejecute el comando `vagrant up`
* Ingrese a la máquina virtual y valide que lo que se encuentra en el directorio `/tmp` es lo que hay en el directorio del *host*
