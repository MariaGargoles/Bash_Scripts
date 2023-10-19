#! /bin/bash

echo "--- Expulsar ordenadamente ---"

read -p "Enter username : " user
read -p "Escriba \"s\" o \"n\" para confirmar: "  -n 1 -r 

if [[ $REPLY =~ ^[Ss]$ ]]; then

	sudo pkill -SIGTERM -u $user
 
	echo -e "\nEl usuario $user ha sido expulsado."

else
       	echo -e "\nEl usuario $user no ha sido expulsado."
fi

echo "---Ha finalizado---"

