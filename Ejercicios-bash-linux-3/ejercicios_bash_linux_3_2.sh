#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
read -p "Introduce un número: " numero
echo -n "Hecho con un while: "
i=1
while [ $i -le $numero ]
do
    echo -n "$i " 
    let i=i+1
done
printf "\nHecho con un for: "
for ((j=1;j<=$numero;j++))
do
    echo -n "$j " 
done