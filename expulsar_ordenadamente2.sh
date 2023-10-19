#! /bin/bash
#Añadimos el comando W al principio del script para poder ver los usuarios conectados en ese momento para realizar la expulsión


MENU=`echo "\033[36m"` #Blue 
NUMBER=`echo "\033[33m"` #yellow
NORMAL=`echo "\033[m"`

echo
echo -e "${MENU} *************_${NUMBER}Usuarios Conectados${MENU}_*****************${NORMAL}*"
echo
w



#Aqui realizamos la expulsion ordenada del usuario


echo
echo -e  "${MENU}------------------${NUMBER} Expulsar ordenadamente ${MENU} -------------${NORMAL}"
echo

read -p "Enter username : " user
read -p "Escriba \"s\" o \"n\" para confirmar: "  -n 1 -r 

if [[ $REPLY =~ ^[Ss]$ ]]; then

	sudo pkill -SIGTERM -u $user
 
	echo -e "\nEl usuario $user ha sido expulsado."

else
       	echo -e "\nEl usuario $user no ha sido expulsado."
fi

echo "---Ha finalizado---"

