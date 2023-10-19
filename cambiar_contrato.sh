#!/bin/bash

#nos pide que introduzcamos el nombre del usuario al que queremos cambiar al contrato
read -p "Introduce el nombre de Usuario : " username

#comprueba en el sistemas si existe dicho usuario
existe=`cat /etc/passwd | grep -w $username |wc -l`

#si existe nos muentra el siguiente menú interactivo
if [ $existe -eq 1 ];
then
	echo Menú cambiar contrato
	echo "1) indefinido"
        echo "2) temporal"
        echo "0) cancelar"

	#introducimos una variable que vamos a necesitar para que, a la hora de hacer el cambio
	# muestre la fecha en la que se ha reaizado.
	fecha_inicio=`sudo -u $username cat /home/rrhh/contratos/"$username"_contrato.txt |grep inicio`
	while read -p "¿que tipo de contrato va a tener $username?  " option
	do
	# nos prregunta que tipo de contrato ca a tener el usuario de las 3 opciones posibles.
#		echo "1) indefinido"
#	        echo "2) temporal"
#		echo "0) cancelar"
		 case "${option}" in
			#utilizamos la vriable "opcion" para que, en este bucle se realizcen las siquientes
			#operaciones según la opción escogida:
			#1) cambia el contrato con la opción escogida
			#2) cambia la fecha de vencimiento del contrato
			#3) cancela la operación
        	        1) sudo printf "Nombre: $username\nTipo de contrato: indefinido\n$fecha_inicio\n" |sudo tee /home/rrhh/contratos/"$username"_contrato.txt;sudo chown $username:rrhh /home/rrhh/contratos/"$username"_contrato.txt;sudo chage -E -1 $username;break;;
                	2) /home/herramientas/cambiar_fecha_vencimiento.sh $username;break;;
                        0) echo cancelado ; break;;
	         esac
	done
fi
