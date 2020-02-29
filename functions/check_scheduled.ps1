#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ChecktaskUnreg {
    Get-ScheduledTask -TaskName "$serverfiles $command" >$null 2>&1
    If ($?) {
        Add-Content $ssmlog "[$loggingdate] Unregistering scheduled task  "
        Unregister-ScheduledTask -TaskName "$serverfiles $command" >$null 2>&1
    }
    ElseIf (!$?) {
        Add-Content $ssmlog "[$loggingdate] Scheduled Task does not exist "
    }
}
Function Get-ChecktaskDisable {
    If ($Checktask -eq "on") {
        Get-ScheduledTask -TaskName "$serverfiles monitor-job" >$null 2>&1
        If ($?) {
            Add-Content $ssmlog "[$loggingdate] disabling scheduled task "
            Disable-ScheduledTask -TaskName "$serverfiles monitor-job" >$null 2>&1
        }
        ElseIf (!$?) {
            Add-Content $ssmlog "[$loggingdate]  Scheduled Task does not exist "
        }
    }
}
Function Get-ChecktaskEnable {
    if ($Checktask -eq "on") {
        Get-ScheduledTask -TaskName "$serverfiles monitor-job" >$null 2>&1
        If ($?) {
            Add-Content $ssmlog "[$loggingdate] Enabling scheduled task "
            Enable-ScheduledTask -TaskName "$serverfiles monitor-job" >$null 2>&1
        }
        ElseIf (!$?) {
            Add-Content $ssmlog "[$loggingdate] Scheduled Task does not exist "
        }
    }
}
