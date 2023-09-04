$domain = UNCLE.newcastle.edu.au
$cred = jhs345
$ouSearchBase = "OU=WindowsTen,OU=Workstations,DC=uncle,DC=newcastle,DC=edu,DC=au"
$exportLocation = "C:\THEAComputers.csv"
Get-ADComputer -Server $domain -Credential $cred -LDAPFilter "(Name=THEA-* or Name=*-T)" -SearchBase $ouSearchBase -Properties * | Select-Object -Property Name,DNSHostName,Enabled,LastLogonDate,IPv4Address | Export-CSV $exportLocation -NoTypeInformation -Encoding UTF8