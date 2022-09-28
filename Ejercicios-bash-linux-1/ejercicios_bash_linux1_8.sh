#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script comprueba si se han recibido 3 parámetros.
if [ $# -eq 3 ]
then
    echo "Número de parámetros correcto"
    exit 0
else
    echo "ERROR: número de parámetros incorrecto"
    exit 1
fi