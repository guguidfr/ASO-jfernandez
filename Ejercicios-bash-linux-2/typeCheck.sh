#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Script para comprobar si un fichero/documento existe y los permisos que tenemos sobre el mismo

#Comprobar el número de parámetros pasados como argumentos

# if [ $# -eq 1 ]
# then
#     echo "Un parámetro"
# elif [ $# -gt 1 ]
# then
#     echo "Más de un parámetro"
# elif [ $# -eq 0 ]
# then
#     echo "No se han recibido parámetros"
# else
#     echo "ERROR"
# fi
function check () {
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
        echo "Tienes permiso de ejecución en $1"
    else
        echo "No tienes permiso de ejecución en $1"
    fi
}

if [ $# -eq 1 ]
then
    if [ -f $1 ]
    then
        echo "El parámetro recibido es un fichero regular."
        check $1
    elif [ -d $1 ]
    then
        echo "El parámetro recibido es un directorio."
        check $1
    elif [ -L $1 ]
    then
        echo "El parámetro es un enlace simbólico."
        check $1
    else
        echo "Ha habido un error con el parámetro recibido."
        exit 1
    fi
else
    echo "Número de parámetros incorrecto."
    exit 1
fi