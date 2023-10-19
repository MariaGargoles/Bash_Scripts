#!/bin/bash

for i in `members empleados`;
do

	existe=`sudo ls -l /home/rrhh/curriculums/cv_$i.txt 2> /dev/null | grep -w cv_$i.txt | wc -l`

	if [ $existe -eq 0 ]   # Si no existe el fichero lo creo
	then
		printf "Generando /home/rrhh/curriculums/cv_$i.txt\n"
		sudo printf "CV de $i\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt;
		sudo printf "--------------------------------\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt;
		sudo printf "Nombre:\t$i\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt; 
		sudo printf "Contacto:\t"$i"@correo.mail\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt;
		sudo printf "Empresa anterior:\tpepo\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt;
		sudo printf "Puesto:\templeado\n" |sudo tee -a /home/rrhh/curriculums/cv_$i.txt;
		sudo chown $i:rrhh /home/rrhh/curriculums/cv_$i.txt
		sudo chmod 440 /home/rrhh/curriculums/cv_$i.txt
	else
		echo Ya existe /home/rrhh/curriculums/cv_$i.txt
		#sudo rm /home/rrhh/curriculums/cv_$i.txt
	fi

done
