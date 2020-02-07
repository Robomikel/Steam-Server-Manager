Function Get-AdminCheck {
    $user = "$env:COMPUTERNAME\$env:USERNAME"
    $group = 'Administrators'
    $isInGroup = (Get-LocalGroupMember $group).Name -contains $user
    If ($isInGroup -eq $true) {
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
        Write-Host "                 $global:DIAMOND $global:DIAMOND Do Not Run as an Admin account $global:DIAMOND $global:DIAMOND" -F R -B Black
        Write-Host "***  Please Create a Non Admin Account to run script and game server  ******" -F Y -B Black
        Write-Host "----------------------------------------------------------------------------" -F Y -B Black
    }
}