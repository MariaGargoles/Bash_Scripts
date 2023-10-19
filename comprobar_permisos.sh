#! /bin/bash
#Script que recibe como parámetro una ruta y nos devuelve los permisos avanzados de los ficheros de dicha ruta.
#Si le pasamos un fichero, nos devolverá los permisos avanzados del fichero.
#getfacl, es el comando a utilizar

echo "--- Comprobar permisos avanzados ---"

#Imprimimos por pantalla un mensaje, para que podamos introducir datos

read -p "Dime la ruta completa del fichero o directorio: " ruta

#Aquí lo que hacemos es hacer una condición, si es enlace no existe lo lleva a una salida de erronea, y si existe nos indica los permisos que tiene.

if [ -L "$ruta" ]; then
	getfacl $ruta 2> /dev/null
	echo $ruta es un enlace
else

#Si el fichero no existe lo lleva a una salida de erronea, y si existe nos indica los permisos que tiene.

     if [ -f "$ruta" ]; then
	getfacl $ruta 2> /dev/null
	echo $ruta es un fichero
     else

#Si el directorio no existe lo lleva a una salida de erronea, y si existe nos indica los permisos que tiene.

	if [ -d "$ruta" ]; then
        	getfacl $ruta 2> /dev/null
        	echo $ruta es un directorio
	else
		echo $ruta Te has equivocado al poner el nombre
	fi
     fi
fi
