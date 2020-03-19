# MPICH Multi-nodo

Para crear tres máquinas con MPICH desplegado en ellas debe ejecutar el comando 

```
vagrant up
```

Finalmente debe ejecutar los siguientes dos pasos.

Un documento detallado de los próximos pasos los puede encontrar en [este documento](https://docs.google.com/document/d/1IgQXv81USdHU4lRUsbXPN017BAPUXdqi5t9BUa6yXF8/edit?usp=sharing).

* [Configuracion NFS](#configuracion-nfs)
* [Acceso passwordless](#acceso-passwordless)
* [Probando MPI Cluster](#probando-mpi-cluster)

## Configuracion NFS

### Configuracion NFS para el maestro

Ingresar al nodo maestro

```
vagrant ssh master
```

Dentro de este nodo ejecutar los siguientes comandos:

```
sudo apt install -y nfs-kernel-server
sudo mkdir /shared
sudo chown nobody:nogroup /shared
sudo chmod 1777 /shared
```

Adicionar, como `root`, la siguiente línea al archivo `/etc/exports`:

```
/shared *(rw,sync,no_subtree_check)
```

Ejecutar los siguientes comandos:

```
sudo exportfs -a
sudo service nfs-kernel-server start
```

### Configuracion NFS para clientes

Para cada uno de los clientes, `node-1` y `node-2`, ejecutar los siguientes comandos. 
Acceder via SSH al nodo:

```
vagrant ssh node-1
```

Instalar paquetes:

```
sudo apt -y install nfs-common
sudo mkdir /shared
sudo mount master:/shared /shared
```

Repetir los comandos anteriores en el `node-2`.

## Acceso passwordless

En cada una de las máquinas, `master` `node-1` `node-2`, ejecutar el siguiente paso.

Modificar el archivo `/etc/sshd_config`:

* En la línea `PermitRootLogin prohibit-password` cambiar a `PermitRootLogin yes`.
* En la línea `PasswordAuthentication no` cambiar a `PasswordAuthentication yes`. 

Habiendo hechos los cambios, ejecutar el siguiente comando:

```
sudo service ssh restart
```

**Ahora en el nodo maestro ejecutar los siguientes pasos**

```
ssk-keyget -t rsa # a cada pregunta digite ENTER, es decir tres veces ENTER
```

Ejecute los siguientes comandos:

```
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@node-mpi-1 # type 'vagrant' as passwd
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@node-mpi-2 # type 'vagrant' as passwd
```

## Probando MPI Cluster

Asuma el programa `mpidemo.c`:

```
#include <stdio.h>

#include "mpi.h"

int main(){
 
  MPI_Init(NULL, NULL);  
 
  printf("Wonderful Class!\n");
 
  MPI_Finalize();

  return(0);
}
```

Compile el programa como sigue:

```
mpicc mpidemo.c -o /shared/mpidemo
```

Asuma que usted tiene un archivo llamado `hosts4run` en el directorio donde va a ejecutar este programa con el siguiente contenido:

```
node-mpi-1
node-mpi-2
```

Para ejecutar su programa debe ejecutar la siguiente línea:

```
mpirun -n 4 -f hosts4run /shared/mpidemo
```
