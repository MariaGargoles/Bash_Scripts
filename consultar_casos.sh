#!/bin/bash

#Previamente creamos los menús interactivos para poder introducirlos son tener que copiar
#lo mismo todo el tiempo en el desarrollo del script.

function _menu_consultar_casos
{
	echo -------------------- MENU CONSULTAR CASOS ------------------------
        echo
        echo ¿Qué quieres hacer?
        echo
        echo "1) Consultar caso"
        echo "2) Filtar por nivel de criticidad (nula,baja,media,alta,maxima)"
        echo "3) Salir"
        echo ------------------------------------------------------------------
}





function _casos_disponibles
{
	clear
	echo "Casos disponibles:"
	echo ------------------------------------------------------------------
	echo
	ls -l /home/auditoria/pruebas | awk '{print $9}' | grep caso_ | grep .txt | more
	echo
	echo ------------------------------------------------------------------
	echo
}

#empezamos limpiando la pantalla he introduciendo el primer menú interactivo

clear
_menu_consultar_casos

#nos pide que introduzcamos la opción que queremos realizar

while read -p "Introduzca el nº de la opción deseada:" option
do
	case $option in

		#enla opción 1, nos muestra el menú de todos los casos que hay ya creados y nos
		#pregunta qué caso queremos consultar, comprueba que exista dentro del directorio
		#nos lo muestra por pantalla.

		1) _casos_disponibles
		   read -p "Introduce el nombre del caso:" nombre
		   existe=` ls -l /home/auditoria/pruebas | grep -w $nombre 2> /dev/null | wc -l`
		   if [ $existe -eq 1 ]
		   then
			clear
			echo Abriendo $nombre
			cat /home/auditoria/pruebas/$nombre
		   else
			# en caso de no existir nos muestra el siguiente mensaje en pantalla
			echo El caso $nombre no existe en el sistema
		   fi
		   echo
		   echo ------------------------------------------------------------------

		   #para volver al menú principal no pide que pulsemos alguna tecla
		   #y nos muestra solo el primer menú interactivo

		   read -p "Pulse cualquier tecla para continuar:" -n 1
		   clear
		   _menu_consultar_casos;;

		#En la opción 2, nos muestra todos los casos disponible y nos salta un mensaje que nos
		# muestra todos los niveles de criticidad y además nos pide el nivel que queremos filtar
		# para que nos muestra SOLO los casos que corresponden a ese nivel en pantalla.

		2) _casos_disponibles
		   echo Niveles: nula, baja, media, alta y critica
		   echo
		   read -p "Introduce el nivel:" nivel
		   clear
		   echo ------------------------------------------------------------------
	 	   case $nivel in
			 nula | baja | media | alta | critica)
			/home/herramientas/bucle_casos.sh $nivel;;
			*) echo $nivel no es un nivel valido;;
			# en caso de no existir el nivel introducido, nos lo avisa
		   esac

		   #para volver al menú principal no pide que pulsemos alguna tecla
                   #y nos muestra solo el primer menú interactivo

		   echo ------------------------------------------------------------------
		   read -p "Pulse cualquier tecla para continuar:" -n 1
		   echo ------------------------------------------------------------------
		   clear
		   _menu_consultar_casos;;
		3) echo ------------------------------------------------------------------;break;;
		 #En la opción 3, solo nos sirve para salir de menú.
	esac
done
echo
echo ------------------------------------------------------------------
echo Gracias por usar consultar_casos.sh
echo ------------------------------------------------------------------
