#!/bin/bash
clear 
echo consultar nomina de un usuario
echo
read -p "introduzca el nombre del usuario:  " usuario
existe_usuario=`cat /etc/passwd |grep -w $usuario |wc -l`
if [ $existe_usuario -eq 1 ] 
then 

	nombre_nomina=`echo "$usuario"_nomina.txt`
	existe_nomina=`ls -l /home/rrhh/nominas |grep -w $nombre_nomina |wc -l`

	if [ $existe_nomina -eq 1 ];
        then
                echo nomina de $usuario 
                cat /home/rrhh/nominas/$nombre_nomina
        else
                echo la nomina del usuario $usuario no existe.
		echo consultar con rrhh 
	fi
else
	echo el usuario $usuario no existe en el sistema
fi
