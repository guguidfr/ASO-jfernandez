# La variable '$args' es una 'array' que contiene todas los argumentos
Write-Host "$args"
Write-Host $args[0]
Write-Host $args[1]
Write-Host $args.Count
Write-Host "Mi nombre es $($args[0]) y mi apellido es $($args[1])"