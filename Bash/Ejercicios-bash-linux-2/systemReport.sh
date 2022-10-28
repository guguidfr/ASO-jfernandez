#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Crear un informe del sitema
function create_report (){
    separador="------------------------------------------------------------"
    touch report.txt
    echo "FECHA: $(date +%d/%m/%y) - HORA: $(date +%H:%M)" >> report.txt
    echo $separador >> report.txt
    echo "NOMBRE DE LA MÁQUINA: $(echo $HOSTNAME)" >> report.txt
    echo $separador >> report.txt
    echo "IP DE LA MÁQUINA: $(hostname -I | awk '{print $1}')" >> report.txt
    echo $separador >> report.txt
    echo "ESTADO DE LAS PARTICIONES: " >> report.txt
    df >> report.txt
    echo $separador >> report.txt
    echo "ESTADO DE LA MEMORIA:" >> report.txt
    free >> report.txt
}

if [ -f report.txt ]
then
    read -p "El archivo para el informe (report.txt) ya existe. ¿Desea sobreescribirlo? [y/n]: " answ
    if [ "$answ" = "y" ] || [ "$answ" = "Y" ]
    then
        rm -f report.txt
        touch report.txt
        create_report
        exit 0
    elif [ "$answ" = "n" ] || [ "$answ" = "N" ]
    then
        exit 1
    elif [ -z "$answ" ]
    then
        echo "ERROR INESPERADO"
        exit 1
    else
        echo "ERROR INESPERADO"
        exit 1
    fi
else
    create_report
fi