#!/bin/bash

nivel_pedido=$1

> casos_$nivel_pedido.tmp

for caso in `ls /home/auditoria/pruebas | grep caso_ | grep .txt `
do
	nivel=`cat /home/auditoria/pruebas/$caso | grep AMENAZA | awk -F : '{ print $2 }'`

#	echo El nivel del fichero $caso es $nivel 
#	echo El nivel pedido es $nivel_pedido
#	echo


	if [ $nivel == $nivel_pedido ] 2> /dev/null
	then 
	    echo $caso >> casos_$nivel_pedido.tmp
        fi
done	

cat casos_$nivel_pedido.tmp
rm casos_$nivel_pedido.tmp
