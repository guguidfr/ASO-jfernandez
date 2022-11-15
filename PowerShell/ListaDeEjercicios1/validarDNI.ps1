$letras_y_resto = @{
    0 = 't'
    1 = 'r'
    2 = 'w'
    3 = 'a'
    4 = 'g'
    5 = 'm'
    6 = 'y'
    7 = 'f'
    8 = 'p'
    9 = 'd'
    10 = 'x'
    11 = 'b'
    12 = 'n'
    13 = 'j'
    14 = 'z'
    15 = 's'
    16 = 'q'
    17 = 'v'
    18 = 'h'
    19 = 'l'
    20 = 'c'
    21 = 'k'
    22 = 'e'
}
$dni = Read-Host "Introduce tu DNI"
[int]$numero = $dni.Substring(0,($dni.Length-1))
$letra = $dni.Substring(($dni.Length-1),1).ToLower()
$modulo = $numero % 23
$correcto = $false
Write-Host "$modulo"
# Write-Output "$numero - $letra - $($numero.GetType())"
if (($modulo -lt 0) -or ($modulo -gt 22)){
    Write-Host "El dni no es válido."
}else{
    foreach($hkey in $letras_y_resto.Keys){
        if($hkey -eq $modulo){
            if($letras_y_resto[$modulo] -eq $letra){
                $correcto = $true
            }
        }
    }
}
if($correcto -eq $true){
    Write-Output "El dni introducido es válido."
}else{
    Write-Output "El dni introducido no es válido."
}