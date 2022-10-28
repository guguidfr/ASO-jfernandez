#!/bin/bash
# José Daniel Fernández López
# 14/10/2022
linea=0
while read -r line
do
    let linea=linea+1
    echo "Usuario $linea -> $line"
done < $1