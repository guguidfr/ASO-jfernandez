foreach($line in Get-Content ./powershell/listadeejercicios2/servidores.csv){

    $maquina = $line.Split(',')[0]
    $nombre = $line.Split(',')[1]
    $fecha = get-date -format "dd-mm-yyyy HH:mm"

    # Write-Output "$maquina - $nombre - $fecha"

    if (Test-Connection $maquina -count 4 -Quiet){
        Tee-Object -InputObject "$fecha - $nombre UP." -Path "./powershell/listadeejercicios2/servers.log" -Append
    }else{
        Tee-Object -InputObject "$fecha - $nombre DOWN." -Path "./powershell/listadeejercicios2/servers.log" -Append
    }
}