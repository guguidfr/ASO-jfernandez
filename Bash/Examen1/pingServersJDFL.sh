#!/bin/bash
# José Daniel Fernández López
# 11/11/2022
function check_parameters(){
    num_parametros=$#
    parametro_control="$1"
    if [ $num_parametros -eq 2 ] && [ "$parametro_control" == "-file" ]
    then
        archivo="$2"
        echo $archivo
        return 0
    else
        echo "La llamada al comando debe de ser: pingServersJDFL.sh -file [archivo]"
        return 1
    fi
}
function create_report(){
    archivo_referencia="$1"
    total_down=0
    total_up=0
    num_maquinas=0
    separador="------------------------------------"
    echo "$separador"
    echo "SERVER STATUS - DATE $(date "+%d/%m/%y %H:%M")"
    echo "$separador"
    while read -r linea
    do
        num_maquinas=$(($num_maquinas+1))
        estado="DOWN"
        maquina=$(echo $linea | awk -F":" '{print $1}')
        direccion=$(echo -E $linea | awk -F":" '{print $2}' | sed 's/\r//g')
        if ping $direccion -c 2 > /dev/null 2>&1
        then
            estado="UP"
            echo "$maquina: $estado"
            total_up=$(($total_up+1))
        else
            echo "$maquina: $estado"
            total_down=$(($total_down+1))
        fi
    done < $archivo_referencia
    echo "$separador"
    echo "STATISTICS"
    echo "$separador"
    echo "$num_maquinas --> Número de servidores analizados."
    echo "$total_up --> Número de servidores UP."
    echo "$total_down --> Número de servidores DOWN."
    echo "$separador"
    echo "END REPORT - BY JOSÉ DANIEL"
    echo "$separador"
}
archivo_fuente=$(check_parameters $@)
report="serverStatus-JDFL-$(date "+%d%m%y-%H:%M").txt"
if [ $? -eq 0 ]
then
    #echo $archivo_fuente
    #touch "serverStatus-JDFL-$(date "+%d/%m/%y %H:%M").txt"
    create_report $archivo_fuente > "$report"
    cat "$report"
    entrada_valida=false
    while [ $entrada_valida == false ]
    do
        read -p "¿Quieres guardar el informe? [Y/N]: " respuesta
        if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ]
        then
            entrada_valida=true
            echo "Guardando el informe..."
            sleep 2
            echo "Informe guardado en: $report"
        elif [ "$respuesta" == "N" ] || [ "$respuesta" == "n" ]
        then
            entrada_valida=true
            echo "Limpiando..."
            rm -f $report
            sleep 2
            echo "¡Terminado!¡Pasa un buen día!"
        else
            echo "La opción que has elegido no es válida. Prueba otra vez."
        fi
    done

else
    echo $archivo_fuente
    exit 1
fi
