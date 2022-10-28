#!/bin/bash
# José Daniel Fernández López
# 17/10/2022
file="files.txt"
function checkRoot(){
    if [ $(id -u $USER) -ne 0 ]
    then
        echo "Debes ejecutar el script como root"
        return 1
    else
        return 0
    fi
}
function checkUser(){
    if cat /etc/passwd | grep -i "$1" > /dev/null 2>&1
    then
        return 0
    else
        return 1
    fi
}
function checkGroup(){
    if cat /etc/group | grep -i "$1:" > /dev/null 2>&1
    then
        return 0
    else
        return 1
    fi
}
function createDirectory(){
    if [ -d $1 ]
    then
        echo "El directorio \"$1\" ya existe. No se borrará y creará de nuevo."
        echo "$(date) --- El directorio \"$1\" ya existe." >> fileAutomation.log
        chown $3:$4 $1
        echo "$(date) --- Usuario dueño del directorio \"$1\" cambiado a \"$3\". Grupo dueño del direcotorio \"$1\" cambiado a \"$4\"." >> fileAutomation.log
        chmod $2 $1
        echo ""
        echo "$(date) --- Permisos del directorio \"$1\" cambiados a \"$2\"." >> fileAutomation.log
    else
        mkdir $1
        echo "Direcotrio \"$1\" creado."
        echo "$(date) --- Direcotrio \"$1\" creado." >> fileAutomation.log
        chown $3:$4 $1
        echo "$(date) --- Usuario dueño del directorio \"$1\" cambiado a \"$3\". Grupo dueño del direcotorio \"$1\" cambiado a \"$4\"." >> fileAutomation.log
        chmod $2 $1
        echo ""
        echo "$(date) --- Permisos del directorio \"$1\" cambiados a \"$2\"." >> fileAutomation.log
    fi
}
function createFile(){
    if [ -a $1 ]
    then
        echo "El fichero \"$1\" ya existe. No se borrará y creará de nuevo."
        echo "$(date) --- El fichero \"$1\" ya existe." >> fileAutomation.log
        chown $3:$4 $1
        echo "$(date) --- Usuario dueño del fichero \"$1\" cambiado a \"$3\". Grupo dueño del fichero \"$1\" cambiado a \"$4\"." >> fileAutomation.log
        chmod $2 $1
        echo ""
        echo "$(date) --- Permisos del fichero \"$1\" cambiados a \"$2\"." >> fileAutomation.log
    else
        mkdir $1
        echo "Fichero \"$1\" creado."
        echo "$(date) --- Fichero \"$1\" creado." >> fileAutomation.log
        chown $3:$4 $1
        echo "$(date) --- Usuario dueño del fichero \"$1\" cambiado a \"$3\". Grupo dueño del fichero \"$1\" cambiado a \"$4\"." >> fileAutomation.log
        chmod $2 $1
        echo ""
        echo "$(date) --- Permisos del fichero \"$1\" cambiados a \"$2\"." >> fileAutomation.log
    fi
}
if checkRoot
then
    # echo "Funciona"
    while read -r line
    do
        tipo=$(echo $line | awk -F":" '{print $1}')
        ruta=$(echo $line | awk -F":" '{print $2}')
        permisos=$(echo $line | awk -F":" '{print $3}')
        usuario=$(echo $line | awk -F":" '{print $4}')
        grupo=$(echo $line | awk -F":" '{print $5}')

        if checkUser $usuario 
        then
            echo "El usuario \"$usuario\" existe en el sistema."
            echo "$(date) --- Usuario \"$usuario\" existente en el sistema." >> fileAutomation.log
        else
            echo "El ususario \"$usuario\" no existe en el sistema"
            echo "$(date) --- Error: el usuario \"$usuario\" no existe en el sistema." >> fileAutomation.log
            exit 1
        fi

        if checkGroup $grupo
        then
            echo "El grupo \"$grupo\" existe en el sistema."
            echo "$(date) --- Grupo \"$grupo\" existente en el sistema." >> fileAutomation.log
        else
            echo "El grupo \"$grupo\" no existe en el sistema"
            echo "$(date) --- Error: el grupo \"$grupo\" no existe en el sistema." >> fileAutomation.log
            exit 1
        fi
        if [ "$tipo" == "d" ]
        then
            createDirectory "$ruta" $permisos "$usuario" "$grupo"
        elif [ "$tipo" == "f" ]
        then
            createFile "$ruta" $permisos "$usuario" "$grupo"
        else
            echo "Error: no se ha identificado si se necesita crear un fichero o un directorio"
            echo "$(date) --- Error: no se ha identificado si se necesita crear un fichero o un directorio" >> fileAutomation.log
        fi
        
    done < $file 
    
else
    echo "$(date) --- Error al ejecutar el script: acceso no permitido" >> fileAutomation.log
    exit 1
fi