#!/bin/bash

# Cuando se le introduce un nombre de usuario a este scipt, te devuelve todos ficheros abiertos que tenga dicho usuario.
# El nombre del usuario puede ser introducido ya sea a la misma vez que el nombre del script o tras activarlo.

if [ $# -eq 1 ]
then
	usuario=$1
else
	read -p "Introduce el nombre del usuario: " usuario
fi

existe=`cat /etc/passwd | grep -w $usuario | wc -l`

if [ $existe -eq 1 ]; then
	printf "$usuario tiene abiertos `sudo lsof -u $usuario | wc -l` ficheros\n"
	sudo lsof -u $usuario | more
else
	echo "$usuario no existe"
fi

