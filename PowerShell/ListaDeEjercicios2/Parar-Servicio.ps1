param(
    [Parameter(Mandatory=$True)]$Nombre
)
if (($Nombre).Length -eq 0){
    Write-Output "El parámetro `"-Nombre`" no puede estar vacío."
}else{
    if ((get-service -name $Nombre 2> $null | Measure-Object).count -eq 0){
        Write-Output "El servicio `"$Nombre`" no se ha encontrado."
    }elseif (((get-service -Name $Nombre).status) -eq "Stopped"){
        Write-Output "El servicio `"$Nombre`" está parado."
    }else{
        Write-Output "Se va a parar el servicio `"$Nombre`"."
        Read-Host -Prompt "Pulsa enter para pararlo."
        Get-service -Name $Nombre | Stop-Service
    }
}