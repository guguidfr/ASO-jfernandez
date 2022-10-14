#!/bin/bash
# José Daniel Fernández López
# 14/10/2022
while read -r linea 
do
    nombre=$(echo $linea | awk -F";" '{print $1}')
    edad=$(echo $linea | awk -F";" '{print $2}')
    echo "$nombre tiene $edad años."
done < $1
echo "---------------------------------------"
echo "Con IFS: "

while IFS=";" read -r usuario anyos 
do
    #nombre=$(echo $linea | awk -F";" '{print $1}')
    #edad=$(echo $linea | awk -F";" '{print $2}')
    echo "$usuario tiene $anyos años."
done < $1