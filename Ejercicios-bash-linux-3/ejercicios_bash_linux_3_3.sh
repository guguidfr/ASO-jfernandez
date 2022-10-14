#!/bin/bash
# José Daniel Fernández López
# 11/10/2022
read -p "Introduce un número: " numero
echo -n "Hecho con un while: "
i=1
while [ $i -le $numero ]
do
    if [ $(($i % 2)) -eq 0 ]
    then
        echo -n "$i " 
        let i=i+1
    else
        let i=i+1
    fi
done
printf "\nHecho con un for: "
for ((j=1;j<=$numero;j++))
do
    if [ $(($j % 2)) -eq 0 ]
    then
        echo -n "$j " 
    fi
done