#!/bin/bash
for i in `members empleados`;
do 
	sudo -u $i ln -s /home/rrhh/vacaciones/calendario_laboral_2021.txt /home/$i/documentacion/calendario_laboral_2021.link; 
done;

