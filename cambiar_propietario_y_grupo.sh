#! /bin/bash

read -p "Introduce el nombre del grupo: " grupo

echo "--- cambiando usuario y grupo ---"
echo " del /home de los usuarios de $grupo "

for i in `members $grupo`
do
       printf echo procesando $i
       echo " sudo chown -R $i:$grupo /home/$i "

# quitar el print y el echo del principio para poder ejecutar el script primero
done
echo " ------------------------------------- "
echo Este script esta comentado porque cambiaria el grupo propietario sin tener en cuenta
echo Si el grupo es el primario o no
echo Futura mejora aplicarlo sobre el grupo primario de los usuarios

echo "--------Ha finalizado--------------"

