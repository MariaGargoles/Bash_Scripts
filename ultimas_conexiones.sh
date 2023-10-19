#!/bin/bash

fecha=`date +%F`
hora=`date +%T`
echo -e "------ ULTIMAS CONEXIONES EN EL SISTEMA ------\n------ Fichero actualizado: $fecha -- $hora h\n" > /home/auditoria/ultimas_conexiones.txt 
last >> /home/auditoria/ultimas_conexiones.txt
