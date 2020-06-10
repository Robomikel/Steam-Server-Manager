#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ChecktaskUnreg {
    Write-log "Function: Get-ChecktaskUnreg"
    If ($ssmlog -and $loggingdate -and $serverfiles -and $command) {
        Get-ScheduledTask -TaskName "$serverfiles $command" >$null 2>&1
        If ($?) {
            Write-log "Unregistering scheduled task  "
            Unregister-ScheduledTask -TaskName "$serverfiles $command" >$null 2>&1
        }
        ElseIf (!$?) {
            Write-log "Scheduled Task does not exist "
        }
    }
}
Function Get-ChecktaskDisable {
    Write-log "Function: Get-ChecktaskDisable"
    If ($Checktask -eq "on") {
        If ($ssmlog -and $loggingdate -and $serverfiles) {
            Get-ScheduledTask -TaskName "$serverfiles Monitor-job" >$null 2>&1
            If ($?) {
                Write-log "Disabling scheduled task "
                Disable-ScheduledTask -TaskName "$serverfiles Monitor-job" >$null 2>&1
            }
            ElseIf (!$?) {
                Write-log " Scheduled Task does not exist "
            }
        }
    }
}
Function Get-ChecktaskEnable {
    Write-log "Function: Get-ChecktaskEnable"
    if ($Checktask -eq "on") {
        If ($ssmlog -and $loggingdate -and $serverfiles) {
            Get-ScheduledTask -TaskName "$serverfiles Monitor-job" >$null 2>&1
            If ($?) {
                Write-log "Enabling scheduled task "
                Enable-ScheduledTask -TaskName "$serverfiles Monitor-job" >$null 2>&1
            }
            ElseIf (!$?) {
                Write-log "Scheduled Task does not exist "
            }
        }
    }
}

Function Get-ChecktaskDetails {
    Write-log "Function: Get-ChecktaskDetails"
    If ($ssmlog -and $loggingdate -and $serverfiles -and $command) {
        Get-ScheduledTask -TaskName "$serverfiles monitor-job" >$null 2>&1
        If ($?) {
            
            $global:monitorjob = $true
            Write-log "Get-ChecktaskDetails $monitorjob "

        }
        ElseIf (!$?) {

            $global:monitorjob = $false
            Write-log "Get-ChecktaskDetails $monitorjob "


        }
    }
}

Function Get-ChecktaskautorestartDetails {
    Write-log "Function: Get-ChecktaskautorestartDetails"
    If ($ssmlog -and $loggingdate -and $serverfiles -and $command) {
        Get-ScheduledTask -TaskName "$serverfiles autorestart" >$null 2>&1
        If ($?) {
            
            $global:restartjob = $true
            Write-log "Get-ChecktaskautorestartDetails $restartjob "

        }
        ElseIf (!$?) {

            $global:restartjob = $false
            Write-log "Get-ChecktaskautorestartDetails $restartjob "


        }
    }
}