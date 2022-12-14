function Get-Procesos {
    get-process | Select-Object id, ProcessName, CPU | format-table -autosize
}
function Get-TotalProcesos {
    [int]$total = (get-process | measure-object).count
    Write-Host "En total hay $total procesos en ejecución"
}
function Get-ConsumoProcesos {
    get-process | where-object {$_.CPU -gt 30} | format-table -autosize
}
function Stop-Proceso {
    [bool]$error_ocurrido = $false
    try {
        [int]$id = Read-Host "Introduce el PID del proceso que quieres parar" 2> $null
    }
    catch {
        $error_ocurrido = $true
        Write-Host "Debes de introducir un número."
    }
    if($error_ocurrido -eq $false){
        Stop-Process $id > $null 2>&1
        if ($? -eq $false){
            Write-Host "No se ha encontrado el proceso con el PID: $id"
        }
    }    
}
function Show-ProcesosRunning {
    get-service 2> $null | where-object {$_.Status -eq "Running"} | format-table -autosize
}
[bool]$salir = $false
while ($salir -eq $false){
    $opcion = Read-Host "
Elige una de las opciones:
1. Obtener el pid, nombre y el uso de CPU de todos los procesos.
2. Obtener el número total de procesos.
3. Obtener los procesos que han consumido más de treinta segundos de CPU.
4. Finalizar un proceso por PID.
5. Mostrar todos los servicios cuyo estado es Running.
6. Salir
==>"
    if ($opcion -eq 1){
        Get-Procesos
    }elseif ($opcion -eq 2) {
        Get-TotalProcesos
    }elseif ($opcion -eq 3) {
        Get-ConsumoProcesos
    }elseif ($opcion -eq 4) {
        Stop-Proceso
    }elseif ($opcion -eq 5) {
        Show-ProcesosRunning
    }elseif ($opcion -eq 6) {
        $salir = $true
    }else {
        Write-Output "La opción que has elegido no es válida."
    }
}