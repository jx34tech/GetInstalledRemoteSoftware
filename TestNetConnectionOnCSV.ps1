$sourcesPath = 'C:\CDComputers.csv'

$sources = Import-Csv $sourcesPath

$sources | ForEach {
    $compName = $_.DNSHostName
    $reachable = Test-NetConnection -ComputerName $compName

    [PSCustomObject]@{
        Host = $compName
        Reachable = $reachable
    }
} | 
Export-Csv C:\Users\Jack\sccm.csv