get-process | select-object id, cpu, ProcessName | Export-Csv -path procesos.csv