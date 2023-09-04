$sourcesPath = 'C:\AllComputersInOU.csv'

$sources = Import-Csv $sourcesPath

$sources | ForEach {
    $compName = $_.DNSHostName
    $reachable = Test-NetConnection -ComputerName $compName | select -ExpandProperty PingSucceeded

    [PSCustomObject]@{
        Host = $compName
        Reachable = $reachable
    }
} | 
Export-Csv C:\Users\Jack\seneca.csv