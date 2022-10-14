#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Script para crear un directorio si no existe
read -p "Introduce la ruta completa de un directorio: " ruta
if [ -d "$ruta" ]
then
    echo "El directorio ya existe."
else
    read -p "El directorio no existe. ¿Desea crearlo? [y/n]: " resp
    # lpaneque: Recuerda que las cadenas de texto van entre comillas $resp = "y"
    if [ "$resp" = "y" ] || [ "$resp" = "Y" ] # Comillas añadidas el 04/10/2022
    then
        mkdir "$ruta"
        # lpaneque: Otra forma de hacer esto: if mkdir "$ruta"; then
        if [ -d "$ruta" ]
        then
            echo "Directorio creado correctamente."
            exit 0
        else
            echo "Ha habido un error y no se ha creado el directorio."
            exit 1
        fi
    # lpaneque: Igual que antes, texto entre comillas
    elif [ "$resp" = "n" ] || [ "$resp" = "N" ] # Comillas añadidas el 04/10/2022
    then
        echo "El directorio no se ha creado."
        exit 0
    else
        # lpaneque: Más bien, ha introducido un valor incorrecto.
        echo "Ha ocurrido un error con valor introducido." # Correción hecha el 04/10/2022
        exit 1
    fi
fi
