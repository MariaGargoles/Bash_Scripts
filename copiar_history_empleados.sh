#! /bin/bash
#Script que genera una copia del fichero .bash_history, el cual contiene el history del usuario, en el directorio de auditoria.
for usuario in `members empleados`

do
	fecha=$(date "+%F_%H-%M")
        ruta=`sudo ls -la /home/$usuario |grep .bash_history|wc -l`
	#Comprobamos si el usuario tiene creado su history. Si en su directorio personal no hay el fichero, entonces el valor de la variable ruta será 0.  
	#En caso contrario, continuamos con la copia del history del usuario. 
	if [ $ruta -eq 0 ]; then 
                echo  El empleado $usuario no tiene creado su history o lo ha borrado. 
        else
		sudo cp /home/$usuario/.bash_history /home/auditoria/historial_empleados/"$usuario"_historial_"$fecha".txt 
	       	sudo chown -R $usuario:auditoria /home/auditoria/historial_empleados/"$usuario"_historial_"$fecha".txt
		sudo chmod 440 /home/auditoria/historial_empleados/"$usuario"_historial_"$fecha".txt 
	fi
done


