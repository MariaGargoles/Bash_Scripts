#!/bin/bash
touch /home/empleados/temporal/fichero.tmp;
usuario=`ls -l /home/empleados/temporal| grep -w fichero.tmp | awk '{print $3}'`;
rm /home/empleados/temporal/fichero.tmp

grupo=`groups $usuario | awk '{ print $3 }'`
fecha=`date +"%F"`
hora=`date +"%H:%M"`
printf "
----------------------------------------------------------------------
       SISTEMA DE INCIDENCIAS Y PETICIONES DE LA EMPRESA TARDIS
----------------------------------------------------------------------
Usuario: $usuario
Urgencia: Alta
Fecha: $fecha
Hora: $hora
Estado: ABIERTA
Incidencia: Necesito las aplicaciones de $grupo para poder trabajar
----------------------------------------------------------------------

" > /home/empleados/incidencias/"$usuario"_`date +"%F_%H:%M"`
ln -s /home/empleados/incidencias/"$usuario"_`date +"%F_%H:%M"` /home/$usuario/incidencias/"$usuario"_`date +"%F_%H:%M"`.link
