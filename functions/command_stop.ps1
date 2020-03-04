#.::::::.::::::::::::.,::::::   :::.     .        :   .::::::.:::::::.. :::      .::..        :    .,-:::::/ :::::::..   

#;;;`    `;;;;;;;;'''';;;;''''   ;;`;;    ;;,.    ;;; ;;;`    `;;;;``;;;;';;,   ,;;;' ;;,.    ;;; ,;;-'````'  ;;;;``;;;;  
#'[==/[[[[,    [[      [[cccc   ,[[ '[[,  [[[[, ,[[[[,'[==/[[[[,[[[,/[[[' \[[  .[[/   [[[[, ,[[[[,[[[   [[[[[[/[[[,/[[['  
#  '''    $    $$      $$""""  c$$$cc$$$c $$$$$$$$"$$$  '''    $$$$$$$c    Y$c.$$"    $$$$$$$$"$$$"$$c.    "$$ $$$$$$c    
# 88b    dP    88,     888oo,__ 888   888,888 Y88" 888o88b    dP888b "88bo, Y88P      888 Y88" 888o`Y8bo,,,o88o888b "88bo,
#  "YMmMY"     MMM     """"YUMMMYMM   ""` MMM  M'  "MMM "YMmMY" MMMM   "W"   MP       MMM  M'  "MMM  `'YMUP"YMMMMMM   "W" 
#
#
Function Get-StopServer {
    If ($appid -eq "996560") { 
        Get-StopMultiple 
    }
    Else {
        If ($process) {
            If ( !(Get-Process $process -ea SilentlyContinue)) {
                $global:infomessage = "notrunning"
                Get-Infomessage
            }
            Else { 
                If ($appid -eq "996560") {
                    $process = Get-Process $process -ea SilentlyContinue
                    $processID = $process.Id
                    $global:warnmessage = "stop"
                    Get-warnmessage
                    Stop-Process -id $processID -Force
                    Start-Sleep 3
                    $processstatus = Get-Process $process -ea SilentlyContinue 
                    If ($processstatus) {
                        $global:warnmessage = "stoppedfailed"
                        Get-warnmessage
                        
                    }
                    If ($consolelogging -eq "on") {   
                        New-ServerLog
                    }
                }
                Else {
                    Stop-Process -Name $process -Force 
                    Start-Sleep 3
                    $processstatus = Get-Process $process -ea SilentlyContinue
                    If ($processstatus) {
                        $global:warnmessage = "stoppedfailed"
                        Get-warnmessage
                        
                    }
                    Elseif (!$processstatus) {
                        $global:infomessage = "stopped"
                        Get-Infomessage
                    }
                    If ($consolelogging -eq "on") { 
                        New-ServerLog
                    }
                   
                }
                Get-CheckForError
            }
        }
        Else {
            $global:warnmessage = "fn_Get-StopServer"
            Get-warnmessage
        }
    }
}
Function Get-StopServerInstall {
    If ($appid -eq "996560") { 
        Get-StopMultiple 
    }
    Else {
        If ($process) {
            If (! (Get-Process $process -ea SilentlyContinue)) {
                $global:infomessage = "notrunning"
                Get-Infomessage
            }
            Else {
                $global:infomessage = "stopping"
                Get-Infomessage
                Stop-Process -Name "$process" -Force
                Start-Sleep 3
                $processstatus = Get-Process $process -ea SilentlyContinue
                If ($processstatus) {
                    $global:warnmessage = "stoppedfailed"
                    Get-warnmessage
                    
                }
                Elseif (!$processstatus) {
                    $global:infomessage = "stopped"
                    Get-Infomessage
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
    If ($process ) {
        $mprocess = get-process | Where-Object { $_.ProcessName -match $process }
        If (!($mprocess)) {
            $global:infomessage = "notrunning"
            Get-Infomessage
        }
        Else {
            $global:infomessage = "stopping"
            Get-Infomessage
            get-process | Where-Object { $_.ProcessName -match $process } | stop-process -force
            Start-Sleep 3
            $processstatus = Get-process $mprocess -ea SilentlyContinue
            If ($processstatus) {
                $global:warnmessage = "stoppedfailed"
                Get-warnmessage
                
            }
            Elseif (!$processstatus) {
                $global:infomessage = "stopped"
                Get-Infomessage
            }
            If ($consolelogging -eq "on") { 
                New-ServerLog
            }
            Get-CheckForError
        }
    }
    Else {
        $global:warnmessage = "fn_Get-StopServerintall"
        Get-warnmessage
    }
}