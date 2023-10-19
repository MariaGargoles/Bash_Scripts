#!/bin/bash

read -p " Qué incidencia desea consultar :" nombre_incidencia

existe=`ls -l /home/empleados/incidencias | grep -w $nombre_incidencia |wc -l`

if [ $existe -eq 1 ]; then
     sudo cat /home/empleados/incidencias/$nombre_incidencia

else
     echo $nombre_incidencia no existe

fi


