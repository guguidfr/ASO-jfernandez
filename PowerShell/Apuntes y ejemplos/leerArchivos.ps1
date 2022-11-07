# Leer el contenido de un fichero
Write-Host "Forma 1"
$modulos = Get-Content './Powershell/Apuntes y ejemplos/modulos.txt'
foreach ($linea in $modulos){
    Write-Host("Matriculado en: $linea")
}

Write-Host "-----------------------"

Write-Host "Forma 2"
Get-Content './Powershell/Apuntes y ejemplos/modulos.txt' | ForEach-Object {Write-Host "Matriculado en: $_"}

