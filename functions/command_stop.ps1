#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   
#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StopServer {
    Write-log "Function: Get-StopServer"
    If ($appid -eq "996560") { 
        Get-StopMultiple 
    }
    Else {
        If ($process) {
            If ( !(Get-Process $process -ea SilentlyContinue)) {
                Get-Infomessage "notrunning" 'info'
            }
            Else { 
                Get-Infomessage "stopping" 'start'
                #Stop-Process -Name $process -Force 
                Write-log "Stop Process: $process"
                $p = Get-Process $process -ErrorAction SilentlyContinue
                Write-log "Process ID: $($p.id)"
                $wshell = New-Object -ComObject wscript.shell
                if (@(443030, 896660 ) -contains $appid) {
                    Write-log "Send CTL+C"
                    $r = $wshell.AppActivate("$($p.Id)")
                    $wshell.Sendkeys("^{c}")
                }
                Else {
                    [void]$p.CloseMainWindow()
                }
                Start-Sleep 5
                if (!$p.HasExited) {
                    Write-log "Waiting Process: $($p.Name) "
                    #$wshell = New-Object -ComObject wscript.shell
                    $r = $wshell.AppActivate("$($p.Id)"); $wshell.Sendkeys("%(Y)")
                    #$p.WaitForExit()
                    $p | Wait-Process -Timeout 3 -ErrorAction SilentlyContinue
                }
                $processstatus = Get-Process $process -ea SilentlyContinue
                If ($processstatus) {
                    Get-Infomessage " smooth stop failed" 'warning'
                    Get-Infomessage " force stopping" 'info'
                    Stop-Process -Name $process -Force
                    Start-Sleep 5
                    $processstatus = Get-Process $process -ea SilentlyContinue
                    If ($processstatus) {
                        Get-warnmessage "stoppedfailed"
                    }
                    Elseif (!$processstatus) {
                        Get-Infomessage "stopped" 
                    }
                }
                Elseif (!$processstatus) {
                    Get-Infomessage "stopped" 
                }
                If ($consolelogging -eq "on") { 
                    New-ServerLog
                }
                Get-CheckForError
            }
        }
        Else {
            Get-warnmessage "fn_Get-StopServer"
        }
    }
}
Function Get-StopServerInstall {
    Write-log "Function: Get-StopServerInstall"
    If ($appid -eq "996560") { 
        Get-StopMultiple 
    }
    Else {
        If ($process) {
            If (! (Get-Process $process -ea SilentlyContinue)) {
                Get-Infomessage "notrunning" 'info'
            }
            Else {
                Get-Infomessage "stopping" 'start'
                #Stop-Process -Name "$process" -Force
                Write-log "Stop Process: $process"
                $p = Get-Process $process -ErrorAction SilentlyContinue
                Write-log "Process ID:  $($p.id)"
                $wshell = New-Object -ComObject wscript.shell
                if ($appid -eq 443030) {
                    $r = $wshell.AppActivate("$($p.Id)")
                    $wshell.Sendkeys("^{c}")
                }
                Else {
                    [void]$p.CloseMainWindow()
                }
                Start-Sleep 5
                if (!$p.HasExited) {
                    Write-log "Waiting Process: $($p.Name) "
                    #$wshell = New-Object -ComObject wscript.shell
                    $r = $wshell.AppActivate("$($p.Id)"); $wshell.Sendkeys("%(Y)")
                    #$p.WaitForExit()
                    $p | Wait-Process -Timeout 3 -ErrorAction SilentlyContinue
                }
                $processstatus = Get-Process $process -ea SilentlyContinue
                If ($processstatus) {
                    Get-Infomessage " smooth stop failed" 'warning'
                    Get-Infomessage " force stopping" 'info'
                    Stop-Process -Name $process -Force
                    Start-Sleep 5
                    $processstatus = Get-Process $process -ea SilentlyContinue
                    If ($processstatus) {
                        Get-warnmessage "stoppedfailed"
                    }
                    Elseif (!$processstatus) {
                        Get-Infomessage "stopped" 
                    }
                }
                Elseif (!$processstatus) {
                    Get-Infomessage "stopped" 
                }
                If ($consolelogging -eq "on") { 
                    New-ServerLog
                }
            }
            Get-CheckForError
        }
    }
}   
Function Get-StopMultiple {
    Write-log "Function: Get-StopMultiple"
    If ($process ) {
        $mprocess = get-process | Where-Object { $_.ProcessName -match $process }
        If (!$mprocess) {
            Get-Infomessage "notrunning" 'info'
        }
        Else {
            Get-Infomessage "stopping" 'start'
            $p = get-process | Where-Object { $_.ProcessName -match $process }
            $p | foreach {
                [void]$p.CloseMainWindow()
                Start-Sleep 5
                if (!$p.HasExited) {
                    Write-log "Waiting Process: $($p.Name) "
                    $wshell = New-Object -ComObject wscript.shell
                    $r = $wshell.AppActivate("$($p.Id)"); $wshell.Sendkeys("%(Y)")
                    #$p.WaitForExit()
                    $p | Wait-Process -Timeout 3 -ErrorAction SilentlyContinue
                }
                $mprocess = get-process | Where-Object { $_.ProcessName -match $process }
                If ($mprocess) {
                    Get-Infomessage " smooth stop failed" 'warning'
                    Get-Infomessage " force stopping" 'info'
                    Stop-Process -Name $process -Force
                    Start-Sleep 5
                }
                Elseif (!$processstatus) {
                    Get-Infomessage "stopped" 
                }
            }
            $mprocess = get-process | Where-Object { $_.ProcessName -match $process }
            If ($mprocess) {
                Get-warnmessage "stoppedfailed"
                
            }
            Elseif (!$processstatus) {
                Get-Infomessage "stopped" 
            }
            If ($consolelogging -eq "on") { 
                New-ServerLog
            }
            Get-CheckForError
        }
    }
    Else {
        Get-warnmessage "fn_Get-StopServerintall"
    }
}