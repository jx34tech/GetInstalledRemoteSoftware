# Prompts for creds using UI prompt
$Credential = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")
$compName = Read-Host "Enter the Computer Name: "
$saveLocation = Read-Host "Please type where to save; screen or log"
if ($saveLocation -eq "screen"){
    Write-Output "Getting installed software ..."
    # Selects and outputs all installed software registered in Programs and Features
    try{
        $output = Get-WmiObject Win32_Product -ComputerName $compName -Credential $Credential | select Name,Version
    }catch{
        Write-Output "This user account does not have permission to run RPC commands, or these commands have been disabled"
    }
    # Force output to screen to ensure that it doesn't get stuck before the script exits.
    Write-Output $output | Out-Host
    # Pause out the output to make sure that you can read the information
    Pause
}else{
    Write-Output "Getting installed software ..."
    $logFileLocation = $compName + ".txt"
    # Same as above version, but with output to both screen and log file.
    try{
        $output = Get-WmiObject Win32_Product -ComputerName $compName -Credential $Credential | select Name,Version
    }catch{
        Write-Output "This user account does not have permission to run RPC commands, or these commands have been disabled"
    }
    Write-Output "Log file was saved as :" $logFileLocation
    Write-Output $output | Out-Host
    Pause
}