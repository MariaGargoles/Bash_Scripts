#!/bin/bash

# Este script da la cantidad de espacio libre en en cada disco, te avisa con una alerta si el porcentaje de uso supera el 90%.

#df -h | grep -w sda1 | awk '{ print $1 " espacio libre " $4 " porcentaje usado " $5 }'


porcentaje_de_uso=`df -h | grep -w sda1 | awk '{ print $1 " espacio libre " $4 " porcentaje usado " $5 }' | awk '{ print $7 }' | awk -F % '{ print $1 }'`
espacio_libre=`df -h | grep -w sda1 | awk '{ print $1 " espacio libre " $4 " porcentaje usado " $5 }' | awk '{ print $4 }'`


if [ $porcentaje_de_uso -gt 90 ]; then
	echo  ALERTA $porcentaje_de_uso es mayor al 90% solo queda  $espacio_libre de espacio libre
else
	echo El espacio libre es del $espacio_libre
fi


