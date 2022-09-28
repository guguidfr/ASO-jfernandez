#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script muestra al usuario información sobre la fecha de hoy
dSem=$(date +%A)
Mes=$(date +%B)
Year=$(date +%G)
Hora=$(date +%H:%M)
echo "Bienvenido al sistema $USER"
echo "Hoy es $dSem"
echo "Del mes $Mes"
echo "Del año $Year"
echo "La hora actual es: $Hora"
