#!/bin/bash

nombre_incidencia=$1

existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`

echo Ha ejecutado el script sobre la incidencia $nombre_incidencia

sudo cat /home/empleados/incidencias/$nombre_incidencia

#case $nombre_incidencia in
	#1) echo Salida correcta;exit 0;;
	#2) echo Salida regular;exit 1;;
	#3) echo Salida mala;exit 2;;
	#4) echo Salida horrible;exit 3;;
	#*) sudo cat /home/empleados/incidencias/$nombre_incidencia ; exit 0;;
#esac



