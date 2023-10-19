#!/bin/bash
function _comprobar_si_existe_grupo
{
	existe=` getent group|grep -w $nombre_de_grupo|wc -l`
        if [ $existe -eq 1 ]
        then
		_mostrar_miembros_de_grupo
	else
		echo $nombre_de_grupo no existe en el sistema
        fi
}



function _comprobar_si_existe_gid
{
	existe=` getent group|grep -w $gid|wc -l`
        if [ $existe -eq 1 ]
        then
		nombre_de_grupo=`getent group|grep -w $gid|awk -F : '{ print $1 }'`
		_mostrar_miembros_de_grupo
        fi
}



function _mostrar_miembros_de_grupo
{

	printf  "\033[36mMiembros de $nombre_de_grupo \n\033[0m" 2> /dev/null

	miembros=` members $nombre_de_grupo|wc -l`
        if [ $miembros -eq 1 ]
        then
        	members $nombre_de_grupo 2> /dev/null
        	echo 
        else
                echo -e "\033[31mEste grupo no tiene miembros\e[0m"
        fi
}



if [ $# -eq 1 ]
then
	nombre_de_grupo=$1
	echo $nombre_de_grupo
	clear
	_comprobar_si_existe_grupo
else
	echo Si quieres consultar un grupo en concreto introduzca su nombre
	read -p "En caso contrario pulse 'n'" nombre_de_grupo
	clear
	if [ $nombre_de_grupo == "n" ]
	then
		#La variable 'gid' representa el identificador del grupo

		for gid in {1002..1050}
		do
			_comprobar_si_existe_gid
		done
	else
		_comprobar_si_existe_grupo
	fi
fi
