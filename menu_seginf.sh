#!/bin/bash

#Variables de colores para texto
NORMAL=`echo "\033[m"`
MENU=`echo "\033[36m"` #Blue 
NUMBER=`echo "\033[33m"` #yellow
FGRED=`echo  "\033[41m"`
RED_TEXT=`echo "\033[31m"`
ENTER_LINE=`echo "\033[33m"`



#Menu Principal
#Aqui añadimos la funcion del menu principal/usuario/fichero/equipo para poder llamarla cuando sea necesario y no estar repitiendo echos.

function _mostrar_menu_principal
{
clear
echo
echo -e "${MENU}*****************Menu Principal***********************************${NORMAL}"
echo
echo -e "${MENU} ${NUMBER} 1)${MENU} Gestion de Usuarios ${NORMAL}"
echo
echo -e "${MENU} ${NUMBER} 2)${MENU} Ficheros y Documentacion ${NORMAL}"
echo
echo -e "${MENU} ${NUMBER} 3)${MENU} Gestion del equipo ${NORMAL}"
echo
echo -e "${MENU}*****************************************************************${NORMAL}"
echo
echo -e "${ENTER_LINE} Introduce el nº de accion deseado o ${RED_TEXT}pulsa x para salir. ${NORMAL}"

}

function  _mostrar_menu_usuario {
clear
echo
echo -e "${MENU}***************Gestion de Usuarios*****************************************${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 1)${MENU} Crear usuario ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 2)${MENU} Borrar usuarios ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 3)${MENU} Listar grupos y usuarios ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 4)${MENU} Copiar history empleados ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 5)${MENU} Usuarios conectados ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 6)${MENU} Expulsion ordenada ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 7)${MENU} Ficheros abiertos ${NORMAL}"
echo
echo -e "${MENU}Pulsa ${RED_TEXT}Enter ${MENU}para abrir el menu de nuevo ${NORMAL}"
echo
echo -e "${MENU} Pulsa ${RED_TEXT}b ${MENU} para volver atras"
echo
echo -e "${ENTER_LINE} Introduce el nº de accion deseado o ${RED_TEXT}pulsa x para salir. ${NORMAL}"
echo
echo -e "${MENU}*****************************************************************${NORMAL}"
echo

}

function _mostrar_menu_ficheros
{
clear
echo
echo -e "${MENU}***********Ficheros y Documentacion*********************************${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 1)${MENU} Cambio de  permisos ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 2)${MENU} Comprobar Atributos ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 3)${MENU} Nominas y contratos ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 4)${MENU} Crear documentacion ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 5)${MENU} Comprobar permisos ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 6)${MENU} Ficheros y nominas ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 7)${MENU} Cambiar propietario y grupo ${NORMAL}"
echo
echo -e "${MENU}Pulsa ${RED_TEXT}Enter ${MENU}para abrir el menu de nuevo ${NORMAL}"
echo
echo -e "${MENU} Pulsa ${RED_TEXT}b ${MENU} para volver atras"
echo
echo -e "${ENTER_LINE} Introduce el nº de accion deseado o ${RED_TEXT}pulsa x para salir. ${NORMAL}"
echo
echo -e "${MENU}*****************************************************************${NORMAL}"
echo

}

function _mostrar_menu_equipo

{

clear
echo
echo -e "${MENU}*******************Gestion del equipo*******************************${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 1)${MENU} Journalctl: Sudo ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 2)${MENU} Procesos usuarios ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 3)${MENU} Ultimas conexiones ${NORMAL}"
echo
echo -e "${MENU}${NUMBER} 4)${MENU} Espacio libre  ${NORMAL}"
echo
echo -e "${MENU}Pulsa ${RED_TEXT}Enter ${MENU}para abrir el menu de nuevo ${NORMAL}"
echo
echo -e "${MENU} Pulsa ${RED_TEXT}b ${MENU} para volver atras"
echo
echo -e "${ENTER_LINE} Introduce el nº de accion deseado o ${RED_TEXT}pulsa x para salir. ${NORMAL}"
echo
echo -e "${MENU}*****************************************************************${NORMAL}"
echo



}

function _despedida {
echo
echo hasta pronto $USER 
                                        echo
                                        echo -e "${MENU}*****************************************************${NORMAL}"
                                        echo -e                 "${RED_TEXT}Ultimate Version"
                                        echo -e "${MENU}*****************************************************${NORMAL}";

}






#Esta es la funcion del menu usuarios que llama a los scripts de gestion de usuarios

function _menu_usuario
{

 _mostrar_menu_usuario



while read -p "     Introduce el numero de accion: " opt
echo

 _mostrar_menu_usuario
do
                        case $opt in
                                1)/home/herramientas/crea_usuarios_mejorado_denisse.sh;;
                                2)/home/herramientas/borrar_usuarios.sh;;
                                3)/home/herramientas/listar_grupos_y_usuarios.sh;;
                                4)/home/herramientas/copiar_history_empleados.sh;;
                                5)w;;
				6)/home/herramientas/expulsar_ordenadamente2.sh;; 
				7)/home/herramientas/ficheros_abiertos_de_usuario.sh;; 
				b)break;; 

                                x) echo; _despedida;exit;;
                        
				*) echo "opcion no valida";; 
			
			esac
			echo
                        read -p  "Pulse una tecla para volver al menu usuarios" -n 1
                        _mostrar_menu_usuario

done


 _mostrar_menu_principal





}



#Aqui llamamos a los scripts de ficheros

function _menu_fichero
{

 _mostrar_menu_ficheros

while read -p "        Introduce el numero de accion: " opt

 _mostrar_menu_ficheros

do
                        case $opt in
				1)/home/herramientas/cambio_permisos.sh;;
                                2)/home/herramientas/comprobar_atributos.sh;;
                                3)/home/herramientas/nomina_contrato.v3.sh;;
                                4)/home/herramientas/crear_documentacion_mejorado.sh;;
                                5)/home/herramientas/comprobar_permisos.sh;;
                                6)/home/herramientas/ficheros_y_nominas.sh;;
                                7)/home/herramientas/cambiar_propietario_y_grupo.sh;;
				b)break;; 
				x)echo;_despedida;exit;;
				*) echo "opcion no valida";;

                        esac
			echo
                        read -p  "Pulse una tecla para volver al menu ficheros" -n 1
			_mostrar_menu_ficheros
done
 _mostrar_menu_principal

}




#Aqui se llama a los scripts de menu de equipo
#Menu Gestion del equipo

function _menu_equipo
{

 _mostrar_menu_equipo

while read -p "    Introduce el numero de accion: " opt
 _mostrar_menu_equipo

do
                        case $opt in
				1) /home/herramientas/log_sudo_journalctl_48h.script;;
                		2) /home/herramientas/procesos_de_usuario.sh;;
                		3) /home/herramientas/ultimas_conexiones.sh;;
                		4) /home/herramientas/espacio_libre_en_fs.sh;;
				b) break;;
				x) echo;_despedida;exit;;
				*) echo "opcion no valida";;



			esac
			echo
			read -p  "Pulse una tecla para volver al menu equipo" -n 1
			_mostrar_menu_equipo
done
 _mostrar_menu_principal


}



#MenuPrincipal este script llama a otros menus para que interactuen con ellos a traves de la funcion function

 _mostrar_menu_principal

while  read -p "       Introduce opcion " opt

 _mostrar_menu_principal

do

	case $opt in
		1) clear;_menu_usuario;;
		2) clear;_menu_fichero;;
		3) clear;_menu_equipo;;
		x)  _despedida;exit;;


	esac
done






