#!/bin/bash
# José Daniel Fernández López
# 18/10/2022 
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
NONE="\e[0m"
#echo -e "Esto es ${RED}rojo${NONE}, ${YELLOW}amarillo${NONE} y ${GREEN}verde${NONE}"
function logWarn(){
    echo -e "El mensaje en amarillo es: ${YELLOW}$1${NONE}"
}
function logError(){
    echo -e "El mensaje en amarillo es: ${RED}$1${NONE}"
}
function logInfo(){
    echo -e "El mensaje en amarillo es: ${GREEN}$1${NONE}"
}
read -p "Introduce el mensaje que quieres mostrar con colores: " mensaje
logWarn "$mensaje"
logError "$mensaje"
logInfo "$mensaje"