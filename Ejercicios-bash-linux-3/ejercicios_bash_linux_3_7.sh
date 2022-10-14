#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
for usuario in $(cat /etc/passwd | awk -F: '{print $1}')
do
    echo "Hola, $usuario."
done