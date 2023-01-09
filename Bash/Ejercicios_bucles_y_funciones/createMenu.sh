#!/bin/bash
# José Daniel Fernández López
# 19/10/2022
# Crear un menu 
function menu(){
    read -ep "$(printf "Elige una opción [1-4]: \n1. Opción 1 \n2. Opción 2 \n3. Opción 3 \n4. Salir \n--> ")" opcion
    echo "$opcion"
}
function opcion1(){
    echo "Has elegido la opción 1."
    echo ""
}
function opcion2(){
    echo "Has elegido la opción 2."
    echo ""
}
function opcion3(){
    echo "Has elegido la opción 3."
    echo ""
}

#var1=$((opcion_usuario + 1))
#echo "Sin sumar: "$opcion_usuario""
#echo "Sumando 1: $var1"
salir=false
while [ $salir = false ]
do
    opcion_usuario=$(menu)
    if [ "$opcion_usuario" -eq 1 ]
    then    
        opcion1
    elif [ "$opcion_usuario" -eq 2 ]
    then    
        opcion2
    elif [ "$opcion_usuario" -eq 3 ]
    then    
        opcion3
    elif [ "$opcion_usuario" -eq 4 ]
    then    
        salir=true
    else
        echo "Entrada no válida."
    fi
done