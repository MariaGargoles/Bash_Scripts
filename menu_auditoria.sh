#!/bin/bash

#Este script es un menú de administración para el grupo auditoria, desde el que se pueden lanzar el resto de scripts. 
#Contiene al menos: crear_caso.sh, consultar_caso.sh, lanzar rkhunter, consultar_log de rkhunter, ips_maliciosas.sh, log_sudo_journalctl_48h.script, copiar_history_empleados, consultar_history_empleados.

clear
echo
echo ------------------- Menu auditoria --------------------
echo "1) Crear caso"
echo "2) Consultar caso"
echo "3) Lanzar rkhunter"
echo "4) Consultar log de rkhunter"
echo "5) ips maliciosas"
echo "6) journalctl: log de acciones hechas con sudo"
echo "7) Copiar history empleados"
echo "8) Consultar history empleados"
echo "9) Consultar ultimas conexiones"
echo "0) Salir del menú"
echo -------------------------------------------------------

while read -p "Introduzca el nº de la opcion deseada: " opcion
do
	clear
	echo
	echo ------------------- Menu auditoria --------------------
	echo "1) Crear caso"
	echo "2) Consultar caso"
	echo "3) Lanzar rkhunter"
	echo "4) Consultar log de rkhunter"
	echo "5) ips maliciosas"
	echo "6) journalctl: log de acciones hechas con sudo"
	echo "7) Copiar history empleados"
	echo "8) Consultar history empleados"
	echo "9) Consultar ultimas conexiones"
	echo "0) Salir del menú"
	echo -------------------------------------------------------
	case "${opcion}" in
                1) /home/herramientas/crear_caso.sh;; 
                2) /home/herramientas/consultar_casos.sh;; 
                3) /home/herramientas/log_rkhunter.sh;;
		4) echo 
		   echo  ----------- LOG RHKUNTER ------------
		   echo 
		   less /home/auditoria/log_rkhunter.txt
		   echo
		   echo  ----------- FIN DEL LOG ------------
                   echo 
	            ;;
		5) /home/herramientas/ips_maliciosas.sh
		   echo 
                   less /home/auditoria/IPs_maliciosas.txt
                   echo
                   echo  ----------- FIN DEL LOG ------------
                   echo  
		  ;;
                6) /home/herramientas/log_sudo_journalctl_48h.script
		   echo 
                   echo  ----------- LOG SUDO JORNALCTL ------------ 
                   echo 
                   less /home/auditoria/log_sudo_journalctl_48h.txt
		   echo
		   echo  ----------- FIN DEL LOG ------------
                   echo 
		   ;;
                7) /home/herramientas/copiar_history_empleados.sh;;
                8)
			read -p "Introduzca el nombre del empleado del que desea su history: " empleado
			usuario=`cat /etc/passwd |grep -w  $empleado | wc -l`
			if [ $usuario -eq 0 ]; then
				echo El empleado $empleado no existe 
			else 
				busqueda=`ls -l /home/auditoria/historial_empleados | grep -w $empleado|wc -l`
				if [ $busqueda -eq 0 ]; then 
					echo El empleado $empleado  no tiene history o lo ha eliminado. 
				else
					ls -l /home/auditoria/historial_empleados | grep -w $empleado
					read -p "Introduzca la fecha con el siguiente formato yyyy-mm-dd: " fecha
					ls -l /home/auditoria/historial_empleados | grep -w $empleado|grep $fecha
					read -p "Introduza hora hh-mm: " hora
					cat -n /home/auditoria/historial_empleados/"$empleado"_historial_"$fecha"_"$hora".txt
					echo 
                			echo  ----------- Fin del history de $empleado ------------ 
				fi
			fi;;
		9) /home/herramientas/ultimas_conexiones.sh #Ejecutamos el script correspondiente
		   cat /home/auditoria/ultimas_conexiones.txt;; #Mostramos el fichero txt por pantalla.
                0) echo Hasta pronto $USER; break;;
       esac
done
echo -----------------------------------------------------------
echo
echo
echo -----------------------------------------------------------
echo Copyright © 2021 Tardis. Todos los derechos reservados.
echo -----------------------------------------------------------
echo
