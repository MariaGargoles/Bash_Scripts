#!/bin/bash
grupo=`groups $USER | awk '{ print $3 }'`
fecha=`date +"%F"`
hora=`date +"%H:%M"`
printf "
----------------------------------------------------------------------
       SISTEMA DE INCIDENCIAS Y PETICIONES DE LA EMPRESA TARDIS
----------------------------------------------------------------------
Usuario: $USER
Urgencia: Alta
Fecha: $fecha
Hora: $hora
Estado: ABIERTA
Incidencia: Necesito las aplicaciones de $grupo para poder trabajar
----------------------------------------------------------------------

" > /home/empleados/incidencias/"$USER"_`date +"%F_%H:%M"`
ln -s /home/empleados/incidencias/"$USER"_`date +"%F_%H:%M"` /home/$USER/incidencias/"$USER"_`date +"%F_%H:%M"`.link
