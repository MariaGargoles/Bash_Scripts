#!/bin/bash
function _comprobar_si_existe_grupo
{
	existe=` getent group|grep -w $nombre_de_grupo|wc -l`
        if [ $existe -eq 1 ]
        then
        	printf  "\033[36mMiembros de $nombre_de_grupo \n\033[0m" 2> /dev/null

                miembros=` members $nombre_de_grupo|wc -l`
                if [ $miembros -eq 1 ]
                then
                        members $nombre_de_grupo 2> /dev/null
                        echo 
                else
                        echo -e "\033[31mEste grupo no tiene miembros\e[0m"
                fi
        fi
}


function _comprobar_si_existe_gid
{
	existe=` getent group|grep -w $gid|wc -l`
        if [ $existe -eq 1 ]
        then
		nombre_de_grupo=`getent group|grep -w $gid|awk -F : '{ print $1 }'`
                printf  "\033[36mMiembros de $nombre_de_grupo \n\033[0m" 2> /dev/null

                miembros=` members $nombre_de_grupo|wc -l`
                if [ $miembros -eq 1 ]
                then
                         members $nombre_de_grupo 2> /dev/null
                         echo 
                else
                         echo -e "\033[31mEste grupo no tiene miembros\e[0m"
                fi
        fi
}


if [$# -eq 1]
then
	nombre_de_grupo=$1
else

	#La variable 'gid' representa el identificador del grupo
	clear

	for gid in {1002..1050}
	do

		existe=` getent group|grep -w $gid|wc -l`
		if [ $existe -eq 1 ]
		then
			nombre_de_grupo=`getent group|grep -w $gid|awk -F : '{ print $1 }'`
			#getent group|grep  $gid|awk -F : '{print "\n" "\033[34m" $1 "\033[0m" "\n" $4 "\n" }'
			printf  "\033[36mMiembros de $nombre_de_grupo \n\033[0m" 2> /dev/null

			miembros=` members $nombre_de_grupo|wc -l`
			if [ $miembros -eq 1 ]
			then
				members $nombre_de_grupo 2> /dev/null
				echo 
			else
				echo -e "\033[31mEste grupo no tiene miembros\e[0m"
			fi
		fi
	done
fi
