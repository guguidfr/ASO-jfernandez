#!/bin/bash
# José Daniel Fernández López
# 30/09/2022
# Comprobar estado de una máquina mediante un ping


#lpaneque: machine=$1
ping -c 4 $1 > /dev/null 2>&1
check=$?
if [ $check -eq 0 ]
then
    echo "La máquina con la ip $1 responde. ALIVE MACHINE"
else 
    echo "La máquina con la ip $1 no responde. DEAD MACHINE"
fi
