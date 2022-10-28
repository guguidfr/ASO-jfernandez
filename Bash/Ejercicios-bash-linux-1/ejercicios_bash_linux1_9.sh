#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script comprueba que el dato introducido está vacío

read -p "DATO → " temp
if [ -z $temp ]
then
    echo "CORRECTO - DATO VACÍO"
else
    echo "INCORRECTO - INFORMACIÓN INTRODUCIDA"
fi