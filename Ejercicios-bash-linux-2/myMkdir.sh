#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Script para crear un directorio si no existe
read -p "Introduce la ruta completa de un directorio: " ruta
if [ -d $ruta ]
then
    echo "El directorio ya existe."
else
    read -p "El directorio no existe. ¿Desea crearlo? [y/n]: " resp
    if [ $resp = y ] || [ $resp = Y ]
    then
        mkdir $ruta
        if [ -d $ruta ]
        then
            echo "Directorio creado correctamente."
            exit 0
        else
            echo "Ha habido un error y no se ha creado el directorio."
            exit 1
        fi
    elif [ $resp = n ] || [ $resp = N ]
    then
        echo "El directorio no se ha creado."
        exit 0
    else
        echo "Ha ocurrido un error inesperado."
        exit 1
    fi
fi