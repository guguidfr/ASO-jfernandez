#!/bin/bash
# José Daniel Fernández López
# 14/10/2022
while read -r usuario
do
    if grep $usuario /etc/passwd > /dev/null 2>&1
    then
        echo "El directorio home del usuario $usuario es: $(grep $usuario /etc/passwd | awk -F: '{print $6}')"
    else
        echo "El usuario $usuario no existe."
    fi
done < $1