Function Get-ChecktaskUnreg {
    Get-ScheduledTask -TaskName "$global:server $global:command" >$null 2>&1
    If ($?) {
        Write-Host '****   Unregistering scheduled task   ****' -F M -B Black
        Unregister-ScheduledTask -TaskName "$global:server $global:command" >$null 2>&1
    }
    If (!$?) {
        Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
    }
}
Function Get-ChecktaskDisable {
    If ($global:DisableChecktask -eq "1") {
        Get-ScheduledTask -TaskName "$global:server monitor" >$null 2>&1
        If ($?) {
            Write-Host '****   disabling scheduled task   ****' -F M -B Black
            Disable-ScheduledTask -TaskName "$global:server monitor" >$null 2>&1
        }
        If (!$?) {
            Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
        }
        Else {
        
        }
    }
}
Function Get-ChecktaskEnable {
    if ($global:DisableChecktask -eq "1") {
        Get-ScheduledTask -TaskName "$global:server monitor" >$null 2>&1
    
        If ($?) {
            Write-Host '****   Enabling scheduled task   ****' -F M -B Black
            Enable-ScheduledTask -TaskName "$global:server monitor" >$null 2>&1
        }
        If (!$?) {
            Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
        }
        Else {

        }
    }
}