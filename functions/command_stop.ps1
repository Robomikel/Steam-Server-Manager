#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   

#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StopServer {
    If ($appid -eq "996560") { Get-StopMultiple }Else {
        # Write-infoMessageStopping
        # Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) {
            Write-infoMessageNotRunning 
            # Write-Host "----   NOT RUNNING   ----" -F R -B Black
        }
        Else { 
            If ($appid -eq "996560") {
                $process = Get-process "$process"
                $processID = $process.Id
                Stop-Process -id $processID -Force
                New-ServerLog
            }
            Else {
                Stop-Process -Name "$process" -Force 
                Write-infoMessageStopping
                If ($consolelogging -eq "on") { 
                    New-ServerLog
                }
            }
            Get-CheckForError
        }
    }
}
Function Get-StopServerInstall {
    If ($appid -eq "996560") { Get-StopMultiple }Else {
        # Write-infoMessageStopping
        # Write-Host '****   Stopping Server process   *****' -F M -B Black 
        If ($Null -eq (Get-Process "$process" -ea SilentlyContinue)) {
            Write-infoMessageNotRunning 
            # Write-Host "****   No Process found   ****" -F Y -B Black
        }
        Else {
            Write-infoMessageStopping
            #Write-Host "****   Stopping Server Process   *****" -F M -B Black
            Stop-Process -Name "$process" -Force
            New-ServerLog
        }
    }
}   

Function Get-StopMultiple {
    $mprocess = get-process | Where-Object { $_.ProcessName -match $process }
    If ($null -eq $mprocess) {
        Write-infoMessageNotRunning 
        # Write-Host "----   NOT RUNNING   ----" -F R -B Black 
    }
    Else {
        Write-infoMessageStopping
        # Write-Host "****   Stopping Server Process   *****" -F M -B Black
        get-process | Where-Object { $_.ProcessName -match $process } | stop-process -force
        New-ServerLog
    }
}