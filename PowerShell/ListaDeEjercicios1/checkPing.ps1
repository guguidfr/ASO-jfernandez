if (Test-Connection 8.8.8.8 -Count 2){
    Write-Output "Hay conexión"
}