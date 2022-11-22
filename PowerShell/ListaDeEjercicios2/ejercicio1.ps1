import-module microsoft.powershell.localaccounts -UseWindowsPowerShell
function New-User {

    param (
        $UserName,
        [securestring]$UserPassword,
        $UserFullname,
        $UserDescription
    )
    $UserName = Read-Host "Introduce el nombre para el nuevo usuario"
    $UserPasswd = Read-Host "Introduce la contraseña para el nuevo usuario" -AsSecureString
    $UserFullname = Read-Host "Introduce el nombre completo del nuevo usuario"
    $UserDescription = Read-Host "Introduce información adicional acerca del nuevo usuario"

    New-LocalUser $UserName -Password $UserPasswd -FullName $UserFullname -Description $UserDescription

}
function New-Password{
    
    param(
        $SelectedUser,
        [securestring]$NewPasswd
    )
    $SelectedUser = Read-Host "Introduce el usuario del que quieres cambiar la contraseña"
    $NewPasswd = Read-Host "Introduce la nueva contraseña" -AsSecureString
    if ((Get-LocalUser -Name "$SelectedUser" 2> $null) -eq $null){
        Write-Output "El usuario $SelectedUser no existe."
    }else{
        Get-LocalUser -Name $SelectedUser | Set-LocalUser -Password $NewPasswd
    }
}
function Disable-User{

    param(
        $SelectedUser
    )
    $SelectedUser = Read-Host "Introduce el nombre del usuario que quieres desactivar"
    if ((Get-LocalUser -Name "$SelectedUser") -eq $False){
        Write-Output "El usuario $SelectedUser no existe."
    }else{
        Disable-LocalUser -Name $SelectedUser
    }
}
function Enable-User{
    param(
        $SelectedUser
    )
    $SelectedUser = Read-Host "Introduce el nombre del usuario que quieres activar"
    if ((Get-LocalUser -Name "$SelectedUser") -eq $False){
        Write-Output "El usuario $SelectedUser no existe."
    }else{
        Enable-LocalUser -Name $SelectedUser
    }
}
function Remove-User{
    param(
        $SelectedUser
    )
    $SelectedUser = Read-Host "Introduce el nombre del usuario que quieres eliminar"
    if ((Get-LocalUser -Name "$SelectedUser") -eq $False){
        Write-Output "El usuario $SelectedUser no existe."
    }else{
        Remove-LocalUser -Name $SelectedUser
    }
}
function Add-UserToGroup{
    param(
        $SelectedUser,
        $SelectedGroup
    )
    $SelectedUser = Read-Host "Introduce el usuario"
    $SelectedGroup = Read-Host "Introduce el grupo al que quieres añadir al usuario $SelectedUser"
    if ((Get-LocalUser -Name "$SelectedUser") -eq $False){
        Write-Output "El usuario $SelectedUser no existe."
    }else{
        if ((Get-LocalGroup -Name "$SelectedGroup") -eq $False){
            Write-Output "El grupo $SelectedGroup no existe."
        }else{
            Add-LocalGroupMember -Group $SelectedGroup -Member $SelectedUser
        }
    }   
}
[bool]$exit = $false
while ($exit -eq $false){
    $opcion = Read-Host "
    Elige una de las opciones:
    1. Listar todos los usuarios.
    2. Crear un usuario local.
    3. Cambiar la contraseña de un usuario.
    4. Desactivar una cuenta de usuario.
    5. Activar una cuenta de usuario.
    6. Eliminar una cuenta de usuario
    7. Añadir un usuario a un grupo de usuarios.
    8. Salir
    ==>"
    if ($opcion -eq 1){
        Clear-Host
        Get-localuser
    }elseif ($opcion -eq 2) {
        New-User
    }elseif ($opcion -eq 3) {
        New-Password
    }elseif ($opcion -eq 4) {
        Disable-User
    }elseif ($opcion -eq 5) {
        Enable-User
    }elseif ($opcion -eq 6) {
        Remove-User
    }elseif ($opcion -eq 7) {
        Add-UserToGroup
    }elseif ($opcion -eq 8) {
        $exit = $True
    }else {
        Write-Output "La opción que has elegido no es válida."
    }
}