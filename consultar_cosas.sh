#!/bin/bash
usuario=$1

echo Aquí tendrías que poner el control de si existe el usuario.
echo ---------
echo Ha ejecutado el script sobre el usuario $usuario



case $usuario in
	1) echo Salida correcta;exit 0;;
	2) echo Salida regular;exit 1;;
	3) echo Salida mala;exit 2;;
	4) echo Salida horrible;exit 3;;
	*) echo Buenos días :\); exit 0;;
esac
