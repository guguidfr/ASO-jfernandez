#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script recibirá un número por teclado e identificará si es positivo, negativo, o cero
read -p "Introduce cualquier número: " num
if [ $num -eq 0 ]
then
    echo "El número es cero"
    exit 0
elif [ $num -lt 0 ]
then
    echo "El número es negativo"
    exit 1
elif [ $num -gt 0 ]
then 
    echo "El número es positivo"
    exit 2
else
    echo "Error con el número introducido"
    exit 3
fi