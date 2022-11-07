Param(
    [Parameter(Mandatory=$true)][String]$nombre,
    [Parameter(Mandatory=$True)][String]$apellido
)
Clear-Host
Write-Host "Bienvenido $nombre $apellido"