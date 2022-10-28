#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
read -p "Introduce un número: " numero
if [ $numero -le 0 ]
then
    echo "El número debe ser mayor que 0"
    exit 1
fi
i=1
total=0
while [ $i -le $numero ]
do
    let total=total+i
    let i=i+1
done
echo "El total, hecho con un while, es: $total"
total=0
for ((j=0;j<=$numero;j++))
do
    let total=total+j
done
echo "El total, hecho con un for, es: $total"