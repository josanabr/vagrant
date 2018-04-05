# Vagrantfile y *definición de múltiples máquinas*

Dentro de las características de Vagrant es brindar soporte para la definición de múltiples máquinas virtuales en un solo  archivo `Vagrantfile`.

En el archivo [Vagrantfile](Vagrantfile) usted puede observar la forma como se logra tener la múltiple definición de máquinas en un solo `Vagrantfile`.

Para poder llevar a cabo la definición de múltiples máquinas virtuales se debe usar la sentencia `config.vm.define "etiqueta" do |label|`. 
Debe tenerse claro que `"etiqueta"` y `|label|` son palabras que se pueden definir de acuerdo al gusto e interés del desarrollador y tienen propósitos particulares como se verá en un momento. 

Cuando se tiene un archivo `Vagrantfile` con múltiples definiciones de máquinas virtuales, la creación de las máquinas se puede llevar de dos maneras inicialmente.
La primera forma es usando `vagrant up`. 
De esta manera se crean todas las máquinas definidas en el `Vagrantfile`. 
En este caso, y viendo el [Vagrantfile](Vagrantfile), se crearían dos máquinas etiquetadas como `"web"` y `"db"`. 

La otra forma es crear una sola máquina, por ejemplo la `"db"`.
Para llevar a cabo la creación de la máquina virtual `"db"` se ejecuta el comando `vagrant up db`. 

Dicho esto, las palabras `"web"` y `"db"` son claves a la hora de invocar el comando `vagrant`. 

* `vagrant ssh db` permite conectarse via SSH a la máquina virtual `"db"`.
* `vagrant destroy web` lleva a cabo el proceso de destrucción de la máquina virtual `"web"`.

Ya vimos algo referente a la palabra `"etiqueta"`, ahora veamos que relevancia tiene la palabra  `|label|`. 
En este caso, esta palabra se usa por Vagrant para determinar la personalización de una máquina virtual.
Veamos el siguiente código.

```
  config.vm.define "web" do |web|
  	web.vm.box = "ubuntu/xenial32"
  	web.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '386' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'web' ]
  	end
  end
```

Como se observa la palabra definida en `|web|` se usa para indicar cual es el *box* base para la creación de la máquina virtual e indicar quien es el proveedor de la virtualización de esta máquina virtual, en este caso `virtualbox`.

## Valídelo usted mismo

Descargue el archivo [Vagrantfile](Vagrantfile) y lleva a cabo las siguientes actividades.

* Levante todas las máquinas virtuales.
* Destruya la máquina virtual con etiqueta `"db"`.
* Haga una conexión SSH a la máquina virtual "web". Valide que tenga las características de memoria y CPU que se indican en el `Vagrantfile`.
* Levante la máquina virtual `"db"`.
* Destruya todas las máquinas virtuales.

## Hágalo usted mismo.

Defina un conjunto de archivos que le permitan hacer lo siguiente.

* Crear dos máquinas virtuales con direcciones IP 10.11.12.3/24 y 10.11.12.4/24, respectivamente.
* Una máquina aparecerá en el *dashboard* de VirtualBox como `nodo1` y la otroa como `nodo2`.
* En la máquina `nodo1` debe tener lo siguiente:

  * IP 10.11.12.3/42.
  * El programa `mc` instalado.
  * 600 MB de RAM y un núcleo.

* En la máquina `nodo2` debe tener lo siguiente:

  * IP 10.11.12.4/42.
  * El servidor web de Apache.
  * La página web del servidor Apache debe apuntar a una página web que queda en el directorio `${HOME}/html` del equipo anfitrión. **Nota** Usted puede definir la info que quiera vaya en el archivo HTML.
  * 1200 MB de RAM y dos núcleos.

* Validar que se puede hacer una conexión SSH desde el `nodo2` hacia el `nodo1`.
* Hacer una conexión HTTP desde el `nodo1` hacia el `nodo2` utilizando el aplicativo `wget`.

## Mayor información

* [Página oficial Vagrant - Multi-machine](https://www.vagrantup.com/docs/multi-machine/)
