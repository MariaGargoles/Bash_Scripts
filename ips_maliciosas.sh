#!/bin/bash
fecha=$(date +%F%t%T)
#Cabecera del fichero IPs_maliciosas.txt
echo  --------------------------------------------------------------------------------------------------------------------------- > /home/auditoria/IPs_maliciosas.txt 
echo >> /home/auditoria/IPs_maliciosas.txt
echo  -------------- IPs maliciosas desde las que se hacen ataques por fuerza bruta contra nuestro sistema tardis. -------------- >> /home/auditoria/IPs_maliciosas.txt
echo >> /home/auditoria/IPs_maliciosas.txt
echo  --------------------------------------------------------------------------------------------------------------------------- >> /home/auditoria/IPs_maliciosas.txt 

#Pasamos por teclado el numero de dias atras que queremos que nos filtre el journalctl 
read -p "Hola $USER, de cuantos dias quieres filtrar el journalctl " ndias
#Consultamos  el journalctl y lo filtramos por +invalid user+. El resultado lo guardamos en el fichero IPs_maliciosas.txt que está en /home/auditoria
sudo journalctl -S -"$ndias"d |grep "invalid user"|awk '$12!="port" {print "Fecha: "$1" "$2 "\tHora: "$3 "\tIP: " $12 "\tPort: "$14"\tNombre: "$11} $12=="port" {print "\tFecha: "$1" "$2 "\tHora: "$3 "\tIP: " $11 "\tPort: "$13 "\tNombre: desconocido"}' >> /home/auditoria/IPs_maliciosas.txt
#Comprobamos si el comando se ha ejecutado correctamente, en ese caso mostramos por pantalla un mensaje que nos lo confirme y continuamos cambiandole permisos al fichero creado.
if [ $? -eq 0 ]; then
	echo El fichero IPs_maliciosas ha sido creado correctamente
	#Cambiamos los permisos del fichero a lectura y escritura para el propietario y el grupo y solo lectura para el resto de usuarios. 	
	sudo chmod 664 /home/auditoria/IPs_maliciosas.txt
	#Cambiamos el grupo y el propietario del fichero ya que al usar sudo nos lo dejaria con usuario y grupo root.
	sudo chown seginf_director:auditoria /home/auditoria/IPs_maliciosas.txt

	#Pie del fichero 
	echo -e "\n" >> /home/auditoria/IPs_maliciosas.txt
	echo  --------------------------------------------------------------------------------------------------------------------------- >> /home/auditoria/IPs_maliciosas.txt
	echo  >> /home/auditoria/IPs_maliciosas.txt
	echo  Fichero actualizado: $fecha ---------------------------------------------------------------------------------- >> /home/auditoria/IPs_maliciosas.txt
	echo  --------------------------------------------------------------------------------------------------------------------------- >> /home/auditoria/IPs_maliciosas.txt
else 
	echo El fichero IPs_maliciosas no ha sido creado correctamente
fi

read -p "Quieres mostrar por pantalla el resultado, 's' para aceptar " -n 1 respuesta 
if [ "$respuesta" == "s" ]; then 
	less /home/auditoria/IPs_maliciosas.txt
fi
echo 
