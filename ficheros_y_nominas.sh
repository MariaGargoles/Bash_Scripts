#! /bin/bash

echo --- creando ficheros nómina y contrato---

for usuario in `members seginf`
do


        sudo touch "$usuario"_nomina.txt >> Nomina de $usuario - 4000€ /home/$usuario/documentacion
        sudo touch "$usuario"_contrato.txt >> Contrato de $usuario .- indefinido /home/$usuario/documentaci>        sudo chmod 600 ~/"$usuario"_nomima.txt
        sudo chmod 600 ~/"$usuario"_contrato.txt
        sudo chown $usuario:$grupo ~/"$usuario"_nomina.txt
        sudo chown $usuario:$grupo ~/"$usuario"_contrato.txt
done

echo "----------------------"
echo Ha finalizado
echo --- creando links asociados---

for usuario in `members seginf`
do


        sudo ln /home/$usuario/documentación/"$usuario"_nomina.txt Nomina_de_$usuario
        sudo ln /home/$usuario/documentación/"$usuario"_contrato.txt Contrato_de_$usuario
done
echo "----------------------"
echo Ha finalizado
