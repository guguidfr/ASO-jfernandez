#!/bin/bash
# José Daniel Fernández López
# 1/10/2022
# Comprobar el estado de un puerto
# He añaido también otros puertos además del TCP
function check_port (){
    if [ "$2" = "tcp" ]
    then
        local port_status=$(ss -tulwn | grep -i :$1 | grep -i tcp | tail -1 | awk '{print $2}')
        echo "El estado del puerto $1 es: $port_status"
    else
        echo "El estado del puerto $1 es: $(ss -tulwn | grep -i :$1 | grep -i $2 | tail -1 | awk '{print $2}')"
    fi
}

read -p "Introduce el puerto TCP que desea comprobar: " entrada
if [ -z "$entrada" ]
then
    echo "Error al introducir los datos: NO INPUT"
    exit 1
elif [ $entrada -lt 1 ] || [ $entrada -gt 65535 ]
then
    echo "Error al introducir los datos: INVALID PORT"
    exit 1
else
    #echo $(ss -tulwn | grep -i :"$entrada" | head -1 | awk '{print $5}')
    if [ -n "$(ss -tulwn | grep -i :"$entrada" | head -1 | awk '{print $5}')" ]
    then
        port_type=$(ss -tulwn | grep -i :"$entrada" | grep -i tcp)
        port_code=$?
        if [ $port_code -eq 0 ]
        then
            check_port $entrada "tcp"
        else
            get_type=$(ss -tulwn | grep -i :"$entrada" | grep -v tcp | tail -1 | awk '{print $1}')
            echo "¡¡¡El puerto no es TCP!!!"
            echo "El puerto número $entrada es de tipo: $get_type"
            check_port $entrada "$get_type"
        fi
    else
        echo "No se ha encontrado información acerca del puerto $entrada."
    fi
fi
