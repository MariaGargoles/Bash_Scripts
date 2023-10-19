#!/bin/bash
#Este script pregunta el usuario sobre el que queremos hacer la consulta y muestra por pantalla su cv.
#Si no hay curriculum pero si usuario, nos indica que contactemos con rrhh 

if [ $# -eq 1 ]
then
      nombre=$1
else
      read -p "Introduce un nombre: " nombre
fi

existe=`cat /etc/passwd | grep -w $nombre |wc -l`
if [ $existe -eq 1 ]
then
	existe_cv=` sudo ls -l /home/rrhh/curriculums | grep -w cv_$nombre.txt |wc -l`
	if  [ $existe_cv -eq 1 ]
	then
		sudo cat /home/rrhh/curriculums/cv_$nombre.txt
	else
		 echo "  El usuario $nombre no tiene curriculum en el sistema."
		 echo "  Contacte con rrhh."
	fi
else
        echo
        echo "  El usuario $nombre no existe en el sistema."
fi





