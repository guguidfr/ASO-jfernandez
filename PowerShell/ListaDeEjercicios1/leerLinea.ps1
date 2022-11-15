<#
$contador = 0
foreach($line in Get-Content notas.txt) {
    $contador += 1
    Write-Output "$contador - $line"
}
#>
$contador = 0
get-content notas.txt | ForEach-Object {
    $contador += 1
    Write-Output "$contador - $_"
}