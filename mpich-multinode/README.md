# MPICH Multi-nodo

Para crear tres máquinas con MPICH desplegado en ellas debe ejecutar el comando 

```
vagrant up
```

Finalmente debe ejecutar los siguientes dos pasos.

* [Acceso passwordless](#acceso-passwordless)
* [Probando MPI Cluster](#probando-mpi-cluster)

Un documento detallado de los próximos pasos los puede encontrar en [este documento](https://docs.google.com/document/d/1IgQXv81USdHU4lRUsbXPN017BAPUXdqi5t9BUa6yXF8/edit?usp=sharing).

El levantar las tres máquinas virtuales duró alrededor de **40 minutos** en una máquina con la siguiente configuración:

* Intel Core i7
* 16 GB en RAM

Software

* Vagrant - 2.2.6
* VirtualBox - 6.0.14

## Acceso passwordless

En el nodo maestro ejecutar los siguientes comandos

```
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@node-mpi-1 # type 'vagrant' as passwd
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@node-mpi-2 # type 'vagrant' as passwd
```

## Probando MPI Cluster

Asuma el programa `mpidemo.c`:

```
#include <stdio.h>
#include <unistd.h>
#include <limits.h>
#include "mpi.h"

int main(){
 
  char hostname[HOST_NAME_MAX + 1];
  gethostname(hostname, HOST_NAME_MAX + 1);
  MPI_Init(NULL, NULL);  
 
  printf("Wonderful Class from host %s!\n",hostname);
 
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
