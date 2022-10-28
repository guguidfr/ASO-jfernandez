#!/bin/bash
# José Daniel Fernández López
# 25/10/2022
lenguajes=$(cat lenguajes.txt | awk -F: '{print $2}' | sed 's/,/\n/g' | sort -u)
for lenguaje in $lenguajes
do
    echo "$lenguaje: "
    echo "--> $(grep $lenguaje -i lenguajes.txt | awk -F: '{print $1}' | sed -z 's/\n/,/g;s/,$/\n/')"
    echo ""
done