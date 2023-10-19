#!/bin/bash

cat /etc/passwd | grep home | awk -F : '{print $1}' | awk -F : '$3 >= 1003 && $3 <= 1100 {print $1}' /etc/passwd > all_users.tmp

datetime=$(date +%Y-%m-%d_%T)

for usuario in `cat all_users.tmp`
do
	ruta=`echo /home/$usuario/documentacion`
	grupo=`groups $usuario | awk '{print $3}'`
	existe=`ls -l /home/$usuario | grep documentacion | wc -l`

#Aqui vamos a comparar para ver si existe el directorio documentacion

	sudo chmod 777 /home/$usuario
	if [ $existe -eq 1 ] && [ -d $ruta ];
	then
		echo Ya existe el directorio documentacion de $usuario
	else
		if [ -f $ruta ] || [ -L $ruta ];
		then
			mv /home/$usuario/documentacion /home/$usuario/documentacion_renombrado
		fi
		sudo mkdir /home/$usuario/documentacion
	fi

	sudo chmod 700 /home/$usuario/documentacion
	sudo chown $usuario:$grupo /home/$usuario/documentacion

#printf '\nCreando la nomina de $usuario\n'

        printf "Nombre: $usuario \nSalario: 4000€ \nFecha: $datetime\n" > /home/rrhh/nominas/"$usuario"_nomina.txt
        sudo chown $usuario:rrhh /home/rrhh/nominas/"$usuario"_nomina.txt
        sudo chmod 440 /home/rrhh/nominas/"$usuario"_nomina.txt

#printf '\nCreando el contrato de $usuario\n'

        printf "Nombre: $usuario \nTipo de contrato: Indefinido \nFecha de inicio de contrato: $datetime\n" > /home/rrhh/contratos/"$usuario"_contrato.txt
        sudo chown $usuario:rrhh /home/rrhh/contratos/"$usuario"_contrato.txt
        sudo chmod 440 /home/rrhh/contratos/"$usuario"_contrato.txt

#printf '\nCreando el link de $usuario\n'

        sudo chmod 777 /home/rrhh
        sudo chmod 770 /home/rrhh/contratos
        sudo chmod 770 /home/rrhh/nominas

        sudo -u $usuario ln -nsf /home/rrhh/nominas/"$usuario"_nomina.txt /home/$usuario/documentacion/"$usuario"_nomina.link
        sudo -u $usuario ln -nsf /home/rrhh/contratos/"$usuario"_contrato.txt /home/$usuario/documentacion/"$usuario"_contrato.link

	sudo chmod 700 /home/$usuario/documentacion
        sudo chmod 700 /home/$usuario

        sudo chmod 770 /home/rrhh
        sudo chmod 750 /home/rrhh/contratos
        sudo chmod 750 /home/rrhh/nominas

	sudo setfacl -m "g:empleados:--x" /home/rrhh
	sudo setfacl -m "g:empleados:r-x" /home/rrhh/contratos
	sudo setfacl -m "g:empleados:r-x" /home/rrhh/nominas
done

rm all_users.tmp
