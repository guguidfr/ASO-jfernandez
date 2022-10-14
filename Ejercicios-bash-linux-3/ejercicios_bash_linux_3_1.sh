#!/bin/bash
# José Daniel Fernández López
# 07/10/2022
read -p "Introduce un saludo: " saludo
read -p "Introduce el número de veces que quieres mostrar el saludo: " veces
echo "---------------------"
echo "Con un 'for' estilo 'C':"
for ((i=1;i<=$veces; i++))
do
    echo "$saludo"
done
echo "---------------------"
echo "Con un 'while':"
j=1
while [ $j -le $veces ]
do
    echo "$saludo"
    let j=j+1
done