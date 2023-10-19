#!/bin/bash


for usuario in `members seginf`

do 

#printf '\nCreando la nomina de $usuario\n'

	sudo chmod 777 /home/$usuario
	sudo chmod 777 /home/$usuario/documentacion
	sudo chmod 777 /home/$usuario/documentacion/"$usuario"_nomina.txt
	sudo chmod 777 /home/$usuario/documentacion/"$usuario"_contrato.txt

#se dan permisos extendidos a estas dos carpetas para podeer acceder a sus ficheritos
	sudo setfacl -m "g:rrhh:r-x" /home/$usuario/documentacion
        sudo setfacl -m "g:rrhh:r-x" /home/$usuario

	sudo setfacl -m "g:seginf:---" /home/$usuario/documentacion
        sudo setfacl -m "g:seginf:---" /home/$usuario

	sudo echo "Nomina de $usuario --> 4000€" >> /home/$usuario/documentacion/"$usuario"_nomina.txt
	sudo chown $usuario:seginf /home/$usuario/documentacion/"$usuario"_nomina.txt

        sudo setfacl -m "g:rrhh:rw-" /home/$usuario/documentacion/"$usuario"_nomina.txt
	sudo chmod 600 /home/$usuario/documentacion/"$usuario"_nomina.txt

#printf '\nNomina finalizada\n'
#printf '\nCreando el contrato de $usuario\n'

	sudo echo "Contrato de $usuario --> Indefinido" >> /home/$usuario/documentacion/"$usuario"_contrato.txt
	sudo chown $usuario:seginf /home/$usuario/documentacion/"$usuario"_contrato.txt
	sudo setfacl -m "g:rrhh:rw-" /home/$usuario/documentacion/"$usuario"_contrato.txt
	sudo chmod 600 /home/$usuario/documentacion/"$usuario"_contrato.txt

#printf '\nContrato finalizado\n'
#printf '\nCreando el link de $usuario\n'

	sudo chmod 777 /home/rrhh
        sudo chmod 777 /home/rrhh/contratos
        sudo chmod 777 /home/rrhh/nominas

	sudo -u rrhh_director ln -nsf /home/$usuario/documentacion/"$usuario"_nomina.txt /home/rrhh/nominas/"$usuario"_nomina_link
	sudo -u rrhh_director ln -nsf /home/$usuario/documentacion/"$usuario"_contrato.txt /home/rrhh/contratos/"$usuario"_contrato_link

	#mv /home/herramientas/"$usuario"_nomina_link /home/rrhh/nominas
	#mv /home/herramientas/"$usuario"_contrato_link /home/rrhh/contratos

#Estos tres sudos comentados estan mal ejecutados y era lo que hacia que estuvieran mal los permisos y no pudiese entrar el director de rrhh en la carpeta.

	#sudo chmod 700 /home/rrhh
        #sudo chmod 700 /home/rrhh/contratos
        #sudo chmod 700 /home/rrhh/nominas

	sudo chmod 750 /home/$usuario/documentacion
	sudo chmod 750 /home/$usuario

	sudo chmod 770 /home/rrhh
	sudo chmod 750 /home/rrhh/contratos
	sudo chmod 750 /home/rrhh/nominas

#printf '\nLink creado\n'

done

printf '\nFINALIZADO\n'
