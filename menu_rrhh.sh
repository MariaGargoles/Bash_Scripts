#"Este script es un menú de administración para el grupo rrhh, desde el que se pueden lanzar el resto de scripts
#Contiene al menos: generar_cv.sh, pagar_nomina.sh, consultar_contrato.sh, consultar_nomina.sh, consultar_cv.sh, cambiar_nomina.sh, cambiar_contrato.sh
#Y además dos acciones que solo puede ejecutar el usuario rrhh_director: contratar.sh y despedir.sh
#Posteriormente a determinados usuarios solo les dejaremos entrar en el sistema para hacer uso de este script, en lugar de conectarse al sistema en sí.
#Esto se hará restringiendo en authorized_keys para que ese usuario solo pueda ejecutar este script.(ver menu_seginf.sh)"

#!/bin/bash
function _menu_principal
{
clear
echo -------------------- Menu_rrhh --------------------
echo "1) Generar_cv.sh"
echo "2) Pagar_nomina.sh"
echo "3) Consultar_contrato.sh"
echo "4) Consultar_nomina.sh"
echo "5) Consultar_cv.sh"
echo "6) Cambiar_nomina.sh"
echo "7) Cambiar_contrato.sh"
echo "8) Mostrar usuarios del sistema"
echo "x) Salir"
echo ----------------------------------------------------
}


function _listar_usuarios
{

echo AYUDA: Para salir de la lista pulse " q "
echo
echo
echo "Pulse cualquier tecla para mostrar la lista de usuarios"

read -p "mensaje " -n 1

for trabajador in `members empleados`
do
	echo $trabajador
done
}

_menu_principal

while read -p "Introduzca el nº de la opcion deseada: " opciones
do
	_menu_principal

        case "${opciones}" in
                1) sudo /home/herramientas/generar_cv.sh;;
                2) sudo /home/herramientas/pagar_nomina.sh;;
                3) sudo /home/herramientas/consultar_contrato.sh;;
                4) sudo /home/herramientas/consultar_nomina.sh;;
                5) sudo /home/herramientas/consultar_cv.sh;;
                6) sudo /home/herramientas/cambiar_nomina.sh;;
		7) sudo /home/herramientas/cambiar_contrato.sh;;
		8) _listar_usuarios | less;;
		x) echo Hasta pronto $USER; break;;
        esac

	echo
	read -p "Pulse cualquier tecla para volver al menu" -n 1
	_menu_principal

done

echo ----------------------------------------------------
echo 			Hasta pronto
echo ----------------------------------------------------
