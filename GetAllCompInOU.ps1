Get-ADComputer -Server UNCLE.newcastle.edu.au -Credential jhs345 -Filter * -SearchBase "OU=Labs - Theatres,OU=WindowsTen,OU=Workstations,DC=uncle,DC=newcastle,DC=edu,DC=au" -Properties *  |
 Select -Property Name,DNSHostName,Enabled,LastLogonDate | 
 Export-CSV "C:\AllComputersInOU.csv" -NoTypeInformation -Encoding UTF8