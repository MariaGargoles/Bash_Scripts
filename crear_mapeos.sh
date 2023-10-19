#!/bin/bash

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

function _comprobar_si_existe_gid
{
        existe=` getent group|grep -w $gid|wc -l`
        if [ $existe -eq 1 ]
        then
                nombre_de_grupo=`getent group|grep -w $gid|awk -F : '{ print $1 }'`
               # _mostrar_miembros_de_grupo
		echo $nombre_de_grupo
        fi
}

# mostramos los grupos los grupos cuyos indentificadores se encuentran entre 1002 y 1050.

echo -------------------------- Grupos disponibles ----------------------------------------
for gid in {1002..1050}
do
     _comprobar_si_existe_gid | grep -v backup_tardis
done
echo --------------------------------------------------------------------------------------

read -p "¿ A qué grupo queremos crear los mapeos ?   " nombre_de_grupo
echo --------------------------------------------------------------------------------------

echo $nombre_de_grupo

existe=` getent group|grep -w $nombre_de_grupo|wc -l`
echo La variable existe vale $existe

echo --------------------------------------------------------------------------------------

if [ $existe -eq 1 ]
then
	#creamos el directorio "temporales" y si ya existe, ignoramos el error.
	mkdir /home/herramientas/temporales 2> /dev/null
	ls -l /home/herramientas | grep -w $nombre_de_grupo | awk ' {print $9}' | tee /home/herramientas/temporales/aplicaciones_$nombre_de_grupo.tmp

	for empleado in `members $nombre_de_grupo`
	do
		echo  procesando $empleado
        	for herramienta in `cat /home/herramientas/temporales/aplicaciones_$nombre_de_grupo.tmp`
        	do
			echo Procesando $herramienta
	                echo	sudo -u $empleado ln -s /home/herramientas/$herramienta /home/$empleado/aplicaciones/"$herramienta"_link
                	sudo -u $empleado ln -s /home/herramientas/$herramienta /home/$empleado/aplicaciones/"$herramienta"_link
# 			sudo -u $empleado rm /home/$empleado/"$herramienta"_link
	       	done
	done

else
       echo $nombre_de_grupo no existe en el sistema
fi


rm /home/herramientas/temporales/aplicaciones_$nombre_de_grupo.tmp
echo --------------------------------------------------------------------------------------
echo Gracias por usar crear_mapeos.sh
echo --------------------------------------------------------------------------------------
