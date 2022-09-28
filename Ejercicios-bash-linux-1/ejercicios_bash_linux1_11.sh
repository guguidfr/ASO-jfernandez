#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Comprueba los permisos sobre el fichero pasado como argumento

#ruta=$1
if [ -a $1 ]
then
    echo "$1 existe"
    if [ -r $1 ]
    then
        echo "Tienes permiso de lectura en $1"
    else
        echo "No tienes permiso de lectura en $1"
    fi
    if [ -w $1 ]
    then
        echo "Tienes permiso de escritura en $1"
    else
        echo "No tienes permiso de escritura en $1"
    fi
    if [ -x $1 ]
    then
        echo "Tienes permiso de ejecución $1"
    else
        echo "No tienes permiso de ejecución en $1"
    fi
else
    echo "$1 no existe"
    exit 1
fi