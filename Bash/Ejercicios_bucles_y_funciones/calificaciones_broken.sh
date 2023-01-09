#!/bin/bash
# José Daniel Fernández López
# 26/10/2022
linea="+-----------------------------------------+"
pipe="|"
echo "$linea"
echo "| NOMBRE  EX1 EX2 EX3 |   MED   |   APTO  |"
echo "$linea"
while IFS=$'\t' read -r nombre examen1 examen2 examen3 # -a unaArray
do
    apto="NO"
    #nombre=${unaArray[0]}
    #examen1=${unaArray[1]}
    #examen2=${unaArray[2]}
    #examen3=${unaArray[3]}
    #echo "$apto"
    #echo "$nombre"
    #echo "$examen1 $examen2 $examen3"
    media_alumno=$(echo "scale=1; ($examen1+$examen2+$examen2)/3" | bc)
    media2=$(echo "$media_alumno*10" | bc)
    media_int=${media2/.*}
    #echo "$media_int"
    #echo "$media_alumno"
    if [ $media_int -ge 50 ]
    then
        apto="SI"
    fi
    #echo "la media transformada: $media_int"
    #echo "| $nombre $examen1  $examen2  $examen3 patata almendra"
    #echo "$linea"
    
done < calificaciones.csv
<<com
    El script funciona, pero a la hora de mostrar por pantalla las variables en la línea 29,
    el orden de estas deja de tener sentido y los resultados se superponen.
    He probado el mismo script en 3 máquina diferentes, y pasa exactamente lo mismo.

    Puede que sea por el delimitador que es un "tabulador"(?)
    Poniendo un "espacio" en lugar de un "tabulador" pasa lo mismo.
com