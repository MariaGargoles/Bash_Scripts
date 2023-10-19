#!/bin/bash
case $# in
	0) read -p "Introduce un nombre: " nombre
	   read -p "introduce un apellido: " apellido;;
	1) nombre=$1
	   apellido=`echo desconocido`;;
	2) nombre=$1
	   apellido=$2;;
	*) echo El numero de parametros no es valido
	   exit 1;; #devuelve el codigo de retorno 1
esac
echo Hola $nombre $apellido

exit 0 #este exit 0 si no lo pongo no cambia nada porque un script cuando llega al final
       #si no a habido fallos devuelve el código de retorno 0

