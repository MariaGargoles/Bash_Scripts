#! /bin/bash

#Script que recibe como parámetro una ruta y nos devuelve los atributos extendidos de los ficheros de dicha ruta. 
#Si le pasamos un fichero, nos devolverá los atributos extendidos del fichero.

#lsattr

echo ---- Comprobar atributos extendidos ----

read -p "Escribe la ruta, fichero o enlace :"  ruta

if [ -L $ruta ]; then
	echo 
	echo $ruta es un enlace y no tiene atributos extendidos
else
	if [ -f $ruta ]; then
		lsattr -l $ruta
		echo 
		echo $ruta es un fichero
	else
		if [ -d $ruta ] ;then
			lsattr -Ral $ruta
			echo $ruta es un directorio
		else
			echo 
			echo $ruta no es un directorio, fichero o enlace
		fi
	fi
fi
