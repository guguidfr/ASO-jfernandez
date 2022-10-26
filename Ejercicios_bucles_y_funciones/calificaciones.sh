#!/bin/bash
# José Daniel Fernández López
# 26/10/2022
<<com
    Para que esto funcione correctamente, en el .csv se debe cumplir que:
        1. Los campos del archivo están correctamente alineados en la misma columna estando tabulados
        2. Debe de haber una línea vacía al final del archivo
        3. Al final de cada línea, debe de haber un espacio en blanco
com

function float_to_int(){
    local base10=$(echo "$1*10" | bc)
    local entero=${base10/.*}
    echo $entero
}
function int_to_float(){
    local float=$(echo "scale=1;($1)/10" | bc)
    echo $float
}
function media_del_alumno(){
    local media_alumno=$(echo "scale=1; ($1+$2+$3)/3" | bc)
    local media_int=$(float_to_int $media_alumno)
    echo $media_alumno
    return $media_int
}
function media_de_medias(){
    #local media_todos=0
    local total_entradas=0
    while read -r line
    do
        f_ex1=$(echo $line | awk -F' ' '{print $2}')
        f_ex2=$(echo $line | awk -F' ' '{print $3}')
        f_ex3=$(echo $line | awk -F' ' '{print $4}')

        local f_media_alumno=$(media_del_alumno $f_ex1 $f_ex2 $f_ex3)
        local int_media_alumno=$(float_to_int $f_media_alumno)

        let suma_medias_todos=suma_medias_todos+int_media_alumno
        let total_entradas=total_entradas+1

    done < calificaciones.csv
    local suma_todos=$(echo "scale=1;($suma_medias_todos/$total_entradas)/10" | bc)
    echo $suma_todos
}
function num_espacios(){
    local n_chars=${#1}
    local espacio=" "
    local total_espacios=""
    for ((i=0;i<=$2-$n_chars;i++))
    do
        total_espacios+=$espacio
    done
    echo "$total_espacios"
}

linea="+--------------------------------------------+"
echo "$linea"
echo "| NOMBRE      EX1   EX2   EX3 | MED |  APTO  |"
echo "$linea"
n_aptos=0
total_lineas=0
while read -r line
do
    apto="NO"
    nombre=$(echo $line | awk -F' ' '{print $1}')
    ex1=$(echo $line | awk -F' ' '{print $2}')
    ex2=$(echo $line | awk -F' ' '{print $3}')
    ex3=$(echo $line | awk -F' ' '{print $4}')

    media_alumno=$(media_del_alumno $ex1 $ex2 $ex3)

    if [ $? -ge 50 ]
    then
        apto="SI"
        let n_aptos=n_aptos+1
    fi
    #espacios_relleno=$(num_espacios $nombre)
    echo "| $nombre$(num_espacios $nombre 10) $ex1   $ex2   $ex3 | $media_alumno |   $apto   |"
    #echo "${#nombre}" --> Devuelve el número de caracteres de una cadena
    let total_lineas=total_lineas+1


done < calificaciones.csv

echo "$linea"
t_ex1_int=0
t_ex2_int=0
t_ex3_int=0

while read -r line
do
    # Obtenemos las notas de cada examen de cada alumno
    nota_ex1_f=$(echo $line | awk -F' ' '{print $2}')
    nota_ex2_f=$(echo $line | awk -F' ' '{print $3}')
    nota_ex3_f=$(echo $line | awk -F' ' '{print $4}')

    # Lo transformamos a tipo 'int'
    nota_ex1_int=$(float_to_int $nota_ex1_f)
    nota_ex2_int=$(float_to_int $nota_ex2_f)
    nota_ex3_int=$(float_to_int $nota_ex3_f)

    # Sumamos todos las entradas
    let t_ex1_int=t_ex1_int+nota_ex1_int
    let t_ex2_int=t_ex2_int+nota_ex2_int
    let t_ex3_int=t_ex3_int+nota_ex3_int
done < calificaciones.csv

# Pasamos el total de 'int' a 'float'
t_ex1_f=$(int_to_float $t_ex1_int)
t_ex2_f=$(int_to_float $t_ex2_int)
t_ex3_f=$(int_to_float $t_ex3_int)

# Calculamos la media de cada examen de todos los alumnos
media_ex1=$(echo "scale=1;($t_ex1_f)/$total_lineas" | bc)
media_ex2=$(echo "scale=1;($t_ex2_f)/$total_lineas" | bc)
media_ex3=$(echo "scale=1;($t_ex3_f)/$total_lineas" | bc)
media_de_todos=$(media_de_medias)

echo "| TOTAL       $media_ex1   $media_ex2   $media_ex3 | $media_de_todos |   $n_aptos$(num_espacios $(($n_aptos-1)) 4)|"
echo "$linea"