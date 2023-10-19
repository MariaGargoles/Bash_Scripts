#!/bin/bash

read -p " ¿De que usuario quieres consultar el contrato? :" usuario

nombre_contrato=`echo "$usuario"_contrato.txt`
#echo Nombre contrato es $nombre_contrato
existe=`ls -l /home/rrhh/contratos |grep -w $nombre_contrato |wc -l`
#echo Existe vale $existe

if [ $existe -eq 1 ] 

	then
		echo -e "\n" ----------------- Contrato de $usuario -------------------- "\n"
		sudo cat /home/rrhh/contratos/$nombre_contrato
		echo -e "\n" -----------------------------------------------------------

	else
		echo $nombre_contrato no existe
fi
