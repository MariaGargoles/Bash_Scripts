#!/bin/bash

if [ $(id -u) -eq 0 ]; then
        read -p "Enter username : " username
        grep -w  "^$username" /etc/passwd >/dev/null
        #Comprobamos si el usuario ya existe.Si existe se termina el proceso, caso contrario continuamos con la creacion de usuario.  
        if [ $? -eq 0 ]; then
                echo "$username exists. Try again with another username!"
                exit 1
        else
                read -s -p "Enter password : " password
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                read -p "Enter usergroup : " usergroup
                group=$(perl -e 'print ($ARGV[0])' $usergroup)
                sudo useradd  -g  "$group" -m -d "/home/$username" -s /bin/bash -p "$pass" "$username"

		#Agregamos al usuario a los grupos que pasamos por teclado
		for i in  `seq 2 100`
                do
                        read -p "Enter usergroup$i : " grupo

			#Si el campo grupo esta vacio o damos al ENTER terminamos de agregar grupos y finalizamos con la creacion de la clave privada y publica
                        if [ "$grupo" == "" ] || [ "$grupo" == "\n" ] ; then 
                                mkdir /home/$username/.ssh
				chmod 777 /home/$username/.ssh
                                sudo -u $username ssh-keygen -t rsa -N "" -b 2048 -C "\"$username\".key" -f /home/$username/.ssh/$username.key
                                chmod 600 /home/$username/.ssh/*.key
                                chmod 644 /home/$username/.ssh/*.key.pub 
                                cp /home/$username/.ssh/*.key /home/seginf/
                                cp /home/$username/.ssh/*.key.pub /home/$username/.ssh/authorized_keys
                                chown $username:seginf /home/$username/.ssh/authorized_keys
				chown $username:seginf /home/seginf/"$username".key
                                 [ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"

                                sudo chown $username:seginf /home/$username/.ssh
                                sudo chmod 700 /home/$username/.ssh
                                sudo chmod 700 /home/$username


				#Adicionalmente creamos nomina y contrato del nuevo usuario llamando al script de nominas y contratos

				echo "Llamada al script nominas y contratos nomina_contrato.v3.sh $username"

                                exit 1

                        else
                               existe=`cat /etc/group | grep -w $grupo |wc -l`

        			if [ $existe -eq 1 ]; then
                			echo "$grupo existe"
                                	sudo usermod -a -G "$grupo" "$username"
        			else
                			echo "$grupo no existe"
        			fi
 
                        fi
                done
        fi
else
        echo "Only root may add a user to the system."
        exit 2
fi
