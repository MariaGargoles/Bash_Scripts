#!/bin/bash

read -p " ¿De que usuario quieres consultar la nomina? :" usuario

nombre_contrato=`echo "$usuario"_nomina.txt`
existe=`ls -l /home/rrhh/nominas |grep -w $nombre_contrato |wc -l`

if [ $existe -eq 1 ] 

	then
		echo -e "\n" ----------------- Nomina de $usuario -------------------- "\n"
		sudo cat /home/rrhh/nominas/$nombre_contrato
		echo -e "\n" -----------------------------------------------------------

	else
		echo $nombre_contrato no existe
fi
