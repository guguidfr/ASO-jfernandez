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
        if 
    elif [ $resp = n ] || [ $resp = N ]
    then
        echo "El directorio no se ha creado"