#este script es creado para poder se llamdo desde "cambiar_contrato.sh", mediante u menú interactivo.

#introducimos la variable para que sea ejecudo sobre el usuario que ha sido nombrado desde el otro script.
username=`echo $1`

#esta variable nos servirá para que nos introduzca la fecha de inicidio del contrato.
fecha_inicio=`sudo -u $username cat /home/rrhh/contratos/"$username"_contrato.txt |grep inicio`

#Esta comprueba si el contrato del usuario que queremos cambiar la fecha existe.
existe_contrato=`ls -l /home/rrhh/contratos |grep -w $username |wc -l`

if [ $existe_contrato -eq 0 ];
then
	#si no existe, nos muestra en pantalla los siguientes mensajes.
	echo ATENCION: el contrato de $username no existe
	echo se procede a crear el contrato de $username
fi

#si existe nos pedirá la fecha la cual utilizaremos como nueva variable, para luego introducir los datos en el fichero
#del usuario y cambiarles los permisos, porque la usar sudo se guardaría como root:root.
read -p "Fecha de vencimiento (YYYY-MM-DD): " -n 10 date

echo
sudo chage -E $date $username
sudo chage -W 7 $username
sudo printf "Nombre: $username\nTipo de contrato: temporal\n$fecha_inicio\nFecha fin de contrato: $date\n" |sudo tee /home/rrhh/contratos/"$username"_contrato.txt
sudo chown $username:rrhh /home/rrhh/contratos/"$username"_contrato.txt
