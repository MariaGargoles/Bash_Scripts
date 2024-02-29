**//Comandos administrativos de SSH://**
#Reiniciar el servicio SSH:

sudo service ssh restart

#Iniciar el servicio SSH:

sudo service ssh start

#Verificar el estado del servicio SSH:

sudo service ssh status

#Detener el servicio SSH:

sudo service ssh stop

#Generar claves SSH:


ssh-keygen -t rsa -N "passphrase" -b 2048 -C "nombre_de_clave" -f /ruta/nombre_de_clave

    -t rsa: Indica que se utiliza el algoritmo RSA para generar la clave.
    -N "passphrase": Opcional, es la frase de seguridad que se solicitará al conectar. Puedes dejarla en blanco para no usar passphrase.
    -b 2048: Especifica la longitud de bits de la clave. El valor por defecto es 2048 bits, pero se puede ajustar según necesidades (por ejemplo, -b 4096).
    -C "nombre_de_clave": Proporciona un comentario o nombre identificativo para la clave.
    -f /ruta/nombre_de_clave: Indica la ruta y el nombre del archivo donde se guardarán las claves.

Al ejecutar este comando, se generará una clave privada (nombre_de_clave) y una clave pública (nombre_de_clave.pub). La clave pública se comparte con los servicios que deseas autenticar.

Recuerda que la seguridad de la clave privada es crucial, y es recomendable protegerla con una passphrase si es posible. La clave pública (nombre_de_clave.pub) es la que compartes con los servidores remotos para autenticarte sin necesidad de contraseña.

**//Comandos basicos Admin Linux//**


#Combinaciones de rutas:

cd ../publica
cd /home/ubuntu/Usuarios/publica
cd ~/../publica

#Acceder a la configuración de SSH:

nano /etc/ssh/sshd_config


#ls - Ver contenido del directorio con diferentes opciones:


ls -l
ls -li
ls -l sudo*
ls -l "nombre"
ls -la
ls -ltu
ls -ls --full-time

#lsof - Listar archivos ejecutándose:

lsof
lsof -u nombre_usuario

mkdir "name" - Crear un nuevo directorio:

#Actualizar "paginas amarillas" para usar el comando locate:

sudo updatedb

#Ejecuciones en segundo plano:

htop  # Detallado
top   # Simplificado, salir con "Q"

#cat - Mostrar contenido de archivos y otras operaciones:


cat archivo.txt
cat > nombredearchivo
cat nombredearchivo1 nombredearchivo2 > nombredearchivo3
cat nombredearchivo | tr a-z A-Z > salida.txt

#Log del sistema - journalctl:

journalctl
journalctl -S -10m -U tomorrow
journalctl -S "2021-01-18 09:30:00" -U "2021-01-18 09:40:00"

#LOG DE AUTENTICACIÓN (auth.log):

cat /var/log/auth.log
cat /var/log/auth.log | grep sudoers

#eventviewer - Ventana de eventos (similar en concepto):

eventviewer

#Crear un archivo vacío:

touch fichero
> fichero

#history - Ver historial de comandos ejecutados:

history
history | grep "palabra"
history | grep "palabra" | tail -n N

#Compresion

tar -czf "nombre".tar.gz "archivo"
tar -xzvf "nombre".tar.gz
zip -r "nombre".zip "nombre"

#cambio de propietario 
chown "usuario" "archivo"

#Cambio permisos
chown usuario:grupo archivo  # Cambiar propietario y grupo
chmod xyz archivo           # Cambiar permisos

# Ejemplo: Cambiar propietario a usuario1 y grupo a grupo1, y dar permisos  rw- (lectura y escritura) al propietario
chown usuario1:grupo1 archivo
chmod 600 archivo
La notación numérica en chmod es la siguiente:

    4: Lectura (r)
    2: Escritura (w)
    1: Ejecución (x)

#Enlaces simbólicos y hardlinks:


ln -s /ruta/fichero nombreEnlace  # Crear enlace simbólico
ln -s /ruta nombreEnlace         # Enlace simbólico a un directorio

ln /ruta_a_enlazar/fichero_o_directorio nombre_del_enlace  # Crear enlace duro
ln -s /ruta_a_enlazar/fichero_o_directorio nombre_del_enlace  # Crear enlace simbólico

ln -nsf /nuevaruta/ nombredellink  # Modificar la ruta de un enlace simbólico

#Gestión de enlaces con el comando links:

ln -s /ruta-del-fichero-a-enlazarscript/fichero enlace-simbólico
ln /ruta_del_fichero/fichero nombre

ln -nsf /nuevaRuta/fichero nombreEnlaceSimbolico  # Actualizar la ruta de un enlace simbólico

ln -nf /ruta_enlace_de_lar_ruta_que_ha_sido_"perdida"(borrada)/hardlink nombrefichero
# Recuperar un enlace duro después de haber perdido la ruta del directorio o fichero enlazado

#Privilegios de sudo para un nuevo usuario:
# Editar el archivo /etc/sudoers
sudo visudo

# Agregar la siguiente línea para activar privilegios sudo para el nuevo usuario y grupo
%<group> ALL=(ALL) NOPASSWD: ALL

#Comandos de usuarios y sesiones:

id "nombre_usuario"  # Mostrar información sobre un usuario
get nombre_archivo   # Descargar un archivo
put nombre_archivo   # Subir un archivo
put -r directorio    # Subir contenido de un directorio
w                    # Mostrar usuarios conectados detalladamente
who                  # Mostrar usuarios conectados de forma resumida
finger nombre_usuario  # Muestra información sobre el usuario

# Comparar dos archivos
diff archivo1.txt archivo2.txt
diff -y archivo1.txt archivo2.txt  # Muestra de forma visual y sencilla las diferencias

# Instalar un paquete con apt
sudo apt install "nombre_paquete"

# Lista de accesos al sistema
last
last | grep "ip"     # Historial de conexión y desconexión de la IP indicada
last | grep still    # Lista de usuarios que siguen logados al sistema

#Herramientas de manipulación de texto:

    tr - Sustituciones rápidas dentro de un texto:
    tr [:upper:] [:lower:]                # Sustituir mayúsculas por minúsculas
    cat fichero.txt | tr [A-Z] [a-z]       # Sustituir mayúsculas por minúsculas en un archivo
    cat clientes_theZinc2.csv | tr 'áéíóúÁÉÍÓÚ' ' a e i o u A E I O U' | tr -d ' '  # Cambiar letras con tildes por letras sin tilde

#Manipulación de texto con awk:

ls -l | grep grupo | awk '{print $1 $9}'           # Imprimir permisos y nombre del fichero
ls -l | grep grupo | awk '{print "patata"}'        # Mostrar "patata" para cada línea
ls -l | grep grupo | awk '{print $0}'              # Mostrar toda la fila
ls -l | grep grupo | awk '{print $1}'              # Mostrar la primera palabra
ls -l | grep grupo | awk '{print $1 " " $9}'       # Mostrar permisos y nombre del fichero
ls -l | grep grupo | awk '{print "Usuario: " $4 "\tFichero:" " $10}'  # Mostrar usuario y fichero
ls -l | grep grupo | awk -F Jan '{print $2}'       # Utilizar "Jan" como separador y mostrar la columna siguiente

# Filtrar con awk
sudo journalctl -S -3d | grep "invalid user" | awk '$12=="port" {print "IP: " $11} $12!="port" {print "IP: " $12}'

#Aplicar correos a un fichero con nombres de clientes:

cat "fichero_a_aplicar" | awk '{print $1 "@correo.com"}' > "nuevo_fichero"

#Filtrado condicional con awk:

awk -F ";" '{nombre=$1; contacto=$2; empresa=$3; tipo=$4; pais=$5; print nombre " " contacto " " pais}' unico_usuario_puntoYcoma.txt

# Filtrar contenido con grep
grep "palabra_que_queremos_filtrar" nombre_de_fichero

# Matar y hacer logout a un usuario
skill -KILL -u nombre_de_Usuario
pkill -KILL -u nombre_de_Usuario
pkill -9 -u nombre_de_Usuario
pkill -SIGTERM -u nombre_de_usuario

# Ver y cambiar configuración de contraseñas con chage
chage -l nombre_de_usuario
chage nombre_de_usuario

# Compilar scripts con shc
shc -f script.sh

# Mostrar el árbol de directorios detalladamente con tree
tree -pug /ruta
tree -puga /ruta

# Mostrar errores en un script de Vim
vim nombre_de_fichero

# Enviar salida a más de un lugar con tee
comando | tee archivo.txt
comando | tee -a archivo.txt  # Añadir a un archivo

# Escapar un símbolo con "\"
comando \|

# Uso de find
find /home -not -type d -name *sudoers

# Visualizar contenido de un directorio línea a línea o por avances de página con less
ls -l /ruta | less

# Visualizar contenido de un fichero línea a línea o por avances de página con more
cat fichero_enorme.txt | more

# Ignorar la salida de error de un comando enviándola a /dev/null
comando_que_sea 2> /dev/null



#Sed - Visualizar rangos de líneas en un archivo:
# Mostrar un rango de líneas de un archivo con sed
sed -n '5,10p' /ruta/fichero

# Mostrar el archivo entero excepto un rango específico
sed '20,35d' /ruta/fichero

# Mostrar líneas y rangos no consecutivos
sed -n -e '5,7p' -e '10,13p' /ruta/fichero

# Mostrar líneas que contengan una palabra clave o expresión regular
sed -n '/^Jul  4/ p' /ruta/fichero

Crond (Crontab):

bash

# Editar el crontab del usuario
crontab -e

# Mostrar el contenido del crontab del usuario
crontab -l

# Borrar el crontab del usuario
crontab -r

# Cambiar el editor de crontab
select-editor

Esquema de cómo interpretar el crontab
minuto hora diadelmes mes diadesemana comando_que_queremos_ejecutar
 0 9 28 * * /ruta/nombre_script.sh
 */15 para cada 15 minutos
 1,2,3,4 o 1-4 para especificar varios valores
 30 9 * 12 1-4 /ruta/script.sh
 0 10 1-15 */2 1-5 /ruta/script.sh

#Backups con Rsync:
#Backup local de directorio a otro:

rsync -a -P directorio_de_origen directorio_destino

#Backup excluyendo archivos o directorios:


rsync -a -P --exclude 'carpeta_a_excluir' directorio_origen directorio_destino

#También se puede especificar un archivo que contenga las exclusiones:


nano exclusiones.txt
# Incluimos las exclusiones: Todos los ficheros con extensión jpg, la carpeta excluido, Todos los ficheros con extensión tmp
# Guardamos (Ctrl + Z)

rsync -a -P --exclude-from 'exclusiones.txt' origen destino

#Backup remoto con Rsync a través de SSH:

sudo rsync -a -P -e "ssh -i clave.key" origen usuario_remoto@ip_remota:ruta_destino

Ejemplo:


    rsync -a -P -e "ssh -i /home/usuario/.ssh/backup_maquinaid_usuario.key" ../documentacion backup_maquinaid@ip:/home/maquinaid

#Conversión de Datos con dos2unix y unix2dos:

    Dos2Unix:

    bash

dos2unix mi_fichero_de_windows.txt

#Unix2Dos:


unix2dos mi_fichero_de_unix.txt

#Para instalar los comandos (dos2unix y unix2dos):

sudo apt update
sudo apt install dos2unix

#Crear Grupos:

#Crear un grupo:


groupadd nombre_del_grupo

#Borrar un grupo:

groupdel nombre_del_grupo

#Cambiar el nombre de un grupo:


groupmod -n nuevo_nombre_grupo antiguo_nombre_grupo

#Verificar si un grupo existe:


    getent group nombre_del_grupo

#Crear Usuarios:

useradd -g nombre_del_grupo -m -d /ruta/del/directorio -s /ruta/del/shell -p password nombre_de_usuario

#Borrar un usuario y su directorio:


userdel -r nombre_de_usuario

#Cambiar el shell de un usuario:


usermod -s /ruta/del/nuevo/shell nombre_de_usuario

#Modificar el archivo /etc/passwd (uso extremo):

    nano /etc/passwd

#Modificar Usuarios y Grupos:

#Asignar una contraseña a un usuario:


passwd nombre_de_usuario

#Asignar usuarios a grupos:

usermod -a -G nombre_del_grupo nombre_de_usuario

#Cambiar el grupo primario de un usuario:

usermod -g nuevo_nombre_grupo nombre_de_usuario

#Eliminar a un usuario de un grupo:

    deluser nombre_del_grupo nombre_de_usuario

#Cambios en Propietarios y Permisos:

#Cambiar propietario y grupo a la vez:

chown nuevo_propietario:nuevo_grupo directorio_o_fichero_a_cambiar

#Cambiar permisos:


chmod permisos directorio_o_fichero (ejemplo: chmod 750 prueba)

#Cambiar propietario de un directorio:

chown nuevo_propietario directorio


#chattr permite proteger archivos y directorios contra cambios no deseados. Algunas opciones comunes incluyen:

#Proteger archivo:

sudo chattr +i archivo # Protege el archivo
sudo chattr -i archivo # Desprotege el archivo

#Proteger directorio:

sudo chattr +a directorio # Protege el directorio
sudo chattr -a directorio # Desprotege el directorio

#Ver atributos extendidos recursivamente:

lsattr -aR

#Atributo "s" para borrado seguro:

sudo chattr +s archivo # Activa borrado seguro
sudo chattr -s archivo # Desactiva borrado seguro

#lsattr:
#lsattr muestra los atributos extendidos de archivos y directorios. Algunas opciones útiles son:
#Mostrar atributos extendidos:

lsattr ./nombre_directorio_o_fichero

#Mostrar atributos extendidos de forma recursiva:


lsattr -aR

#Mostrar atributos extendidos con nombres:

lsattr -l

#Sticky Bit:
#El "sticky bit" es una protección adicional en los permisos. Para activarlo:
#Sticky Bit:


chmod 1777 fichero_o_directorio

#SetGID:
chmod 2777 fichero_o_directorio

#SetUID:
    chmod 4777 fichero_o_directorio

#Si deseas activar múltiples bits a la vez, el primer número es la suma de los valores respectivos.
#Ejemplo: Activar sticky bit (1) y setuid (4) simultáneamente:

chmod 5777 fichero_o_directorio

#Acceso a MyAdmin con XAMPP:


sudo /opt/lampp/lampp start

sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F

sudo /opt/lampp/lampp restart

#Modificar Ficheros Base de la Jerarquía de Archivos:
#Para agregar una ruta al PATH, ya sea temporalmente o en cada sesión, puedes usar el comando siguiente:


export PATH=$PATH:/ruta/del/nuevo/directorio

#Si deseas que esta ruta esté disponible cada vez que inicias sesión, puedes agregar la línea anterior al archivo .bashrc en tu directorio de inicio.

#CONTRASEÑAS Y SEGURIDAD DE LAS MISMAS]

#{Creación de Master Key}	Master Key: Ore0Cookie123



----------------------------------------------------------------------------------------------

#arp-scan sirve para dar información de los dispositivos conectados a nuestra red a través del interfaz indicado. Hay que indicar la dirección IP del gateway y el rango.
#No viene por defecto, así que si no lo tenemos, deberemos instalarlo con un:
sudo apt install arp-scan

#Y después ya podemos ejecutarlo sobre el interfaz que sea (y que podemos ver con route -n), la dirección IP del gateway y la máscara de la red:
sudo arp-scan --interface=nombre_interfaz rango_ip_gateway/máscara 
#La máscara define cuántos bits de la dirección IP forman la red y cuántos la dirección de host.

#Comando para ver información de los dispositivos conectados a nuestra red. Nos proporciona la MAC, que es una dirección única en internet, y que nos sirve para identificar el fabricante a través de los primeros bloques de números (separados por el símbolo ":").

sublist3r es una herramienta a la que le proporcionamos un nombre de dominio, y nos devuelve los subdominios de ese dominio que encuentre.
sublist3r –d NOMBRE_DOMINIO

#Lista de procesos y usuarios
sudo ps -e -u $nombre
-e para procesos. -u para usuario.
registros usar el aux para más detalles ⭐

sudo journalctl --since="$ndias days" | grep "invalid user" | awk '$12!="port" {print "Fecha: "$1" "$2 "\tHora: "$3 "\tIP: " $12 "\tPort: "$14"\tNombre: "$11} $12=="port" {print "\tFecha: "$1" "$2 "\tHora: "$3 "\tIP: " $11 "\tPort: "$13 "\tNombre: desconocido"}'

Netstat: se utiliza para mostrar información sobre conexiones de red, tablas de enrutamiento, estadísticas de interfaz y otros datos relacionados con la red en sistemas operativos.

a ➡ muestra todos los comandos y escuchas, incluyendo aquellas en estado establecido

n ➡ Muestra las direcciones IP y los números de puerto en formato numérico.

o ➡ Muestra el ID de proceso (PID) y el nombre del programa.

t ➡ Muestra el estado de las conexiones TCP.

u ➡ Muestra las conexiones UDP.

p ➡ Muestra el programa y el ID de proceso asociado con cada conexión.



