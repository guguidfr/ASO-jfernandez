#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
read -p "Introduce un número del que hacer la tabla de multiplicar: " numero
if [ $numero -le 0 ]
then
    echo "El número debe ser mayor que 0."
    exit 1
fi
for ((i=1;i<=10;i++))
do
    echo "$numero x $i = $(($numero*$i))"
done