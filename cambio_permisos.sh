#!/bin/bash

for usuario in  `members empleados`
do
	echo procesando $usuario
	sudo chmod 700 /home/$usuario
	#Borramos permisos extendidos de la carpeta documentacion de cada empleado.Ignoramos los mensajes de error. 
	sudo setfacl -b /home/$usuario/documentacion 2>/dev/null

	#Borramos ficheros y links de versiones anteriores creados por el script nominas y contratos. Compromabmos si son ficheros o limks, los eliminamos una vez hecha la comrobacion, si en la ruta no existe el fichero el mensaje de error no se mostrara por pantalla.
	contratotxt=`echo /home/$usuario/documentacion/"$usuario"_contrato.txt`
	nominatxt=`echo /home/$usuario/documentacion/"$usuario"_nomina.txt`
	contratolink=`echo /home/rrhh/contratos/"$usuario"_contrato_link`
	nominalink=`echo /home/rrhh/nominas/"$usuario"_nomina_link`

	if [ -f $contratotxt ]; then
                echo $contratotxt es un fichero
		sudo rm /home/$usuario/documentacion/"$usuario"_contrato.txt
       	fi

	if [ -f $nominatxt ]; then
                echo $nominatxt es un fichero
		sudo rm /home/$usuario/documentacion/"$usuario"_nomina.txt
        fi

	if [ -L $contratolink ]; then
                echo $contratolink es un enlace
		sudo rm /home/rrhh/contratos/"$usuario"_contrato_link
        fi

	if [ -L $nominalink ]; then
                echo $nominalink es un enlace
		sudo rm /home/rrhh/nominas/"$usuario"_nomina_link
        fi


done
