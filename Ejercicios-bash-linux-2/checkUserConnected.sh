#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Comprobar los usuarios conectados

function check_exist () {
    id -u $1 > /dev/null 2>&1
    local exists_id=$?
    if [ $exists_id -eq 0 ]
    then
        return 0
    else
        return 1
    fi
}

function check_online () {
    who | grep -oi $1 > /dev/null 2>&1
    local online=$?
    if [ $online -eq 0 ]
    then
        echo "$1 → LOGGED IN"
    else 
        echo "$1 → LOGGED OUT"
    fi
}

if [ $# -ne 1 ]
then
    echo "Número de parámetros incorrecto."
    exit 1
else
    check_exist $1
    ref=$?
    if [ $ref -eq 0 ]
    then
        check_online $1
    else
        echo "El usuario no existe en el sistema."
        exit 1
    fi
fi

# Devuelve a los usuarios conectados:
# who | awk '{print $1}'

# Comprobar si el usuario está conectado:
# who | grep -oi $1
# Si el $?=0 está conectado; si $?=1 no está conectado

# Guarda el uid del usuario
# num_uid = $(id -u $1)
# Si -eq 0 no existe |||| Si -eq 1 sí existe
# grep -oi