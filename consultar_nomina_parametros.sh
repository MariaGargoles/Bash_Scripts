#!/bin/bash

#    $# contiene el numero de parametros que le hemos pasado al script
#    si hemos escrito:  ./script.sh parametro1 parametro2 
#    entonces $# contendra el numero "2"

#    $1 contiene el parametro1 
#    $2 contiene el parametro2
#    y asi sucesivamente......... 


if [ $# -eq 1 ] 	#si el numero de parametro es igual a 1   (-eq significa igualdad entre numeros )
then			#entonces 
      usuario=$1	#asigno a usuario el primer parametro
else			#en otro caso
      read -p "Introduce un nombre: " usuario	#muestro  "introduce  un nombre" y  guardo lo que tecleen  en variable usuario	
fi		#fin del if $#

nombre_nomina=`echo "$usuario"_nomina.txt`	# asigno a la var  nombre_nomina  el usuario_nomina.txt
existe=`cat /etc/passwd |grep -w $usuario |wc -l`	#asigno a existe  el resultado de cat  /etc/passwd que es el fichero 
							#donde se guarda los usuarios del sistema, filtrando por el nomb de usua
							#y contando las lineas.
							#si el usuario existe valdra 1, si no valdra 0 
if [ $existe -eq 1 ]	#si  exite vale 1  significa que el usuario existe
then #entonces

        existe_nomina=`ls -l /home/rrhh/nominas | grep -w "$usuario"_nomina.txt |wc -l` 
									#asigno a existe  el resultado de hacer un ls -l 
                                                                        #filtrando por nombre_nomina y contando las lineas
                                                                        #el resultado   es un numero 

        if  [ $existe_nomina -eq 1 ] #si  exite vale 1  significa que existe la nomina de ese usuario
 
        then # entonces
                sudo cat /home/rrhh/nominas/$nombre_nomina     # muestro la nomina por pantalla
        else  # en otro caso
                 echo "  El usuario $nombre no tiene nomina en el sistema."  # advierto de que no tiene nomina el usuario
                 echo "  Contacte con rrhh." 
        fi	#fin del if existe nomina
else   # en caso de que no exista el usuario
        echo
        echo "  El usuario $nombre no existe en el sistema."    # el usuario no existe
fi     # fin de if existe usuario


   
