#!/bin/bash

#Creamos variables de fecha y hora 
fechaym=$(date "+%Y-%m")
hora=$(date "+%H:%M:%S")
fecha=$(date "+%Y-%m-%d")

#Creamos el directorio pagos, donde iran los ficheros correspondientes de pagos de nominas de los empleados, en caso de no ejecutarlo por primera vez enviamos el mensaje de erros a /dev/null
mkdir /home/rrhh/nominas/pagos 2>/dev/null

#Cabecera fichero pago nominas
echo -e Pagos de nominas del mes de $fechaym de la empresa tardis."\n"| tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt
echo -e Proceso realizado el dia $fecha a las $hora "\n"| tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt 
echo ---------------------------------------------------------------------| tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt

#Recorremos cada usuario del grupo empleados mediante el bucle for
for username in `members empleados`
do
	#Comprobamos si existe el fichero nomina del empleado.
	if [ -f /home/rrhh/nominas/"$username"_nomina.txt ]; then

		#Si existe la nomina del empleado, comprobamos si el fichero tiene escrita la fecha que pasamos como variable (fechaym) del mes que queremos pagar la nomina.
		#Si no contiene dicha linea significa que la nomina de empleado aun no ha sido pagada, por lo que procedemos a realizar su pago. 
		nominatxt=`cat /home/rrhh/nominas/"$username"_nomina.txt | grep "$fechaym"| wc -l`
		if [ $nominatxt -eq 0 ]; then
        		echo -e  Fecha: "$fecha"_"$hora" pago realizado."\n" >> /home/rrhh/nominas/"$username"_nomina.txt 
			echo Pago de la nomina del usuario $username realizado.|tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt

		#En caso contrario, mostramos en el fichero de pago_nominas_fecha.txt que el empleado ya ha sido pagado. 
		else
        		echo "Este mes la nomina del usuario $username ya ha sido pagada."|tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt
		fi

	#En caso contrario, mostramos un mensaje indicando que el empleado no tiene nomina. 
	else
		echo El usuario $username no tiene nomina. Consultar con RRHH |tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt
	fi
#Fin del bucle
done

#Pie del fichero pago nominas
echo | tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt
echo -e ---------------------------- fin del log -----------------------------"\n"| tee -a /home/rrhh/nominas/pagos/pago_nominas_$fecha.txt
