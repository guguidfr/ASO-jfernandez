#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script muestra el resultado de varias operaciones a partir de los número pasados como argumentos

#total=`expr $1 + $2`
echo "El resultado de $1 + $2 es: $(($1+$2))"
#total=`expr $1 - $2`
echo "El resultado de $1 - $2 es: $(($1-$2))"
#total=`expr $1 \* $2`
echo "El resultado de $1 * $2 es: $(($1*$2))"
#total=`expr $1 / $2`
echo "El resultado de $1 / $2 es: $(($1/$2))"
#total=`expr $1 % $2`
echo "El resultado de $1 % $2 es: $(($1%$2))"
