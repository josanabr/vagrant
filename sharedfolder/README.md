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

## Hágalo usted mismo

Cree los archivos `Vagrantfile` y `script.sh` y un directorio llamado `html` que tenga en su interior un archivo `index.html` con el siguiente contenido:

```
<html>
<h1> hola mundo </h1>
</html>
```

Todo lo anterior deberá permitir lo siguiente:

* Tener una máquina virtual llamada `servidorweb`
* Dicha máquina debe tener al menos 512 MB de RAM y 2 núcleos
* Instalar el servidor web de Apache en dicha máquina
* Se pueda acceder al servidor web de la máquina virtual en el puerto `8008` de la máquina física
* Se asocie el directorio `html` que usted acabó de crear con el directorio `/var/www/html`.
* Abra su navegador y visite el url [http://localhost:8008](http://localhost:8008).

Para validar que los directorios están sincronizados modifique el saludo `hola mundo` por `hello world`.
Vuelva y visite el url [http://localhost:8008](http://localhost:8008).
Usted deberá ahora ver su mensaje de saludo en inglés.
