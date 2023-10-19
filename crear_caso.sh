#!/bin/bash

numero_caso=`ls /home/auditoria/pruebas | grep caso_ | grep .txt | awk -F _ '{print $2}' | grep . | sort -u | tail -1`
comienzo_numero_caso=`echo ${numero_caso:0:2}`


if [ "$comienzo_numero_caso" == "00" ]
then
        numero_caso=`ls /home/auditoria/pruebas | grep caso_ | grep .txt | awk -F _ '{print $2}' | grep . | sort -u | tail -1 | awk -F 0 '{print $3}'`
else
        if [ "$comienzo_numero_caso" == "0" ]
        then
                numero_caso=`ls /home/auditoria/pruebas | grep caso_ | grep .txt | awk -F _ '{print $2}' | grep . | sort -u | tail -1 | awk -F 0 '{print $2}'`
        else
                numero_caso=`ls /home/auditoria/pruebas | grep caso_ | grep .txt | awk -F _ '{print $2}' | grep . | sort -u | tail -1 | awk -F 0 '{print $1}'`
 
        fi
fi

numero_caso=$((numero_caso+1))

echo "------Menu creación caso de amenaza------"
echo
read -p "Introduzca el nombre del caso:" nombre_caso
read -p "NIVEL DE AMENAZA (Nula, Baja, Media, Alta, Maxima):" nivel_amenaza
read -p "Propietario de la incidencia:" propietario
read -p "Grupo:" grupo
read -p "Contexto:" contexto
read -p "Posible solucion:" solucion
read -p "Estado (abierto/cerrado):" estado

if [ $numero_caso -lt 10 ]
then
	numero_caso_formateado=`echo 00$numero_caso`
else
	if [ $numero_caso -lt 100 ]
	then
		numero_caso_formateado=`echo 0$numero_caso`
	else
		numero_caso_formateado=`echo $numero_caso`
	fi
fi


echo ------------------------------------------ | tee /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Caso: $nombre_caso |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt

echo ------------------------------------------ |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo NIVEL DE AMENAZA: $nivel_amenaza |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo ------------------------------------------ |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Propietario: $propietario |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Grupo: $grupo |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Contexto: $contexto |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo ------------------------------------------ |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Posible solución: $solucion |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo ------------------------------------------ |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo Estado: $estado |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo ------------------------------------------ |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
echo |tee -a /home/auditoria/pruebas/caso_"$numero_caso_formateado"_"$nombre_caso".txt
