#!/bin/bash

#Este script lanza el rkhunter y crea un fichero txt con el log del rkhunter en el directorio de auditoria. 

#Ejecutamos el rkhunter con la opción -c para que realice chequeos 
sudo rkhunter -c 

#Hacemos una copia en el directorio de auditoria del fichero generado por el rkhunter
sudo cp /var/log/rkhunter.log /home/auditoria/log_rkhunter.txt
sudo chmod 644 /home/auditoria/log_rkhunter.txt
sudo chown seginf_director:auditoria /home/auditoria/log_rkhunter.txt
