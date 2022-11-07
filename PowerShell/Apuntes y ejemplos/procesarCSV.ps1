# Porcesar un csv

$archivo = Get-Content './Powershell/Apuntes y ejemplos/modulos2.csv'
foreach ($linea in $archivo){
    # Cada línea contará con 2 campos, de la forma: modulo,horas
    [string]$modulo = $linea.Split(",")[0]
    [string]$horas = $linea.Split(",")[1]
    Write-Host "El módulo '$modulo' tiene '$horas' horas"
}