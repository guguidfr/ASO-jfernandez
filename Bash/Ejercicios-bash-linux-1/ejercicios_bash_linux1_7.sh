#!/bin/bash
# José Daniel Fernández López
# 27-09-2022
# Este script comprobará quién lo está ejecutando. Mostrará un mensaje y tendrá un código de salida dependiendo de quién sea.

# V1 --------------------------------------------------------

#if [ "$USER" = "root" ]
#then
#    echo "Usuario correcto"
#    exit 0
#else
#    echo "Este script debe ser ejecutado como root"
#    exit 1
#fi

# V2 -------------------------------------------------------

if [ $(id -u) -eq 0 ]
then
    echo "Usuario correcto"
    exit 0
else
    echo "Este script debe ser ejecutado como root"
    exit 1
fi