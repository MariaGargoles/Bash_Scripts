#!/bin/bash


 read -p " de que usuario desea ver los procesos en ejecución :" usuario

#el read -p nos permite hacer una pregunta interactiva para que el usuario
#pueda ejecutar el scrip, es decir tendriamos la pregunta y la variable 
#en la misma línea sin necesidad de crear un mensaje con echo
#resumido lo que escribamos, ese será el valor de la variable usuario

 existe=`cat /etc/passwd | grep -w $usuario |wc -l`

#para la variable existe filtramos con cat /etc/passwd | grep -w $usuario |wc -l
#para que busque el usuario

if [ $existe -eq 1 ]; then

#if signfica si cumple la condición cumple la acción y si no hace otra acción
#[ $existe -eq 1 ]; then .Comprueba si el contenido de la variable existe es 1 
#en caso de ser 1, es decir 1 un usuario hará la siguiente acción;

	sudo ps -e -u $usuario

#ps muestra los procesos, con -e muestra todos los procesos y con -u te indica el usuario


else

#de lo contrario si no cumple la condición es decir si hay 0 usuarios nos mostrará la siguiente linea

	echo "$usuario no existe"

#nos mostrará el texto $usuario no existe


fi 

#fin de la condición
