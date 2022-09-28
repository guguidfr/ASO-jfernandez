#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Comprueba si lo pasado como argumento es un fichero o un directorio

ruta=$1
if [ -f $ruta ]
then
    echo "$ruta es un fichero"
elif [ -d $ruta ]
then 
    echo "$ruta es un directorio"
else
    echo "$ruta no es ni un archivo ni un directorio"
fi