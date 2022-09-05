$Credential = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")
$compName = Read-Host "Enter the Computer Name: "
$saveLocation = Read-Host "Please type where to save; screen or log"
if ($saveLocation -eq "screen"){
    Write-Output "Getting installed software ..."
    $output = Get-WmiObject Win32_Product -ComputerName $compName -Credential $Credential | select Name,Version
    Write-Output $output | Out-Host
    Pause
}else{
    Write-Output "Getting installed software ..."
    $logFileLocation = $compName + ".txt"
    $output = Get-WmiObject Win32_Product -ComputerName $compName -Credential $Credential | select Name,Version | Out-File $logFileLocation
    Write-Output $output | Out-Host
    Pause
}