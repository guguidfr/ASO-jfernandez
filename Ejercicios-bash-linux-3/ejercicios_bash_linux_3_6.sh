#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
directorio=$1
if [ ! -d $1 ] || [ $# -ne 1 ]
then
    echo "El directorio es erróneo o ha habido un error con el número de parámetros."
    exit 1
else
    numero_ficheros=0
    for file in $(ls)
    do
        numero_ficheros=$(($numero_ficheros+1))
    done
    echo "El número total de ficheros y directorios es: $numero_ficheros    "
fi