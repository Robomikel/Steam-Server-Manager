#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-ChecktaskUnreg {
    Get-ScheduledTask -TaskName "$server $command" >$null 2>&1
    If ($?) {
        Write-Host '****   Unregistering scheduled task   ****' -F M -B Black
        Unregister-ScheduledTask -TaskName "$server $command" >$null 2>&1
    }
    If (!$?) {
        Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
    }
}
Function Get-ChecktaskDisable {
    If ($DisableChecktask -eq "1") {
        Get-ScheduledTask -TaskName "$server monitor" >$null 2>&1
        If ($?) {
            Write-Host '****   disabling scheduled task   ****' -F M -B Black
            Disable-ScheduledTask -TaskName "$server monitor" >$null 2>&1
        }
        If (!$?) {
            Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
        }
        Else {
        
        }
    }
}
Function Get-ChecktaskEnable {
    if ($DisableChecktask -eq "1") {
        Get-ScheduledTask -TaskName "$server monitor" >$null 2>&1
    
        If ($?) {
            Write-Host '****   Enabling scheduled task   ****' -F M -B Black
            Enable-ScheduledTask -TaskName "$server monitor" >$null 2>&1
        }
        If (!$?) {
            Write-Host "****   Scheduled Task does not exist   ****" -F Y -B Black
        }
        Else {

        }
    }
}