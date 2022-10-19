#!/bin/bash
# José Daniel Fernández López
# 19/10/2022
# Crear un menu
function menu(){
    read -ep "$(printf "Elige una opción [1-4]: \n1. Opción 1 \n2. Opción 2 \n3. Opción 3 \n4. Salir \n--> ")" opcion
    echo $opcion
}
opcion_usuario=$(menu)
var1=$((opcion_usuario + 1))
echo "Sin sumar: $opcion_usuario"
echo "Sumando 1: $var1"
