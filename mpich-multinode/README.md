# MPICH Multi-nodo

Para crear tres máquinas con MPICH desplegado en ellas debe ejecutar el comando 

```
vagrant up
```

Finalmente debe ejecutar los siguientes dos pasos.

## Configuracion NFS

Un documento detallado de los próximos pasos los puede encontrar en [este documento](https://docs.google.com/document/d/1IgQXv81USdHU4lRUsbXPN017BAPUXdqi5t9BUa6yXF8/edit?usp=sharing).

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
