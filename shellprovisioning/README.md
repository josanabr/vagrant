# Vagrantfile y *shell provisioning*

Uno de los aspectos interesantes en Vagrant es que además de tener una máquina virtual rápidamente te permite instalar software al interior de ella.
Existen diferentes mecanismos que soportan la instalación de software dentro de una máquina recien creada. 
En nuestro caso particular se hará uso de un *script* en Bash gracias a tener ya una familiaridad con la herramienta.

En el archivo [script.sh](script.sh) se encuentran las líneas necesarias para llevar a cabo la instalación del servidor web de Apache.
