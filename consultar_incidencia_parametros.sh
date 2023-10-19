#!/bin/bash

#se ha creado un scrip que tenga dos formas de ejecutarlo, una de forma manual 
#y otra de forma interactiva


if [ $# -eq 1 ]
then

#if signfica si cumple la condición cumple la acción y si no hace otra acción
#[ $# -eq 1 ]; then .Comprueba si el contenido de la variable $# que es una 
#variable especial que amplia argumentos, es igual a 1 
#en caso de ser 1, hará la siguiente acción;
#las siguientes líneas corresponden al script manual es decir al ejecutar hay que poner 
#el nombre de la incidencia

	nombre_incidencia=$1
	
	#asigno a nombre_incidencia el primer parámetro

	existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`
	
	#asigno a existe  el resultado de hacer un ls -l
	#filtrando por nombre_incidencia y contando las lineas
	#el resultado es un numero, si existe valdrá 1 si no valdrá 0 

	echo Ha ejecutado el script sobre la incidencia $nombre_incidencia

	#Advierte de que se ha ejecutado el script	

	sudo cat /home/empleados/incidencias/$nombre_incidencia
	
	#muestro la incidencia por pantalla

else

#en caso de que prefieras el script interactivo

	read -p " Qué incidencia desea consultar :" nombre_incidencia

	#el read -p nos permite hacer una pregunta interactiva para que el usuario
	#pueda ejecutar el scrip, es decir tendriamos la pregunta y la variable 
	#en la misma línea sin necesidad de crear un mensaje con echo
	#resumido lo que escribamos, ese será el valor de la variable nombre_incidencia


	existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`

	#asigno a existe  el resultado de hacer un ls -l
        #filtrando por nombre_incidencia y contando las lineas
        #el resultado es un numero, si existe valdrá 1 si no valdrá 0 

	if [ $existe -eq 1 ]; then
     	
	#en caso de que existe sea 1 hará la sigiente acción
	
	sudo cat /home/empleados/incidencias/$nombre_incidencia

	#ordena que mueste en formato texto la incidencia que le hemos indicado en la pregunta

	else

	#en caso de que no exista, es decir que sea 0, mostrará el siguiente mensaje

     		echo $nombre_incidencia no existe


		#muestra el sigiente menseaje en pantalla

	fi

	#fin del bucle

fi

#fin del bucle
