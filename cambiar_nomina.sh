#!/bin/bash
#Este script recibe el nombre del usuario y el nuevo salario y actualiza el fichero $usuario_nomina.txt
#El fichero nomina generado pertenece al grupo rrhh en lugar de pertenecer al grupo seginf
#los permisos son 640 en lugar de ser 440.
#Mejora, las fechas de los pagos de las nominas, tienen que aparecer en lineas distintas

echo "--- Añadir nuevo salario ---"

#Escribimos un mensaje por pantalla y podamos introducir datos

read -p "A que usuario quieres añadir un nuevo salario: " usuario

#Creamos una variable, que nos busque en la ruta indicada, si existe el usuario

existe=`cat /etc/passwd | grep -w $usuario | wc -l`

#Creamos una condición, de si existe el usuario, nos lo indica
if [ $existe -eq 1 ];
then
	read -p "Dime el nuevo salario: " salario

#Nos busca, en el fichero de la ruta indicada los pagos anteriores

	pagos_anteriores=` sudo -u $usuario cat /home/rrhh/nominas/"$usuario"_nomina.txt | grep Fecha `

echo ------------------------- Listado de cambios -----------------------------

#Nos imprime por pantalla la fecha y salario anterior, y nos agrega la fecha y el salario nuevo.

	printf "Nombre: $usuario\nSalario: $salario\n$pagos_anteriores\nFecha: $(date "+%F_%T") Salario: $salario\n" | sudo tee /home/rrhh/nominas/"$usuario"_nomina.txt

#Cambia el propietario y grupo, al fichero que hemos modificado el salario.

	sudo chown $usuario:rrhh /home/rrhh/nominas/"$usuario"_nomina.txt

#Cambia los permisos del fichero que hemos modificado el salario.

	sudo chmod 640 /home/rrhh/nominas/"$usuario"_nomina.txt

else
	echo El usuario no existe
fi
