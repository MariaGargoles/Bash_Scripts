#!/bin/bash
echo
echo -----------------------------------------
echo  Visualizar crontab de usuarios de grupo
echo -----------------------------------------
echo
if [ $# -eq 1 ]
then
	grupo=$1
else
	read -p "Introduzca el nombre del grupo: " grupo
fi

echo Ejecuto "crontab -l" de los miembros de $grupo
echo -----------------------------------------

for i in `members $grupo`
do
	echo Usuario: $i >> /home/empleados/temporal/crontab.tmp
	sudo -u $i crontab -l -u $i 2>/dev/null >> /home/empleados/temporal/crontab.tmp
	echo ----------------------------------------- >> /home/empleados/temporal/crontab.tmp
	echo >> /home/empleados/temporal/crontab.tmp
done
cat /home/empleados/temporal/crontab.tmp | grep -v \# | more

rm /home/empleados/temporal/crontab.tmp
echo
