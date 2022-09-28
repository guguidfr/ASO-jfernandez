#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script mostrará todos los usuarios que hay en la máquina
totalUsers=$(cat /etc/passwd | awk -F: '{print $1}' | wc -l)
userNames=$(cat /etc/passwd | awk -F: '{print $1}')
echo "Se han encontrado $totalUsers usuarios:"
echo $userNames