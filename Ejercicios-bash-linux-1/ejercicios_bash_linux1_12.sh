#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# El usuario pasa por parámetro una nota y recibirá un resultado

#read -p "Introduce tu nombre de usuario: " nombre
#read -p "Introduce tu 1: " 1

if [ $# -ne 1]
then
    echo "Número de parámetros no válido"
    exit 1
fi

if [ $1 -lt 5 ] && [ $1 -ge 0]
then
    echo "La nota es INSUFICIENTE"
elif [ $1 -ge 5 ] && [ $1 -lt 7 ]
then
    echo "La nota es SUFICIENTE"
elif [ $1 -ge 7 ] && [ $1 -lt 9 ]
then
    echo "La nota es NOTABLE"
elif [ $1 -ge 9 ] && [ $1 -lt 10 ]
then
    echo "La nota es SOBRESALIENTE"
elif [ $1 -eq 10 ]
then
    echo "La nota es MATRÍCULA DE HONOR"
else
    echo "Ha habido un error"
    exit 1
fi