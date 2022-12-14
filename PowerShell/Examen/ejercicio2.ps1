foreach($line in Get-Content D:\GitHub-Windows\ASO-jfernandez\rutas.txt){
    if(Test-Path $line){
        Write-Host "El archivo `"$line`" EXISTE"
    }else {
        Write-Host "El archivo `"$line`" NO EXISTE"
    }
}