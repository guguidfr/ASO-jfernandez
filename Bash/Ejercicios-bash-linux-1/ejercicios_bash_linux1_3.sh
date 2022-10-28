#!/bin/bash
# José Daniel Fernández López
# 27-09-2002
# Este script muestra información de algunas variables del sistema

echo	"INFORME DEL SISTEMA"

fecha=$(date)
echo "1. Fecha: $fecha"

echo "2. Usuario actual: $USER"

echo "3. Directorio Home del usuario actual: $HOME"

echo "4. Valor del PATH: $PATH"

online=$(who)
echo "5. Usuarios conectados: $online"

last=$(tail -3 /etc/passwd)
echo "6. Nombre de los tres últimos usuarios de /etc/passwd: $last"

first=$(cat /etc/group | head -3)
echo "7. Los tres primeros grupos de /etc/group: $first"

MyUID=$(id -u)
echo "8. UID del usuario actual: $MyUID"

rootShell=$(cat /etc/passwd | head -1 | awk -F: '{print $7}')
echo "9. Shell del usuario root: $rootShell"

totalBash=$(grep -o -i /bin/bash /etc/passwd | wc -l)
echo "10. Número de usuarios que usan por defecto la shell /bin/bash: $totalBash"
