#!/bin/bash
echo
echo ----------------------------------------------
echo
case $# in
	1) usuario=$1
		echo $usuario está en los siguientes grupos:
		groups $usuario
		echo
		read -p "¿De qué grupo quieres sacar a $usuario? " grupo
		echo ;;
	2) usuario=$1
		grupo=$2
		echo;;
	*) echo
		read -p "¿Sobre qué usuario vamos a trabajar? " usuario
		echo
		echo ----------------------------------------------
		echo $usuario está en los siguientes grupos:
		groups $usuario
		echo ----------------------------------------------
		read -p "¿De qué grupo quieres sacar a $usuario? " grupo
		echo;;
esac

grupo_primario=`groups $usuario | awk -F ": " '{ print $2 }' | awk '{print $1}'`

echo El grupo primario de $usuario es $grupo_primario

# Guardo en un fichero temporal el resto de grupos del usuario
groups $usuario | awk -F ": " '{ print $2 }' | awk -F $grupo '{ print $1$2}' | awk -F $grupo_primario '{ print $1$2}' > resto_de_grupos_$usuario.tmp

if [ $grupo == $grupo_primario ]
then
	echo $grupo es el grupo primario de $usuario
	read -p "Pulse \"s\"  para cambiar el grupo primario de $usuario? " -n 1 confirmacion
	if [ $confirmacion == "s" ]
	then 
		echo
		read -p "Introduzca el nuevo grupo primario: " nuevo_grupo_primario
		sudo usermod -g $nuevo_grupo_primario $usuario
	else
		echo
		echo No se ha cambiado el grupo primario de $usuario
		echo
		exit 2
	fi
else
	> nuevos_grupos_$usuario.tmp
	for i in `cat resto_de_grupos_$usuario.tmp`
	do
		# Pongo comas entre los grupos (también queda una al final que eliminaré después)
		printf "$i," >> nuevos_grupos_$usuario.tmp
	done
	printf "\n" >> nuevos_grupos_$usuario.tmp
	echo -------------------------------------
	echo nuevos_grupos_$usuario.tmp contiene:
	cat nuevos_grupos_$usuario.tmp
	echo -------------------------------------

	# Saco al usuario del grupo (quitando el último caracter para que desaparezca la coma)
	echo sudo usermod -G `cat nuevos_grupos_$usuario.tmp |sed '$ s/.$//'` $usuario

	sudo usermod -G `cat nuevos_grupos_$usuario.tmp |sed '$ s/.$//'` $usuario
fi

# Elimino los ficheros temporales ignorando los mensajes de error.
rm resto_de_grupos_$usuario.tmp nuevos_grupos_$usuario.tmp 2> /dev/null

