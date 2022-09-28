#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script comparará los números recibidos como argumentos
if [ $1 -gt $2 ]
then
    echo "El primer número es mayor que el segundo"
elif [ $2 -gt $1 ]
then
    echo "El segundo número es mayor que el primero"
else
    echo "Los números son iguales"
fi