$Credential = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")
$compName = Read-Host "Enter the Computer Name: "
Write-Output "Getting installed software ..."
$output = Get-WmiObject Win32_Product -ComputerName $compName -Credential $Credential | select Name,Version
Write-Output $output | Out-Host
Pause