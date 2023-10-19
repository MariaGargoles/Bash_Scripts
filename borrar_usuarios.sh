#!/bin/bash

#Para ejecutar este script debemos hacerlo de la siguiente manera: ./borrar_usuarios + nombre_usuario
#en el caso de no hacerlo, saltara un mensaje para introducir el nombre y comprueba si existe.
if [ $# -eq 1 ]
then
	usuario=$1
else
read -p "Introduce nombre de usuario:"  username
fi

existe=`cat /etc/passwd | grep -w $username |wc -l`

if [ $existe -eq 1 ]; then

	#Si existe, nos pregunta previamente siestamos seguros de borrar al usuario, nos acepta "yes" y "si"
    	echo $username existe

	usuario=`echo $1`
	echo ----------------------------------------------------------
	echo ¿Seguro que quieres eliminar al usuario $username?
	echo ----------------------------------------------------------

	read -p " + Escriba \"S\" o \"s\" para confirmar: " -n 1 -r

	# al responder con si procede a 1º borrar al usuario,2ºborrar sus contratros y nominas
 	# cuando acaba nos muestr aun mensaje por pantalla para decir que el proceso a acabado.
	#en caso de no haber podido reaclizar la operación se mostraría el 2º mensaje (else).

	if [[ $REPLY =~ ^[YySs]$ ]]
	then
                sudo userdel -r $username 2> /dev/null
                sudo rm /home/rrhh/contratos/"$username"_contrato.txt
		sudo rm /home/rrhh/nominas/"$username"_nomina.txt
		echo
                echo "  El usuario $username ha sido eliminado "
	else
        	echo
        	echo "  El usuario $username NO ha sido eliminado."
	fi
	echo ----------------------------------------------------------
else
	echo
    	echo "  El usuario $username no existe en el sistema."
fi
