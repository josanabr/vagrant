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

Descargue el archivo [Vagrantfile](
