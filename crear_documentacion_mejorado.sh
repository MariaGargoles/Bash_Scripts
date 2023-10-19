#! /bin/bash

echo "-----creando fichero documentacion-----"

read -p "Si desea crear el directorio en un grupo,en caso contrario pulse enter :"  groupname

existe=`cat /etc/group | grep -w $grupo |wc -l`
usuario=`cat /etc/passwd | grep -w $usuario |wc -l`

#comprobamos si existe el grupo que hemos introcudico en la pregunta que nos muestras en pantalla
#y en caso de existir procedemos a crear el directorio "documentacion" dentro de los directorios privados
#de cada usuario ( el cual también hemos comprobado que existe previamente)

if [ $existe -eq 1 ]; then 

	echo El $grupo existe
	echo "creando directorio con $grupo"
echo	sudo mkdir documentacion /home/$usuario/documentacion
echo	sudo chmod 700 /home/$usuario/documentacion
echo	sudo chown $usuario:$grupo /home/$usuario/documentacion

else
	#En caso de no existir el grupo, te pide el nombre de usuario, comprueba si existe y crear el
	#directorio "documentación" dentro de su carpeta privada con los permisos y propietario/grupo que
	#le corresponde.

	echo "El $grupo no existe"
	echo
	read -p "Introduzca el nombre de usuario:" username

	egrep "^$username" /etc/passwd >/dev/null

echo        	sudo mkdir documentacion /home/$usuario/documentacion
echo        	sudo chmod 700 /home/$usuario/documentacion
echo        	sudo chown $usuario:seginf /home/$usuario/documentacion

fi

echo "------------Ha finalizado-------------"

