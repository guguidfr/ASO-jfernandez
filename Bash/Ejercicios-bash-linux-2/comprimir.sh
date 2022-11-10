#!/bin/bash
# José Daniel Fernández López
# 1/10/2022
# Pasar 3 parámetros para comprimir un archivo con el formato que queramos
function compress (){
    local err_code
    case "$1" in
        rar) #----- rar no está disponble para instalar en Debian, pero esto debería de funcionar si la instalación fuese posible
            dpkg -s rar > /dev/null 2>&1
            err_code=$?
            if [ $err_code -eq 0 ]
            then
                rar a "$2".rar "$2" > /dev/null 2>&1
                echo "Archivo comprimido."
            else
                apt install -y rar > /dev/null 2>&1
                rar a "$2".rar "$2" > /dev/null 2>&1
                echo "Archivo comprimido."
            fi
        ;;
        zip)
            dpkg -s zip > /dev/null 2>&1
            err_code=$?
             if [ $err_code -eq 0 ]
            then
                zip "$2".zip "$2"
                echo "Archivo comprimido."
            else
                apt update && apt install -y zip > /dev/null 2>&1 
                zip "$2".zip "$2"
                echo "Archivo comprimido."
            fi  
        ;;
        gzip)
            dpkg -s gzip > /dev/null 2>&1
            err_code=$?
            if [ $err_code -eq 0 ]
            then
                gzip -k "$2"
                echo "Archivo comprimido."
            else
                apt update && apt install -y gzip > /dev/null 2>&1
                gzip -k "$2"
                echo "Archivo comprimido."
            fi
        ;;
        bzip)
            dpkg -s bzip2 > /dev/null 2>&1
            err_code=$?
            if [ $err_code -eq 0 ]
            then
                bzip2 -k "$2"
                echo "Archivo comprimido."
            else
                apt update && apt install -y bzip2 > /dev/null 2>&1 
                bzip2 -k "$2"
                echo "Archivo comprimido."
            fi
        ;;
        *)
            echo "Error con el formato introducido."
            exit 1
        ;;
    esac
}
function root_privs (){
    if [ $(id -u) -ne 0 ]
    then
        return 1
    else
        return 0
    fi
}
if [ $# -ne 3 ]
then
    echo "Número de parámetros requeridos: 3"
    exit 1
elif [ "$1" != "-t" ]
then
    echo "El primer parámetro debe ser: -t"
    exit 1
else
    root_privs
    controlador=$?
    if [ $controlador -eq 0 ]
    then 
        compress "$2" "$3"
    else
        echo "Debes ejecutar el script siendo root o con sudo."
        exit 1
    fi
fi
# lpaneque: Es buena práctica no intentar instalar software desde un script. Si no está instalado, mejor informar de ello y finalizar el script. 
