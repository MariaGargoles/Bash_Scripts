#!/bin/bash

#se ha creado un script que tenga dos formas de ejecutarlo, una de forma manual 
#y otra de forma interactiva


if [ $# -eq 1 ]
then

#if signfica si cumple la condición cumple la acción y si no hace otra acción
#[ $# -eq 1 ]; then .Comprueba si el contenido de la variable $# que es una 
#variable especial que amplia argumentos, es 1 
#en caso de ser 1, hará la siguiente acción;
#las siguientes líneas corresponden al script manual es decir al ejecutar hay que poner 
#el nombre de la incidencia

	nombre_incidencia=$1

	existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`

	echo Ha ejecutado el script sobre la incidencia $nombre_incidencia

	sudo cat /home/empleados/incidencias/$nombre_incidencia
	

else

	read -p " Qué incidencia desea consultar :" nombre_incidencia

	existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`

	if [ $existe -eq 1 ]; then
     		sudo cat /home/empleados/incidencias/$nombre_incidencia

	else
     		echo $nombre_incidencia no existe

	fi


fi
