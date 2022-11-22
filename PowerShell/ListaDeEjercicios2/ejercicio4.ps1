function Get-Ip{
    Get-NetIPAddress -AddressFamily IPv4 | format-list -property IPAddress,InterfaceAlias
    
}
function Test-Conectividad{
    Test-NetConnection > $null 2>&1
    if ($? -eq $True){
        Write-Output "Tienes conexión a Internet."
    }else{
        Write-Output "No tienes conexión a Internet."
    }
}
function Get-InterfacesRed{
    Get-NetAdapter
}

function Set-StaticIP {
    $Direccion = Read-Host "Introduce la nueva ip"
    $Mascara = Read-Host "Introduce la mascara de red en bits"
    $PuertaDeEnlace = Read-Host "Introduce la dirección IP de la puerta de enlace"    
    (get-netAdapter).name
    $Interfaz = Read-Host "De las interfaces anteriores, escribe el nombre de la que quieres cambiar la IP"
    try {
        New-NetIPAddress –IPAddress $Direccion -DefaultGateway $PuertaDeEnlace -PrefixLength $Mascara -InterfaceAlias $Interfaz 2> $null
    }
    catch {
        Write-Output "No se ha podido cambiar la IP."
    }
}
function Set-DHCP{
    (get-netAdapter).name
    $Interfaz = Read-Host "De las interfaces anteriores, escribe el nombre de la que quieres cambiar la IP"
    try {
        Set-NetIPInterface -InterfaceAlias $Interfaz -Dhcp Enabled 2> $null
    }
    catch {
        Write-Output "No se ha podido cambiar la IP a dinámica."
    }
}

[bool]$salir = $false
while ($salir -eq $false){
    $opcion = Read-Host "
    Elige una de las opciones:
    1. Mostrar la dirección IPv4 de cada interfaz de red disponible.
    2. Comprobar la conectividad.
    3. Mostrar las interfaces de red físicas, su descripción e información adicional.
    4. Establecer una IP estática.
    5. Establecer la IP a dinámica mediante DHCP.
    6. Salir
    ==>"
    if ($opcion -eq 1) {
        Get-Ip
    }elseif ($opcion -eq 2) {
        Test-Conectividad
    }elseif ($opcion -eq 3) {
        Get-InterfacesRed
    }elseif ($opcion -eq 4) {
        Set-StaticIP
    }elseif ($opcion -eq 5) {
        Set-DHCP
    }elseif ($opcion -eq 6) {
        $salir = $true
    }else {
        Write-Output "La opción que has elegido no es válida."
    }
}