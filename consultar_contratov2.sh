#!/bin/bash
#Este script pregunta el usuario sobre el que queremos hacer la consulta y muestra por pantalla su ccontrato.

if [ $# -eq 1 ]
then
      usuario=$1
else
      read -p "Introduce un nombre: " usuario
fi

nombre_contrato=`echo "$usuario"_contrato.txt`
existe=`ls -l /home/rrhh/contratos |grep -w $nombre_contrato |wc -l`
if [ $existe -eq 1 ]
then

        existe_contrato=` sudo ls -l /home/rrhh/contratos | grep -w "$usuario"_contrato.txt |wc -l`
        if  [ $existe_contrato -eq 1 ]
        then
                sudo cat /home/rrhh/contratos/$nombre_contrato
        else
                 echo "  El usuario $nombre no tiene contrato en el sistema."
                 echo "  Contacte con rrhh."
        fi
else
        echo
        echo "  El usuario $nombre no existe en el sistema."
fi


#nombre_contrato=`echo "$usuario"_contrato.txt`

#existe=`ls -l /home/rrhh/contratos |grep -w $nombre_contrato |wc -l`

#echo Ha ejecutado el script sobre el contrato $nombre_contrato

#sudo cat /home/rrhh/contratos/$nombre_contrato
