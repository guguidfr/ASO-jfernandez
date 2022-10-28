#!/bin/bash
# José Daniel Fernández López
# 14/10/2022
if [ $(id -u $USER) -ne 0 ]
then
    echo "Debes ejecutar el comando como root."
else 
    while read -r line
    do
        if  id $line > /dev/null 2>&1
        then
            echo "El usuario $line EXISTE en el sistema."
        else
            echo "El usuario $line NO EXISTE en el sistema."
        fi
    done < $1
fi