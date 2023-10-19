#!/bin/bash
incidencia=$1


usuario=`ls -l /home/empleados/incidencias | grep -w $incidencia | awk '{ print $3 }'`

sudo -u $usuario rm /home/empleados/incidencias/$incidencia
sudo -u $usuario rm /home/$usuario/incidencias/$incidencia.link

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
Incidencia: Necesito las aplicaciones de $grupo para poder trabajar
Estado: CERRADA
----------------------------------------------------------------------

" > /home/empleados/incidencias/"$usuario"_`date +"%F_%H:%M"`_OK
ln -s /home/empleados/incidencias/"$usuario"_`date +"%F_%H:%M"_OK` /home/$usuario/incidencias/"$USER"_`date +"%F_%H:%M"_OK`.link
