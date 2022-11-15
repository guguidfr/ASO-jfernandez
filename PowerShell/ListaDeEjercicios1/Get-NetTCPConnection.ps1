(Get-NetTCPConnection -LocalPort 80).OwningProcess
<#
Devuelve el id del proceso que está usando el puerto 80 local
#>