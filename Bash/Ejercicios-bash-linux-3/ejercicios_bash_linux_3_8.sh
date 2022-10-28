#!/bin/bash
# José Daniel Fernández López
# 13/10/2022
read -p "Introduce la altura: " alto
read -p "Introduce el ancho: " ancho
for ((i=1;i<=$alto;i++))
do
    for ((j=1;j<=$ancho;j++))
    do
        echo -n "*"
    done
    printf "\n"
done