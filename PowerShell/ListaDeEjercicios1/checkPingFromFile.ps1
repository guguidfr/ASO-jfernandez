get-content ./powershell/listadeejercicios1/direcciones.txt | ForEach-Object {
    if (Test-Connection $_ -count 2 -Quiet){
        Write-Output "Hay conexión con $_"
    }else{
        Write-Output "No hay conexión con $_"
    }
}