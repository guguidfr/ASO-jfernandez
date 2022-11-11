#!/bin/bash
# José Daniel Fernández López
# 11/11/2022
function check_parameters(){
    num_parametros=$# # Establecemos nombres para los parámetros
    parametro_control="$1"
    if [ $num_parametros -eq 2 ] && [ "$parametro_control" == "-file" ]
    then
        # Si la entrada es correcta, devolvemos como error un '0' y pasamos la ruta del archivo
        archivo="$2"
        echo $archivo
        return 0
    else
        echo "La llamada al comando debe de ser: pingServersJDFL.sh -file [archivo]"
        return 1
    fi
}
function create_report(){
    # Declaramos las variables necesarias
    archivo_referencia="$1"
    total_down=0
    total_up=0
    num_maquinas=0
    separador="------------------------------------"
    # Empezamos con el informe
    echo "$separador"
    echo "SERVER STATUS - DATE $(date "+%d/%m/%y %H:%M")"
    echo "$separador"
    # El arhivo que leemos debe cumplir que:
    # 1. Al final de cada línea haya un retorno de carro
    # 2. Haya una línea vacía al final del documento
    while read -r linea
    do
        num_maquinas=$(($num_maquinas+1))
        estado="DOWN" # No es necesario establecer el estado 'DOWN' aquí, pero así establecemos un valor por defecto en cada iteración
        maquina=$(echo $linea | awk -F":" '{print $1}')
        direccion=$(echo -E $linea | awk -F":" '{print $2}' | sed 's/\r//g')
        if ping $direccion -c 2 > /dev/null 2>&1 # Ocultamos la salida del comando 'ping'
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
report="serverStatus-JDFL-$(date "+%d%m%y-%H:%M").txt"
archivo_fuente=$(check_parameters $@)
if [ $? -eq 0 ]
then
    # El archivo del informe se creará siempre, pero al preguntarle al usuario si lo quiere guardar:
    # Si el usuario elige que sí, simplemente se hace un 'echo'.
    # Si el usuario elige que no, se forzará la eliminación del informe sin que el usuario se dé cuenta.
    create_report $archivo_fuente > "$report"
    cat "$report"
    entrada_valida=false
    while [ $entrada_valida == false ] # Hasta que el usuario no introduzca un carácter válido, no se terminará el programa
    do
        read -p "¿Quieres guardar el informe? [Y/N]: " respuesta
        if [ "$respuesta" == "Y" ] || [ "$respuesta" == "y" ]
        then
            if [ -a $report ]
            then
                echo "Se creará el archivo."
            else
                echo "El arhivo de desitno no existe. Se creará."
            fi
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
